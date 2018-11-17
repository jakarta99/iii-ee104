package team.lala.timebank.service;

import java.util.Collection;
import java.util.List;
import team.lala.timebank.dao.PenaltyDao;
import team.lala.timebank.entity.Donation;
import team.lala.timebank.entity.Penalty;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PenaltyService {

	@Autowired
	private PenaltyDao penaltyDao;

	public Penalty save(Penalty p) {
		Penalty penalty=penaltyDao.save(p);
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
	public Collection<Penalty> findByMemberId(Long memberId) {

		Collection<Penalty> penaltys = penaltyDao.findByMemberId(memberId);

		return penaltys;

	}

}
