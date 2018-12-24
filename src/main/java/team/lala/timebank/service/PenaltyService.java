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
	
	public Map<String, Object> getAccuserAndDefendant(Long orderId, Long defendantId) {
		Order order = orderDao.getOne(orderId);
		Map<String, Object> result = new HashMap<>();
		//查出原告被告id
		Long accuserId = null;
		if(defendantId == order.getVolunteerId()) {
			accuserId = order.getServiceRequesterId();
		} else {
			accuserId = order.getVolunteerId();
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
	
	public Penalty vertifyPenalty(Long penaltyId, Integer status, Integer penaltyTimeValue) {
		Penalty dbPenalty = penaltyDao.getOne(penaltyId);
		dbPenalty.setPenaltyTimeValue(penaltyTimeValue);
		dbPenalty.setStatus(status);
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
	
	// 查詢某人的所有Penalty (更改by Brian)
	public List<Penalty> findByDefendant(Long defendant) {
		List<Penalty> penaltys = penaltyDao.findByDefendant(defendant);
		return penaltys;
	}

}
