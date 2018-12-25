package team.lala.timebank.service;

import java.security.Principal;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import team.lala.timebank.dao.MemberDao;
import team.lala.timebank.dao.MissionDao;
import team.lala.timebank.entity.Member;
import team.lala.timebank.entity.Mission;
import team.lala.timebank.web.user.RecruitFinishController;
@Slf4j
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
		log.debug("member.getId()={}",member.getId());
		mission.setMemberId(member.getId());
		log.debug("mission.memberid={}",mission.getMemberId());
		mission.setStartDate(mission.getStartDate());
		mission.setEndDate(mission.getEndDate());
		mission.setPublishDate(new Date());
		mission.setStatus(1);

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

	public List<Mission> findByMemberId(Long memberid) {

		List<Mission> missionList = missionDao.findByMemberId(memberid);

		return missionList;

	}
	//取得member所有mission
	public List<Mission> findByMemberAccount(Principal principal) {
		
		//loginAccount取得member.getid取得mission list
		List<Mission> missionList = missionDao.findByMemberId(memberDao.findByAccount(principal.getName()).getId());

		return missionList;

	}
	public Mission setMemberId(Principal principal,Mission mission) {
		
		mission.setMemberId(memberDao.findByAccount(principal.getName()).getId());
		return mission;
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
