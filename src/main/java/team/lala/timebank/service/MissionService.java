package team.lala.timebank.service;

import java.security.Principal;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import team.lala.timebank.dao.MemberDao;
import team.lala.timebank.dao.MissionDao;
import team.lala.timebank.dao.MissionStatusDao;
import team.lala.timebank.entity.Member;
import team.lala.timebank.entity.Mission;

@Slf4j
@Service
public class MissionService {

	@Autowired
	private MissionDao missionDao;
	@Autowired
	private MemberDao memberDao;
	@Autowired
	private MissionStatusDao missionStatusDao;

	public List<Mission> findBySpecification(Specification<Mission> specification) {
		return missionDao.findAll(specification);
	}

	public Page<Mission> findBySpecification(Specification<Mission> specification, PageRequest pageRequest) {
		return missionDao.findAll(specification, pageRequest);
	}

	// insert
	public Mission insert(Mission mission) {
		log.debug("mission={}",mission);
		mission.setStatus(missionStatusDao.getOne(1l));
		mission.setStartDate(mission.getStartDate());
		mission.setEndDate(mission.getEndDate());
		mission.setPublishDate(new Date());
		mission.setDeadline(new Date(mission.getEndDate().getTime() - 7 * 24 * 60 * 60 * 1000));
		mission.setApprovedQuantity(0);
		log.debug("mission={}",mission);
		return missionDao.save(mission);
	}

	public Mission insert(Mission mission, Principal principal) {
		mission.setMember(memberDao.findByAccount(principal.getName()));
		mission.setStatus(missionStatusDao.getOne(1l));
		mission.setStartDate(mission.getStartDate());
		mission.setEndDate(mission.getEndDate());
		mission.setPublishDate(new Date());
		mission.setDeadline(new Date(mission.getEndDate().getTime() - 7 * 24 * 60 * 60 * 1000));
		mission.setApprovedQuantity(0);
		return missionDao.save(mission);
	}

	// update
	public Mission update(Mission mission) {
		
		log.debug("mission={}",mission);
		log.debug("mission.getStatus()={}",mission.getStatus());
		log.debug("mission.getMember={}",mission.getMember());
//		mission.setMember(mission.getMember());
		mission.setDeadline(new Date(mission.getEndDate().getTime() - 7 * 24 * 60 * 60 * 1000));
		return missionDao.save(mission);
	}
	
	public Mission updateuser(Mission mission) {
		
		log.debug("mission={}",mission);
		log.debug("mission.getStatus()={}",mission.getStatus());
		log.debug("mission.getMember={}",mission.getMember());
		mission.setMember(mission.getMember());
		mission.setDeadline(new Date(mission.getEndDate().getTime() - 7 * 24 * 60 * 60 * 1000));
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

	public List<Mission> findByMember(Member member) {

		List<Mission> missionList = missionDao.findByMember(member);

		return missionList;

	}
	
	public Mission findByAccount(Principal principal, Mission mission) {
		mission.setMember(memberDao.findByAccount(principal.getName()));
		return mission;
	}
	
	public Page<Mission> findByAccount(Principal principal, Mission mission, Pageable pageable) {
		Page<Mission> missions = missionDao.findByMember(memberDao.findByAccount(principal.getName()), pageable);
		return missions;
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
