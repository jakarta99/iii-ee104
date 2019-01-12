package team.lala.timebank.service;

import java.io.File;
import java.io.FileOutputStream;
import java.security.Principal;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import lombok.extern.slf4j.Slf4j;
import team.lala.timebank.dao.MemberDao;
import team.lala.timebank.dao.OrderDao;
import team.lala.timebank.dao.PenaltyDao;
import team.lala.timebank.dao.SystemMessageDao;
import team.lala.timebank.entity.Member;
import team.lala.timebank.entity.Order;
import team.lala.timebank.entity.Penalty;
import team.lala.timebank.entity.SystemMessage;
import team.lala.timebank.enums.ReportStatus;
import team.lala.timebank.enums.SystemMessageType;
import team.lala.timebank.enums.YesNo;

@Slf4j
@Service
@Transactional
public class PenaltyService {

	@Autowired
	private PenaltyDao penaltyDao;

	@Autowired
	private OrderDao orderDao;

	@Autowired
	private MemberDao memberDao;

	@Autowired
	private SystemMessageDao systemMessageDao;

	// Jasmine
	// 點選一筆order後，判斷是否有檢舉紀錄，以及被檢舉人是誰。如無檢舉紀錄則無法進入填寫檢舉之畫面
	// 進入檢舉畫面會將相關資料帶入(被檢舉人、活動名稱....)，但還不寫入DB
	public Penalty checkRecordandProvidePenalty(Long orderId, Principal principal) {
		Order thisOrder = orderDao.getOne(orderId);
		Member accuser = memberDao.findByAccount(principal.getName());

		List<Penalty> penalties = findByOrder(thisOrder);// 查出這筆order的所有檢舉紀錄

		if (penalties.size() > 0) { // 該筆order有檢舉紀錄(有雙向檢舉之可能，故需判斷檢舉紀錄的檢舉者是否相同)
			for (Penalty p : penalties) {
				if (p.getAccuser().equals(accuser)) { // 該筆order的檢舉人與目前登入會員相同(不得再次提出檢舉)
					return null;
				}
			}
		}

		Member defendant;
		if (accuser == thisOrder.getMission().getMember()) {// 如果檢舉者是雇主
			defendant = thisOrder.getVolunteer();// 被告就是志工
		} else {
			defendant = thisOrder.getMission().getMember();
		}
		Penalty penalty = new Penalty();
		penalty.setAccuser(accuser);
		penalty.setOrder(thisOrder);
		penalty.setDefendant(defendant);
		penalty.setStatus(1);
		return penalty;

	}
	
	
	
	
	// Jasmine 完成審核，寄站內信給檢舉人，修改Order中ReportStatus的狀態
	public void sendSystemMessageToAccuser(Penalty penalty) {
		Member sender = (Member) SecurityContextHolder.getContext() // 管理員會員(寄件者)
				.getAuthentication().getPrincipal();

		if (penalty != null) {
			//修改Order中ReportStatus的狀態
			if(penalty.getStatus().equals(2)) { //如果審核結果須懲罰
				penalty.getOrder().setReportStatus(ReportStatus.TemporarilyEnd);
			}
			
			if(penalty.getStatus().equals(3)) { //如果審核結果不須懲罰
				penalty.getOrder().setReportStatus(ReportStatus.Finish);
			}
			
			
			//寄信給檢舉人
			SystemMessage systemMessage = new SystemMessage();
			systemMessage.setMember(penalty.getAccuser());// 系統訊息給檢舉人
			systemMessage.setMessageType(SystemMessageType.ReplyPenaltyReport);
			systemMessage.setReadStatus(YesNo.N);
			systemMessage.setReleaseTime(new java.util.Date());
			systemMessage.setSender(sender);
			systemMessage.setPenalty(penalty);
			systemMessage.setMessage("謝謝您的檢舉，TimeBank已完成您的檢舉案的審核及處置。");
			systemMessageDao.save(systemMessage);
			// 補邏輯:訊息送出後，紀錄在penalty表內(有寄信)，加entity欄位
		}
	}

	// Jasmine 完成審核且確定有懲罰與扣款，則寄站內信給被檢舉人(被告)
	public void sendSystemMessageToDefendant(Penalty penalty) {
		Member sender = (Member) SecurityContextHolder.getContext() // 管理員會員(寄件者)
				.getAuthentication().getPrincipal();
		//修改Order中ReportStatus的狀態
		penalty.getOrder().setReportStatus(ReportStatus.TemporarilyEnd);
		
		//寄信給被檢舉人
		if (penalty != null) {
			SystemMessage systemMessage = new SystemMessage();
			systemMessage.setMember(penalty.getDefendant());// 系統訊息給檢舉人
			systemMessage.setMessageType(SystemMessageType.Penalty);
			systemMessage.setReadStatus(YesNo.N);
			systemMessage.setReleaseTime(new java.util.Date());
			systemMessage.setSender(sender);
			systemMessage.setMessage("[扣除時數]原因:檢舉, 檢舉原因:" + penalty.getDescription() + ", 活動名稱:" + penalty.getOrder().getMission().getTitle());
			systemMessage.setPenalty(penalty);
			systemMessageDao.save(systemMessage);
			// 補邏輯:訊息送出後，紀錄在penalty表內(有寄信)，加entity欄位
		}
	}
	
