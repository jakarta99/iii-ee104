package team.lala.timebank.service;

import java.util.List;
import team.lala.timebank.dao.PenaltyDao;
import team.lala.timebank.entity.Penalty;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PenaltyService {

	@Autowired
	private PenaltyDao penaltyDao;

	public void update(Penalty penalty) {
		penaltyDao.save(penalty);
	}

	public List<Penalty> findAll(long id) {
		List<Penalty> specificMemberPenalty = penaltyDao.findAll();
		return specificMemberPenalty;
	}

	public void delete(Long penaltyListId) {
		penaltyDao.deleteById(penaltyListId);
		
	}

}
