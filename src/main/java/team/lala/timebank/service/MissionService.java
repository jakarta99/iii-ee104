package team.lala.timebank.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;

import team.lala.timebank.dao.MissionDao;
import team.lala.timebank.entity.Mission;
@Service
public class MissionService {

	@Autowired
	private MissionDao missionDao;

	public List<Mission> findBySpecification(Specification<Mission> specification) {
		return missionDao.findAll(specification);
	}

	public Page<Mission> findBySpecification(Specification<Mission> specification, PageRequest pageRequest) {
		return missionDao.findAll(specification, pageRequest);
	}

	// insert
	public Mission insert(Mission mission) {
		mission.setPublishDate(new Date());
		

		return missionDao.save(mission);
	}

	// update
	public Mission update(Mission mission) {

		return missionDao.save(mission);
	}

	public List<Mission> findAll() {

		List<Mission> missionList = missionDao.findAll();

		if (missionList == null) {
			// FIXME test on console
			System.out.println("jobList does not exist");
		}
		return missionList;
	}

	public List<Mission> findByMemberId(Long memberid) {

		List<Mission> missionList = missionDao.findByMemberId(memberid);

		return missionList;

	}

	public Mission getOne(Long id) {

		Mission mission = missionDao.getOne(id);

		if (mission == null) {
			// FIXME test on console
			System.out.println("id" + id + " does not exist");
		}
		return mission;
	}

	public void delete(Long id) {

		missionDao.deleteById(id);

	}

}