	// Jasmine 完成申訴審核後，寄站內信給被申訴人(被告)
	public void sendSystemMessageToDefendantAfterReVertify(Penalty penalty) {
		Member sender = (Member) SecurityContextHolder.getContext() // 管理員會員(寄件者)
				.getAuthentication().getPrincipal();
		//修改Order中ReportStatus的狀態
		penalty.getOrder().setReportStatus(ReportStatus.Finish);
		
		//寄信給被檢舉人
		if (penalty != null) {
			SystemMessage systemMessage = new SystemMessage();
			systemMessage.setMember(penalty.getDefendant());
			systemMessage.setMessageType(SystemMessageType.ReplyTheRevertifyApply);
			systemMessage.setReadStatus(YesNo.N);
			systemMessage.setReleaseTime(new java.util.Date());
			systemMessage.setSender(sender);
			
			//根據不同申訴結果，設定不同的訊息內容
			String message = "[申訴結果]";
			if(penalty.getPenaltyTimeValue().equals(penalty.getReVertifyPenaltyTimeValue())) {
				message += "駁回申訴，原因:" + penalty.getReVertifyReason()
							+ "(活動名稱:" + penalty.getOrder().getMission().getTitle() + ")";
			}
			
			if(penalty.getPenaltyTimeValue() > penalty.getReVertifyPenaltyTimeValue()) {
				message += "調整懲罰時數－－原懲罰時數:" + penalty.getPenaltyTimeValue() 
							+ "，調整懲罰時數:" + penalty.getReVertifyPenaltyTimeValue()
							+ "。原因:" + penalty.getReVertifyReason()
							+ "(活動名稱:" + penalty.getOrder().getMission().getTitle() + ")";
			}
			
			systemMessage.setMessage(message);
			systemMessage.setPenalty(penalty);
			systemMessageDao.save(systemMessage);
			
		}
	}

	// Jasmine 補註解
	public Penalty savePenaltyAndStoreProofPic(MultipartFile proofPic, Penalty penalty, HttpServletRequest request) {
		try {
			// 將Penalty(含圖片名稱)存到DB，才能取得檢舉序號，以編檔名
			penalty.setUpdateDate(new java.util.Date());
			penalty = penaltyDao.save(penalty);

			// 如果有上傳圖片，才存檔案到Server，及存路徑到DB
			if (proofPic.getOriginalFilename().length() > 0) {
				// 取得應用程式根目錄中圖片之路徑
				String realPath = request.getServletContext().getRealPath("/") + "..\\resources\\static\\img\\";
				System.out.println(realPath + "***************************");
				// 確認是否有此資料夾，如無則建資料夾
				File dir = new File(realPath);
				if (!dir.exists()) {
					dir.mkdirs();
				}

				// 位置
				String location = realPath + "penaltyProof_" + penalty.getId() + ".jpg";

				// 寫出檔案到Server
				FileOutputStream fos = new FileOutputStream(location);
				fos.write(proofPic.getBytes());
				fos.close();

				// 將檔名存入DB
				penalty.setProofPicName("penaltyProof_" + penalty.getId() + ".jpg");
				penalty = penaltyDao.save(penalty);

			}
			return penalty;

		} catch (Exception e) {
			e.printStackTrace();
			return penalty;
		}
	}

	// Jasmine 檢舉案件審核
	public Penalty vertifyPenalty(Long penaltyId, Integer status, Integer penaltyTimeValue, String vertifyReason) {
		Penalty dbPenalty = penaltyDao.getOne(penaltyId);
		dbPenalty.setPenaltyTimeValue(penaltyTimeValue);
		dbPenalty.setStatus(status);
		dbPenalty.setVertifyReason(vertifyReason);
		return penaltyDao.save(dbPenalty);
	}
	
	// Jasmine 申訴案件審核
	public Penalty reVertifyPenalty(Long penaltyId, Integer reVertifystatus, Integer reVertifyPenaltyTimeValue, String reVertifyReason) {
		Penalty dbPenalty = penaltyDao.getOne(penaltyId);
		dbPenalty.setStatus(reVertifystatus);
		dbPenalty.setReVertifyPenaltyTimeValue(reVertifyPenaltyTimeValue);
		dbPenalty.setReVertifyReason(reVertifyReason);
		return penaltyDao.save(dbPenalty);
	}
	
