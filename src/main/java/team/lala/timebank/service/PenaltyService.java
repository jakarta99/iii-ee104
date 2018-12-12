package team.lala.timebank.service;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;

import team.lala.timebank.dao.PenaltyDao;
import team.lala.timebank.entity.Penalty;

@Service
public class PenaltyService {

	@Autowired
	private PenaltyDao penaltyDao;

	public Penalty save(Penalty penalty) {
		penalty.setUpdateDate(LocalDateTime.now());
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
	public List<Penalty> findByMemberId(Long memberId) {
		List<Penalty> penaltys = penaltyDao.findByMemberId(memberId);
		return penaltys;
	}

}
