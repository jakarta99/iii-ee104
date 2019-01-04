package team.lala.timebank.service;

import java.util.Date;

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
import team.lala.timebank.entity.SystemMessage;
import team.lala.timebank.entity.TimeLedger;
import team.lala.timebank.enums.MissionStatus;
import team.lala.timebank.enums.OrderStatus;
import team.lala.timebank.enums.SystemMessageType;
import team.lala.timebank.enums.YesNo;

@Slf4j
@Service
public class FacadeService {
	@Autowired
	private TimeLedgerDao timeLedgerDao;

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
	public Order transaction(Integer hours, Long orderId,Integer score) {
		
		
		Member volunteer = orderService.getById(orderId).getVolunteer();
		Member payer = orderService.getById(orderId).getMission().getMember();
		Mission mission = orderService.getById(orderId).getMission();
		String missionTitle = mission.getTitle();
		
		
		// 變更order 狀態
		Order order = orderDao.getOne(orderId);
		if (order.getOrderStatus() == OrderStatus.ServiceFinishNotPay) {

			// 1 payer扣錢
			// 1.1 找出payer
			TimeLedger payerLastTimeLedger = timeLedgerDao
					.findTop1ByMemberIdOrderByTransactionTimeDesc(payer);
			TimeLedger payerTimeLedger = null;

			// 尚無交易紀錄，或帳戶餘額小於本次提款時數者，不得提款
			if (payerLastTimeLedger != null && payerLastTimeLedger.getBalanceValue() >= hours) {
				// 1.2 prepare timeledger data
				payerTimeLedger = new TimeLedger();
				payerTimeLedger.setDepositValue(0);
				payerTimeLedger.setMemberId(payer);
				payerTimeLedger.setWithdrawalValue(hours);
				payerTimeLedger.setTransactionTime(new Date());
				payerTimeLedger.setBalanceValue(payerLastTimeLedger.getBalanceValue() - hours);
				payerTimeLedger.setDescription(missionTitle + "撥款");
			}
			// 1.3 insert
			timeLedgerDao.save(payerTimeLedger);
			// payer扣款完成

			// 2 volunteer加錢
			// 2.1 找出volunteer
			TimeLedger volunteerLastTimeLedger = timeLedgerDao
					.findTop1ByMemberIdOrderByTransactionTimeDesc(volunteer);

			// 尚無交易紀錄者，先將存款餘額設為0
			if (volunteerLastTimeLedger == null) {
				volunteerLastTimeLedger = new TimeLedger();
				volunteerLastTimeLedger.setBalanceValue(0); // balanceValue型別為Integer，預設null改為0
				log.debug("會員第一次交易");
			}

			// 2.2 prepare timeledger data
			TimeLedger volunteerTimeLedger = new TimeLedger();
			volunteerTimeLedger.setWithdrawalValue(0);
			volunteerTimeLedger.setMemberId(volunteer);
			volunteerTimeLedger.setDepositValue(hours);
			volunteerTimeLedger.setBalanceValue(volunteerLastTimeLedger.getBalanceValue() + hours);
			volunteerTimeLedger.setTransactionTime(new Date());
			volunteerTimeLedger.setDescription(missionTitle + "存入");

			// 2.3 insert
			timeLedgerDao.save(volunteerTimeLedger);
			order.setOrderStatus(OrderStatus.ServiceFinishPayMatchSuccess);
			orderDao.save(order);
			// 3 評分
			
			volunteer.setSumScore(volunteer.getSumScore() + score);
			volunteer.setScoredTimes(volunteer.getScoredTimes() + 1);
			volunteer.setAverageScore(new Double(volunteer.getSumScore() / volunteer.getScoredTimes()));
			// 4系統訊息
			// 付款後收到的訊息
			SystemMessage pay = new SystemMessage();
			pay.setSender(payer);
			pay.setReleaseTime(new Date());
			pay.setReadStatus(YesNo.N);
			pay.setMember(payer);
			pay.setMessage("您因為志工活動:[" + missionTitle + "]付款給:["
					+ volunteer.getName() + "]共" + hours + "小時已成功");
			pay.setMessageType(SystemMessageType.PayTimeValue);
			systemMessageDao.save(pay);
			// 入賬後收到的訊息
			SystemMessage earn = new SystemMessage();
			earn.setSender(payer);
			earn.setReleaseTime(new Date());
			earn.setReadStatus(YesNo.N);
			earn.setMember(volunteer);
			earn.setMessage("您參加志工活動:[" + missionTitle + "]獲得" + hours + "小時已入帳");
			earn.setMessageType(SystemMessageType.PayTimeValue);
			systemMessageDao.save(earn);
			// 使用for-each取值 檢查mission中的所有order 若全付款則將 mission 狀態改變
			int payOrderCounter = 0;
			for (Order checkOrder : mission.getOrders()) {
				if (checkOrder.getOrderStatus() == OrderStatus.ServiceFinishPayMatchSuccess) {
					payOrderCounter++;
					if (payOrderCounter == mission.getOrders().size()) {
						mission.setMissionstatus(MissionStatus.C_Finish);
						mission.setFinishDate(new Date());
						SystemMessage finishMessage = new SystemMessage();
						finishMessage.setReleaseTime(new Date());
						finishMessage.setReadStatus(YesNo.N);
						finishMessage.setMember(payer);
						finishMessage.setMessage("您刊登的志工活動:[" + missionTitle + "]已結案");
						finishMessage.setMessageType(SystemMessageType.MissionFinish);
						systemMessageDao.save(finishMessage);
					}
				}
			}

			return orderDao.save(order);

		}
		return null;
	}

}