	// Jasmine
	//申訴結果儲存後，補時數進入存摺
	public void reVertifyAndSaveTime(Penalty penalty) {
//		Penalty dbPenalty = penaltyDao.getOne(penaltyId);
//		dbPenalty.setStatus(reVertifystatus);
//		dbPenalty.setReVertifyPenaltyTimeValue(reVertifyPenaltyTimeValue);
//		dbPenalty.setReVertifyReason(reVertifyReason);
//		return penaltyDao.save(dbPenalty);
	}
	

	// 志工檢舉雇主
	public Penalty report(Order order, String description) {
		Penalty penalty = new Penalty();
		penalty.setOrder(order);
		penalty.setAccuser(order.getVolunteer());
		penalty.setDefendant(order.getMission().getMember());
		penalty.setUpdateDate(new java.util.Date());
		penalty.setDescription(description);
		penalty.setStatus(new Integer(1));
		return penaltyDao.save(penalty);
	}

	// 雇主檢舉志工
	public Penalty requesterReportVolunteer(Order order, String description) {
		Penalty penalty = new Penalty();
		penalty.setOrder(order);
		penalty.setAccuser(order.getMission().getMember());//原告
		penalty.setDefendant(order.getVolunteer());//被告
		penalty.setUpdateDate(new java.util.Date());
		penalty.setDescription(description);
		penalty.setStatus(new Integer(1));
		return penaltyDao.save(penalty);
	}

	public Penalty save(Penalty penalty) {
		penalty.setUpdateDate(new java.util.Date());
		return penaltyDao.save(penalty);
	}

	public Penalty update(Penalty penalty) {
		Penalty dbPenalty = penaltyDao.getOne(penalty.getId());
		dbPenalty.setPenaltyTimeValue(penalty.getPenaltyTimeValue());
		dbPenalty.setStatus(penalty.getStatus());
		return penaltyDao.save(dbPenalty);
	}

	public Penalty getOne(Long id) {
		Penalty penalty = penaltyDao.getOne(id);
		return penalty;
	}

	public Optional<Penalty> findById(Long id) {
		Optional<Penalty> penalty = penaltyDao.findById(id);
		return penalty;
	}

	public List<Penalty> findAll() {
		List<Penalty> penalty = penaltyDao.findAll();
		return penalty;
	}

	// Excel、PDF報表用
	public List<List<String>> findAllBySpecificationForExcelAndPdf(Specification<Penalty> specification) {
		List<Penalty> penalties = penaltyDao.findAll(specification);

		List<List<String>> results = new ArrayList<List<String>>();
		for (Penalty p : penalties) {
			List<String> pen = turnPenaltyIntoStringList(p);
			results.add(pen);
		}
		return results;
	}

	// Excel、PDF報表用(產表頭)
	public List<String> getPenaltyExcelAndPdfHeaders() {
		List<String> headers = new ArrayList<String>();
		headers.add("PENALTY_ID");
		headers.add("MISSION_START_DATE");
		headers.add("MISSION_TITLE");
		headers.add("ACCUSER_ACCOUNT");
		headers.add("DEFENDANT_ACCOUNT");
		headers.add("UPDATEDATE");
		headers.add("DESCRIPTION");

		headers.add("STATUS");
		headers.add("PENALTY_TIMEVALUE");
		headers.add("PROOF_PICNAME");

		headers.add("VERTIFY_REASON");
		return headers;
	}

	// 給EXCEL用
	public List<String> turnPenaltyIntoStringList(Penalty penalty) {
		String temp = penalty.getId() + "," + penalty.getOrder().getMission().getStartDate() + ","
				+ penalty.getOrder().getMission().getTitle() + "," + penalty.getAccuser().getAccount() + ","
				+ penalty.getDefendant().getAccount() + "," + penalty.getUpdateDate() + "," + penalty.getDescription()
				+ "," + penalty.getStatus() + "," + penalty.getPenaltyTimeValue() + "," + penalty.getProofPicName()
				+ "," + penalty.getVertifyReason();
		String[] array = temp.split(",");
		List<String> result = Arrays.asList(array);
		return result;
	}

	public List<Penalty> findAllBySpecification(Specification<Penalty> specification) {
		List<Penalty> penalties = penaltyDao.findAll(specification);
		return penalties;
	}

	public void delete(Long penaltyListId) {
		penaltyDao.deleteById(penaltyListId);
	}

	public Page<Penalty> findBySpecification(Specification<Penalty> specification, PageRequest pageRequest) {
		return penaltyDao.findAll(specification, pageRequest);
	}

	public List<Penalty> findByAccuser(Long accuser) {
		List<Penalty> penalties = penaltyDao.findByAccuser(accuser);
		return penalties;
	}

	public List<Penalty> findByOrder(Order order) {
		List<Penalty> penalties = penaltyDao.findByOrder(order);
		return penalties;
	}

}
