package team.lala.timebank.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import team.lala.timebank.dao.MemberDao;
import team.lala.timebank.dao.MissionDao;
import team.lala.timebank.dao.OrderDao;
import team.lala.timebank.dao.SystemMessageDao;
import team.lala.timebank.dao.TimeLedgerDao;
import team.lala.timebank.entity.Member;
import team.lala.timebank.entity.Mission;
import team.lala.timebank.entity.Order;
import team.lala.timebank.enums.MissionStatus;
import team.lala.timebank.enums.OrderStatus;
import team.lala.timebank.enums.ReportStatus;

@Slf4j
@Service
public class FacadeService {
	@Autowired
	private TimeLedgerDao timeLedgerDao;

	@Autowired
	private TimeLedgerService timeLedgerService;

	@Autowired
	private MemberService memberService;

	@Autowired
	private SystemMessageService systemMessageService;

	@Autowired
	private MemberDao memberDao;

	@Autowired
	private OrderDao orderDao;

	@Autowired
	private MissionDao missionDao;

	@Autowired
	private SystemMessageDao systemMessageDao;

	@Autowired
	private OrderService orderService;

	// 交易
	public void transaction(Integer hours, Long orderId, Integer score) {

		Member volunteer = orderService.getById(orderId).getVolunteer();
		Member payer = orderService.getById(orderId).getMission().getMember();
		Mission mission = orderService.getById(orderId).getMission();
		String missionTitle = mission.getTitle();

		// 變更order 狀態
		// 如果狀態是OrderStatus.ServiceFinishNotPay才可以交易
		Order order = orderDao.getOne(orderId);
		if (order.getOrderStatus() == OrderStatus.ServiceFinishNotPay) {

			// 1 payer扣錢
			timeLedgerService.withdrawal(hours, payer, missionTitle);
			// 1 payer扣款完成

			// 2 volunteer加錢
			timeLedgerService.deposit(hours, volunteer, missionTitle);
			// 2 volunteer扣款完成

			// 3 變更order狀態
			order.setOrderStatus(OrderStatus.ServiceFinishPayMatchSuccess);
			orderDao.save(order);
			// 3 變更order狀態完成

			// 4 評分
			memberService.setVolunteerScore(volunteer, score);
			// 4 評分完成

			// 5 系統訊息
			// 5.1 付款後收到的訊息
			systemMessageService.pay(payer, volunteer, hours, mission);
			// 5.1 產生付款後收到的訊息完成

			// 5.2 入賬後收到的訊息
			systemMessageService.earn(payer, volunteer, hours, mission);
			// 5.2 產生入賬後收到的訊息完成
			
			//6 付款計數器++
			mission.setPayedQuantity(mission.getPayedQuantity()+1);
			missionDao.save(mission);
			
			// 搜尋mission中的所有order 若全付款則將 mission狀態改變
			List<Order> successOrders = orderDao.findByMissionAndOrderStatus(mission, OrderStatus.ServiceFinishPayMatchSuccess);
	
				if (successOrders.size() == mission.getApprovedQuantity().intValue()) {
					mission.setMissionstatus(MissionStatus.C_Finish);
					mission.setFinishDate(new Date());
					missionDao.save(mission);
					systemMessageService.finishMission(payer, mission);
				}
			
			orderDao.save(order);
		}

	}

}
