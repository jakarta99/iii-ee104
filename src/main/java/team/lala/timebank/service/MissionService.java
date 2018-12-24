package team.lala.timebank.service;

import java.security.Principal;
import java.util.Date;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;

import team.lala.timebank.dao.MemberDao;
import team.lala.timebank.dao.MissionDao;
import team.lala.timebank.entity.Member;
import team.lala.timebank.entity.Mission;

@Service
public class MissionService {

	@Autowired
	private MissionDao missionDao;
	@Autowired
	private MemberDao memberDao;

	public List<Mission> findBySpecification(Specification<Mission> specification) {
		return missionDao.findAll(specification);
	}

	public Page<Mission> findBySpecification(Specification<Mission> specification, PageRequest pageRequest) {
		return missionDao.findAll(specification, pageRequest);
	}

	// insert
	public Mission insert(Mission mission) {
		System.out.println(mission.getId());
		System.out.println(mission.getStartDate().getClass());
		System.out.println(mission.getStartDate());
		mission.setStartDate(mission.getStartDate());
		mission.setEndDate(mission.getEndDate());
		mission.setPublishDate(new Date());

		return missionDao.save(mission);
	}

	public Mission insert(Mission mission, Principal principal) {
		Member member = memberDao.findByAccount(principal.getName());

		mission.setId(member.getId());
		mission.setStartDate(mission.getStartDate());
		mission.setEndDate(mission.getEndDate());
		mission.setPublishDate(new Date());

		return missionDao.save(mission);
	}

	// update
	public Mission update(Mission mission) {
		System.out.println(mission.getTermType().getClass());
		System.out.println(mission.getTermType());

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

	public Mission findByMissionId(Long missionId) {

		Mission mission = missionDao.getOne(missionId);

		return mission;
	}

	// 取得member所有mission
	public List<Mission> findByMemberAccount(Principal principal) {

		// loginAccount取得member.getid取得mission list
		List<Mission> missionList = missionDao.findByMemberId(memberDao.findByAccount(principal.getName()).getId());

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
