package team.lala.timebank.service;

import java.io.File;
import java.io.FileOutputStream;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.jpa.domain.Specification;
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
	public Penalty checkRecordandProvidePenalty(Long orderId, Long accuserId) {
		Order thisOrder = orderDao.getOne(orderId);
		Member accuser = memberDao.getOne(accuserId);
		List<Penalty> penalties = findByOrder(thisOrder);
		
		
		Penalty penalty = new Penalty();
		Member defendant;
		if(penalties.size() > 0) { //該筆order有檢舉紀錄(有雙向檢舉之可能，故需判斷檢舉紀錄的檢舉者是否相同)
			for(Penalty p : penalties) {
				if(p.getAccuser().equals(accuser)) { //該筆order的檢舉人與目前登入會員相同(不得再次提出檢舉)
					return null;
				}
			}
		}
		
		if(accuser == thisOrder.getMission().getMember()) {//如果檢舉者是雇主
			defendant = thisOrder.getVolunteer();//被告就是志工
		} else {
			defendant = thisOrder.getMission().getMember();
		}
		penalty.setAccuser(accuser);
		penalty.setOrder(thisOrder);
		penalty.setDefendant(defendant);
		penalty.setStatus(1);
		return penalty;
		
	}
	
	//Jasmine 完成審核後寄站內信給檢舉人
	public void sendSystemMessageToAccuser(Penalty penalty) {
		if(penalty != null) {
			
		}
//		systemMessageDao
	}
	
	
	//Jasmine 補註解
	public Boolean storeProofPic(MultipartFile proofPic, Long penaltyId) {
		try {
			//確認是否有此資料夾，如無則建資料夾
			File dir = new File("D:\\penaltyProoves\\img\\");
			if (!dir.exists()) {
				dir.mkdirs();
			}
			String location = "D:\\penaltyProoves\\img\\" + "penaltyProof_" + penaltyId + ".jpg";
			FileOutputStream fos = new FileOutputStream(location);
			fos.write(proofPic.getBytes());
			fos.close();
			//將圖片路徑存到DB
			Penalty penalty = getOne(penaltyId);
			penalty.setProofPicName("penaltyProof_" + penaltyId + ".jpg");
			update(penalty);
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return true;
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
