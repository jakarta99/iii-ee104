package team.lala.timebank.service;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import team.lala.timebank.dao.MemberDao;
import team.lala.timebank.dao.MissionDao;
import team.lala.timebank.dao.OrderDao;
import team.lala.timebank.dao.TimeLedgerDao;
import team.lala.timebank.entity.Member;
import team.lala.timebank.entity.Order;
import team.lala.timebank.entity.TimeLedger;
import team.lala.timebank.enums.OrderStatus;

@Slf4j
@Service
public class PayService {
	@Autowired
	private TimeLedgerDao timeLedgerDao;

	@Autowired
	private MemberDao memberDao;

	@Autowired
	private OrderDao orderDao;

	@Autowired
	private MissionDao missionDao;

	// 交易
	public Order transaction(Integer hours, Long volunteerId, Long payerId, String missionTitle, Long orderId,Integer score) {

		//變更order 狀態
		Order order = orderDao.getOne(orderId);
		if (order.getOrderStatus() == OrderStatus.ServiceFinishNotPay) {

			// 1 payer扣錢
			// 1.1 找出payer
			TimeLedger payerLastTimeLedger = timeLedgerDao
					.findTop1ByMemberIdOrderByTransactionTimeDesc(memberDao.getOne(payerId));
			TimeLedger payerTimeLedger = null;

			// 尚無交易紀錄，或帳戶餘額小於本次提款時數者，不得提款
			if (payerLastTimeLedger != null && payerLastTimeLedger.getBalanceValue() >= hours) {
				// 1.2 prepare timeledger data
				payerTimeLedger = new TimeLedger();
				payerTimeLedger.setDepositValue(0);
				payerTimeLedger.setMemberId(memberDao.getOne(payerId));
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
					.findTop1ByMemberIdOrderByTransactionTimeDesc(memberDao.getOne(volunteerId));

			// 尚無交易紀錄者，先將存款餘額設為0
			if (volunteerLastTimeLedger == null) {
				volunteerLastTimeLedger = new TimeLedger();
				volunteerLastTimeLedger.setBalanceValue(0); // balanceValue型別為Integer，預設null改為0
				log.debug("會員第一次交易");
			}

			// 2.2 prepare timeledger data
			TimeLedger volunteerTimeLedger = new TimeLedger();
			volunteerTimeLedger.setWithdrawalValue(0);
			volunteerTimeLedger.setMemberId(memberDao.getOne(volunteerId));
			volunteerTimeLedger.setDepositValue(hours);
			volunteerTimeLedger.setBalanceValue(volunteerLastTimeLedger.getBalanceValue() + hours);
			volunteerTimeLedger.setTransactionTime(new Date());
			volunteerTimeLedger.setDescription(missionTitle + "存入");

			// 2.3 insert
			timeLedgerDao.save(volunteerTimeLedger);
			order.setOrderStatus(OrderStatus.ServiceFinishPayMatchSuccess);
			
			Member volunteer=memberDao.getOne(volunteerId);
			volunteer.setSumScore(volunteer.getSumScore()+score);			
			volunteer.setScoredTimes(volunteer.getScoredTimes()+1);
			volunteer.setAverageScore(new Double(volunteer.getSumScore()/volunteer.getScoredTimes()));
			
			
			return orderDao.save(order);
			
			
		}
		return null;
	}

}
