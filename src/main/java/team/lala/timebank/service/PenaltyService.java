package team.lala.timebank.service;

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

import team.lala.timebank.dao.MemberDao;
import team.lala.timebank.dao.OrderDao;
import team.lala.timebank.dao.PenaltyDao;
import team.lala.timebank.entity.Order;
import team.lala.timebank.entity.Penalty;

@Service
public class PenaltyService {

	@Autowired
	private PenaltyDao penaltyDao;
	
	@Autowired
	private OrderDao orderDao;
	
	@Autowired
	private MemberDao memberDao;
	
	//Jasmine
	public Map<String, Object> getAccuserAndDefendant(Long orderId, Long accuserId) {
		Order order = orderDao.getOne(orderId);
		Map<String, Object> result = new HashMap<>();
		//查出原告被告id
		Long defendantId = null;
		if(accuserId == order.getVolunteerId()) {
			defendantId = order.getServiceRequesterId();
		} else {
			defendantId = order.getVolunteerId();
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
	
	//Jasmine
	public Penalty vertifyPenalty(Long penaltyId, Integer status, Integer penaltyTimeValue) {
		Penalty dbPenalty = penaltyDao.getOne(penaltyId);
		dbPenalty.setPenaltyTimeValue(penaltyTimeValue);
		dbPenalty.setStatus(status);
		return penaltyDao.save(dbPenalty);
	}
	
	//Jasmine
	public Boolean checkRecord(Long orderId, Long accuserId) {
		List<Penalty> penalties = findByOrder(orderDao.getOne(orderId));
		
		if(penalties.size() > 0) { //該筆order有檢舉紀錄
			for(Penalty p : penalties) {
				if(p.getAccuser() == accuserId) { //檢舉紀錄的檢舉人與目前登入會員相同(不得再次提出檢舉)
					return true;
				}
			}
		}
		return false;
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
