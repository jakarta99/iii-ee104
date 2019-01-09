package team.lala.timebank.service;

import java.security.Principal;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import lombok.extern.slf4j.Slf4j;
import team.lala.timebank.dao.MemberDao;
import team.lala.timebank.dao.OrderDao;
import team.lala.timebank.entity.Member;
import team.lala.timebank.entity.Mission;
import team.lala.timebank.entity.Order;
import team.lala.timebank.entity.Penalty;
import team.lala.timebank.enums.MissionStatus;
import team.lala.timebank.enums.OrderStatus;
import team.lala.timebank.enums.ReportStatus;

@Slf4j
@Service
@Transactional
public class OrderService {
	
	@Autowired
	private MissionService missionService;
	@Autowired
	private OrderDao orderDao;
	@Autowired
	private MemberDao memberDao;
	@Autowired
	private PenaltyService penaltyService;
	@Autowired
	private SystemMessageService systemMessageService;

	// 根據會員查詢order
	public Page<Order> findBySpecification(Specification<Order> specification, PageRequest pageRequest) {
		return orderDao.findAll(specification, pageRequest);
	}	
	
	public Page<Order> findByMission(Mission inputMission, int page, Optional<Integer> length) {
		Page<Order> orders = orderDao.findByMission(inputMission, PageRequest.of(page, length.orElse(10)));
		// mission.setMember(memberDao.findByAccount(principal.getName()));
		// OrderSpecification orderSpec = new OrderSpecification(inputMission);
		// Page<Order> orders = findBySpecification(orderSpec,
		// PageRequest.of(page, length.orElse(10)));
		log.debug("Orders={}", orders);
		return orders;
	}
	public List<Order> findByMissionAndOrderStatus(Mission mission, OrderStatus orderStatus){
		return orderDao.findByMissionAndOrderStatus(mission, orderStatus);
	}
	//志工幫雇主評分
//	public void score(Long orderId, Integer score) {
//		Order order = orderDao.getOne(orderId);
//		Member member = order.getMission().getMember();
//		if(member.getScoredTimes() == null || member.getScoredTimes() == 0) {
//			member.setScoredTimes(1);
//		} else {
//			member.setScoredTimes(member.getScoredTimes() + 1);
//		}
//		if(member.getSumScore() == null || member.getSumScore() == 0) {
//			member.setSumScore(score);
//		} else {
//			member.setSumScore(member.getSumScore() + score);			
//		}
//		member.setAverageScore(new Double(member.getSumScore() / member.getScoredTimes()));	
//		memberDao.save(member);
//		order.setOrderStatus(OrderStatus.ServiceFinishPayMatchSuccess);		//修改order狀態
//		orderDao.save(order);
//		systemMessageService.scoreMessage(order, score);		
//	}
	
	//志工檢舉雇主
	public Penalty report(Long orderId, String description) {
		Order order = orderDao.getOne(orderId);		
		Penalty penalty = penaltyService.report(order, description);
		if(order.getReportStatus() == ReportStatus.Null) {
			order.setReportStatus(ReportStatus.VolunteerReportRequester);			
		} else {
			order.setReportStatus(ReportStatus.BothReport);
		}
		orderDao.save(order);
		systemMessageService.reportMessage(order);
		return penalty;
	}
	
	//顧主檢舉志工
		public Penalty requesterReportVolunteer(Long orderId, String description) {
			Order order = orderDao.getOne(orderId);	
			
			Penalty penalty = penaltyService.requesterReportVolunteer(order, description);
			if(order.getReportStatus()==ReportStatus.Null) {
				order.setReportStatus(ReportStatus.RequesterReportVolunteer);
			}else if(order.getReportStatus()==ReportStatus.VolunteerReportRequester) {
				order.setReportStatus(ReportStatus.BothReport);
			}
			order.setOrderStatus(OrderStatus.ServiceFinishPayMatchSuccess);
			orderDao.save(order);
			return penalty;
		}
		
		
	

	public List<Order> findByVolunteer(Principal principal) {
		String account = principal.getName();
		Member member = memberDao.findByAccount(account);
		List<Order> orders = orderDao.findByVolunteer(member);
		return orders;
	}

	public Order getById(Long id) {
		// getOne查無資料不會回傳null，而是噴錯(確認是在Service處理Exception，還是在Controller)
		Order order = orderDao.getOne(id);
		return order;
	}

	public Order insert(Order order) {
		order.setVolunteerApplyTime(new java.util.Date());
		return orderDao.save(order);
	}
	//Roy 志工申請任務 新增order
	public Order insert(Mission mission, Member volunteer) {
		Order order = new Order();
		order.setVolunteer(volunteer);
		order.setOrderStatus(OrderStatus.VolunteerApply);
		order.setReportStatus(ReportStatus.Null);
		order.setMission(mission);
		order.setVolunteerApplyTime(new java.util.Date());
		return orderDao.save(order);
	}

	public Order update(Order order) {
		Order dbOrder = orderDao.getOne(order.getId());
		// orderStatusDao.getOne(order.getId())
		if (order.getId() != null) {
			dbOrder.setVolunteer(order.getVolunteer());
			dbOrder.setOrderStatus(order.getOrderStatus());
			dbOrder.setVolunteerApplyTime(order.getVolunteerApplyTime());
			dbOrder.setOrderAcceptTime(order.getOrderAcceptTime());
			dbOrder = orderDao.save(dbOrder);
		}
		return dbOrder;
	}

	public void deleteById(Long id) { // spring jpa預設void
		orderDao.deleteById(id);
	}

	// accept 志工 改狀態為2接受
	public Order acceptVolunteer(Long orderId) {
		Order order = orderDao.getOne(orderId);
		Mission mission = order.getMission();
		if(mission.getMissionstatus() == MissionStatus.A_New) {
			if (order.getOrderStatus() == OrderStatus.VolunteerApply) {
				order.setOrderStatus(OrderStatus.RequesterAcceptService);
				return orderDao.save(order);
			}
		}	
		return null;
	}

	// reject 志工 改狀態為3拒絕
	public Order reject(Long id) {
		Order order = orderDao.getOne(id);
		if (order.getOrderStatus() == OrderStatus.VolunteerApply) {
			order.setOrderStatus(OrderStatus.RequesterRefuceServiceMatchFail);
			return orderDao.save(order);
		}
		return null;
	}
	
	//志工取消申請 狀態1 --> 5
	public Order cancle (Long id) {
		Order order = orderDao.getOne(id);
		if(order.getOrderStatus() == OrderStatus.VolunteerApply) {
			order.setOrderStatus(OrderStatus.VolunteerCancleTransactionMatchFail);
			return orderDao.save(order);
		}
		return null;
	}

	// 根據mission找出所有的order
	public List<Order> findByMission(Mission mission) {
		List<Order> orders = orderDao.findByMission(mission);
		return orders;
	}

	// 拒絕所有的apply
	public void rejectOrders(List<Order> orders) {
		for (int i = 0; i < orders.size(); i++) {
			this.reject(orders.get(i).getId());
		}
	}
}
