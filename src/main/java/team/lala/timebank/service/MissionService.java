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
import org.springframework.transaction.annotation.Transactional;

import lombok.extern.slf4j.Slf4j;
import team.lala.timebank.dao.MemberDao;
import team.lala.timebank.dao.MissionDao;
import team.lala.timebank.dao.OrderDao;
import team.lala.timebank.entity.Member;
import team.lala.timebank.entity.Mission;
import team.lala.timebank.entity.Order;
import team.lala.timebank.enums.MissionStatus;
import team.lala.timebank.enums.OrderStatus;
import team.lala.timebank.spec.MissionSpecification;

@Slf4j
@Transactional
@Service
public class MissionService {

	@Autowired
	private OrderDao orderDao;
	@Autowired
	private MissionDao missionDao;
	@Autowired
	private MemberDao memberDao;
	@Autowired
	private OrderService orderService;
	@Autowired
	private SystemMessageService systemMessageService;

	// list for everyone
	public Page<Mission> findByStatusAndSpecification(Mission inputMission, PageRequest pageRequest) {
		inputMission.setMissionStatusTransient("New");
		MissionSpecification missionSpec = new MissionSpecification(inputMission);

		Page<Mission> missions = this.findBySpecification(missionSpec, pageRequest);
		return missions;
	}

	// list for Admin
	public Page<Mission> findBySpecification(Specification<Mission> specification, PageRequest pageRequest) {
		return missionDao.findAll(specification, pageRequest);
	}

	public List<Mission> findBySpecification(Specification<Mission> specification) {
		return missionDao.findAll(specification);
	}

	//

	// insert for user
	public Mission insert(Mission mission, Principal principal) {
		
		mission.setMember(memberDao.findByAccount(principal.getName()));
		mission.setMissionstatus(MissionStatus.A_New);
		mission.setAutoPayDate(new Date(mission.getEndDate().getTime() + 3 * 24 * 60 * 60 * 1000));
		mission.setPublishDate(new Date());
		mission.setDeadline(new Date(mission.getEndDate().getTime() - 7 * 24 * 60 * 60 * 1000));
		mission.setApprovedQuantity(0);
		return missionDao.save(mission);
	}

	// update for user & Admin
	public Mission update(Mission mission) {
		mission.setUpdateDate(new java.util.Date());
		mission.setDeadline(new Date(mission.getEndDate().getTime() - 7 * 24 * 60 * 60 * 1000));
		mission.setAutoPayDate(new Date(mission.getEndDate().getTime() + 3 * 24 * 60 * 60 * 1000));
		return missionDao.save(mission);
	}

	// 檢查mission的orders 全數審核完改變其狀態
	public void checkMissionStatus(Long orderId) {
		Mission mission = orderDao.getOne(orderId).getMission();
		List<Order> orders = orderDao.findByMissionAndOrderStatus(mission, OrderStatus.RequesterAcceptService);
		mission.setApprovedQuantity(orders.size());
		if (mission.getApprovedQuantity() == mission.getPeopleNeeded()) {
			mission.setMissionstatus(MissionStatus.A_VolunteerApproved);
		}
		missionDao.save(mission);
	}

	// cancel for user
	public Mission cancelMission(Long missionid) {
		Mission mission = missionDao.getOne(missionid);

		if (mission.getMissionstatus() == MissionStatus.A_New
				|| mission.getMissionstatus() == MissionStatus.A_VolunteerApproved) {
			mission.setMissionstatus(MissionStatus.C_Cancel);
			mission.setFinishDate(new Date());
			// 拒絕所有apply的order
			List<Order> orders = orderService.findByMission(mission);
			orderService.rejectOrders(orders);
			systemMessageService.missionCancel(orders);
			return missionDao.save(mission);
		}
		return null;
	}

	public List<Mission> findAll() {
		List<Mission> missionList = missionDao.findAll();
		if (missionList == null) {
			System.out.println("jobList does not exist");
		}
		return missionList;
	}

	public List<Mission> findByMember(Member member) {

		List<Mission> missionList = missionDao.findByMember(member);

		return missionList;

	}

	public Page<Mission> findByMember(Principal principal, Mission mission, Pageable pageable) {
		Page<Mission> missions = missionDao.findByMember(memberDao.findByAccount(principal.getName()), pageable);
		return missions;
	}

	public Mission getOne(Long id) {

		Mission mission = missionDao.getOne(id);

		if (mission == null) {
			return null;
		}
		return mission;
	}

	public void delete(Long id) {

		missionDao.deleteById(id);

	}

}
