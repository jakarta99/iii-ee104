package team.lala.timebank.service;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import lombok.extern.slf4j.Slf4j;
import team.lala.timebank.dao.MemberDao;
import team.lala.timebank.dao.OrderDao;
import team.lala.timebank.dao.PenaltyDao;
import team.lala.timebank.entity.Order;
import team.lala.timebank.entity.Penalty;
import team.lala.timebank.web.penalty.PenaltyController;

@Slf4j
@Service
public class PenaltyService {

	@Autowired
	private PenaltyDao penaltyDao;
	
	@Autowired
	private OrderDao orderDao;
	
	@Autowired
	private MemberDao memberDao;
	
	//Jasmine 補註解
	public Map<String, Object> getAccuserAndDefendant(Long orderId, Long accuserId) {
		Order order = orderDao.getOne(orderId);
		Map<String, Object> result = new HashMap<>();
		//查出原告被告id
		Long defendantId = null;
		if(memberDao.getOne(accuserId) == order.getVolunteer()) {
			defendantId = order.getMission().getMemberId().getId();
		} else {
			defendantId = order.getVolunteer().getId();
		}
		
		//查出原告被告姓名
		String accuserName = memberDao.getOne(accuserId).getName();
		String defendantName = memberDao.getOne(defendantId).getName();
		
		result.put("order", order);
		result.put("accuserId", accuserId);
		result.put("accuserName", accuserName);
		result.put("defendantId", defendantId);
		result.put("defendantName", defendantName);
		
		return result;
	}
	
	//Jasmine 補註解
	public Penalty vertifyPenalty(Long penaltyId, Integer status, Integer penaltyTimeValue, String vertifyReason) {
		Penalty dbPenalty = penaltyDao.getOne(penaltyId);
		dbPenalty.setPenaltyTimeValue(penaltyTimeValue);
		dbPenalty.setStatus(status);
		dbPenalty.setVertifyReason(vertifyReason);
		return penaltyDao.save(dbPenalty);
	}
	
	//Jasmine 補註解
	public Boolean checkRecord(Long orderId, Long accuserId) {
		List<Penalty> penalties = findByOrder(orderDao.getOne(orderId));
		if(penalties.size() > 0) { //該筆order有檢舉紀錄
			for(Penalty p : penalties) {
				if(p.getAccuser().equals(accuserId)) { //檢舉紀錄的檢舉人與目前登入會員相同(不得再次提出檢舉)
					return true;
				}
			}
		}
		return false;
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
