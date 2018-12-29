package team.lala.timebank.service;

import java.io.File;
import java.io.FileOutputStream;
import java.security.Principal;
import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
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
import team.lala.timebank.enums.SystemMessageType;
import team.lala.timebank.enums.YesNo;

@Slf4j
@Service
public class PenaltyService {

	@Autowired
	private PenaltyDao penaltyDao;
	
	@Autowired
	private OrderDao orderDao;
	
	@Autowired
	private MemberDao memberDao;
	
	@Autowired
	private SystemMessageDao systemMessageDao;
	
	//Jasmine 
	//點選一筆order後，判斷是否有檢舉紀錄，以及被檢舉人是誰。如無檢舉紀錄則無法進入填寫檢舉之畫面
	//進入檢舉畫面會將相關資料帶入(被檢舉人、活動名稱....)，但還不寫入DB
	public Penalty checkRecordandProvidePenalty(Long orderId, Principal principal) {
		Order thisOrder = orderDao.getOne(orderId);
		Member accuser = memberDao.findByAccount(principal.getName());

		List<Penalty> penalties = findByOrder(thisOrder);//查出這筆order的所有檢舉紀錄

		if(penalties.size() > 0) { //該筆order有檢舉紀錄(有雙向檢舉之可能，故需判斷檢舉紀錄的檢舉者是否相同)
			for(Penalty p : penalties) {
				if(p.getAccuser().equals(accuser)) { //該筆order的檢舉人與目前登入會員相同(不得再次提出檢舉)
					return null;
				}
			}
		}
		
		Member defendant;
		if(accuser == thisOrder.getMission().getMember()) {//如果檢舉者是雇主
			defendant = thisOrder.getVolunteer();//被告就是志工
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
	
	//Jasmine 完成審核後寄站內信給檢舉人
	public void sendSystemMessageToAccuser(Penalty penalty) {
		Member sender = (Member) SecurityContextHolder.getContext()  //管理員會員(寄件者)
				.getAuthentication()  
				.getPrincipal();

		if(penalty != null) {
			SystemMessage systemMessage = new SystemMessage();
			systemMessage.setMember(penalty.getAccuser());//系統訊息給檢舉人
			systemMessage.setMessageType(SystemMessageType.ReplyPenaltyReport);
			systemMessage.setReadStatus(YesNo.N);
			systemMessage.setReleaseTime(new java.util.Date());
			systemMessage.setSender(sender);
			systemMessage.setMessage("謝謝您的檢舉，TimeBank已完成您的檢舉案的審核及處置。");
			systemMessageDao.save(systemMessage); 
			//補邏輯:訊息送出後，紀錄在penalty表內(有寄信)，加entity欄位
		}
	}
	
	
	//Jasmine 完成審核且確定有懲罰與扣款，則寄站內信給被檢舉人(被告)
	public void sendSystemMessageToDefendant(Penalty penalty) {
		Member sender = (Member) SecurityContextHolder.getContext()  //管理員會員(寄件者)
				.getAuthentication()  
				.getPrincipal();

		if(penalty != null) {
			SystemMessage systemMessage = new SystemMessage();
			systemMessage.setMember(penalty.getDefendant());//系統訊息給檢舉人
			systemMessage.setMessageType(SystemMessageType.Penalty);
			systemMessage.setReadStatus(YesNo.N);
			systemMessage.setReleaseTime(new java.util.Date());
			systemMessage.setSender(sender);
			systemMessage.setMessage("[扣除時數]原因:檢舉, "+ penalty.getDescription());
			systemMessageDao.save(systemMessage); 
			//補邏輯:訊息送出後，紀錄在penalty表內(有寄信)，加entity欄位
		}
	}
	
	
	//Jasmine 補註解
	public Penalty savePenaltyAndStoreProofPic(MultipartFile proofPic, Penalty penalty, HttpServletRequest request) {
		try {
			//將Penalty(含圖片名稱)存到DB，才能取得檢舉序號，以編檔名
			penalty.setUpdateDate(new java.util.Date());
			penalty = penaltyDao.save(penalty);
			
			//如果有上傳圖片，才存檔案到Server，及存路徑到DB
			if(proofPic.getOriginalFilename().length() > 0) {
				//取得應用程式根目錄中圖片之路徑
				String realPath = request.getServletContext().getRealPath("/") + "..\\resources\\static\\img\\";

				//確認是否有此資料夾，如無則建資料夾
				File dir = new File(realPath);
				if (!dir.exists()) {
					dir.mkdirs();
				}
				
				//檔名
				String location = realPath + "penaltyProof_" + penalty.getId() + ".jpg";
				
				//寫出檔案到Server
				FileOutputStream fos = new FileOutputStream(location);
				fos.write(proofPic.getBytes());
				fos.close();
				
				//將檔名存入DB
				penalty.setProofPicName("penaltyProof_" + penalty.getId() + ".jpg");
				penalty = penaltyDao.save(penalty);
				
			}
			return penalty;
			
		} catch (Exception e) {
			e.printStackTrace();
			return penalty;
		}
	}
	
	//Jasmine 補註解
	public Penalty vertifyPenalty(Long penaltyId, Integer status, Integer penaltyTimeValue, String vertifyReason) {
		Penalty dbPenalty = penaltyDao.getOne(penaltyId);
		dbPenalty.setPenaltyTimeValue(penaltyTimeValue);
		dbPenalty.setStatus(status);
		dbPenalty.setVertifyReason(vertifyReason);
		return penaltyDao.save(dbPenalty);
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

	public void delete(Long penaltyListId) {
		penaltyDao.deleteById(penaltyListId);
	}

	public Page<Penalty> findBySpecification(Specification<Penalty> specification, PageRequest pageRequest){
		return penaltyDao.findAll(specification, pageRequest);
	}

	
	public List<Penalty> findByAccuser(Long accuser) {
		List<Penalty> penalties = penaltyDao.findByAccuser(accuser);
		return penalties;
	}
	
	public List<Penalty> findByOrder(Order order){
		List<Penalty> penalties = penaltyDao.findByOrder(order);
		return penalties;
	}

}
