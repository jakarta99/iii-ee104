package team.lala.timebank.service;

import java.util.List;
<<<<<<< HEAD
import java.util.Optional;
=======
>>>>>>> branch 'master' of https://github.com/jakarta99/iii-ee104

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import team.lala.timebank.dao.PenaltyDao;
import team.lala.timebank.entity.Penalty;

@Service
public class PenaltyService {

	@Autowired
	private PenaltyDao penaltyDao;

	public Penalty save(Penalty p) {
		Penalty penalty=penaltyDao.save(p);
		return penalty;
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

	// 查詢某人的所有Penalty (更改by Brian)
	public List<Penalty> findByMemberId(Long memberId) {

		List<Penalty> penaltys = penaltyDao.findByMemberId(memberId);

		return penaltys;

	}

}
