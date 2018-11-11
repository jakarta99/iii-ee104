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

	public void update(Penalty penalty) {
		penaltyDao.save(penalty);
	}

	public List<Penalty> findSomeoneAll(long id) {
		List<Penalty> specificMemberPenalty = penaltyDao.findAll();
		return specificMemberPenalty;
	}
	
	public List<Penalty> findAll(){
		List<Penalty> penalty = penaltyDao.findAll();
		return penalty;
	}

	public void delete(Long penaltyListId) {
		penaltyDao.deleteById(penaltyListId);
		
	}
	
	public int getPenaltyTimeValueByMemberId(Long memberId){
		int penaltyTimeValue=0;
		Collection<Penalty> penaltys = penaltyDao.findByMemberId(memberId);
		for (Penalty penalty : penaltys) {
			penaltyTimeValue += penalty.getPenaltyTimeValue();

		}
		return penaltyTimeValue;
		
	}	

}
