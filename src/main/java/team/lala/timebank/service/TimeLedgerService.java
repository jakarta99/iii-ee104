package team.lala.timebank.service;

import java.time.LocalDateTime;
import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import team.lala.timebank.dao.TimeLedgerDao;
import team.lala.timebank.entity.Penalty;
import team.lala.timebank.entity.TimeLedger;

@Service
public class TimeLedgerService {

	@Autowired
	private TimeLedgerDao timeLedgerDao;

	// 存款
	public void deposit(int hours, Long memberId) {
		// 1.找出會員最近一筆交易紀錄
		TimeLedger lastTimeLedger = timeLedgerDao.findTop1ByMemberIdOrderByTransactionTimeDesc(memberId);

		// 尚無交易紀錄者，先將存款餘額設為0
		if (lastTimeLedger == null) {
			lastTimeLedger = new TimeLedger();
			lastTimeLedger.setBalanceValue(0); // balanceValue型別為Integer，預設null改為0
			System.out.println("會員第一次交易");
		}

		// 2. prepare timeledger data
		TimeLedger timeLedger = new TimeLedger();
		timeLedger.setMemberId(memberId);
		timeLedger.setDepositValue(hours);
		timeLedger.setBalanceValue(lastTimeLedger.getBalanceValue() + hours);
		timeLedger.setTransactionTime(LocalDateTime.now());
		timeLedger.setDescription("deposit");

		// 3. insert
		timeLedgerDao.save(timeLedger);
		System.out.println("存款成功");
	}

	// 提款
	public void withdrawal(Integer hours, Long memberId) {
		// 1. findTimeLedgerByMemberId
		TimeLedger lastTimeLedger = timeLedgerDao.findTop1ByMemberIdOrderByTransactionTimeDesc(memberId);

		// 尚無交易紀錄，或帳戶餘額小於本次提款時數者，不得提款
		if (lastTimeLedger == null || lastTimeLedger.getBalanceValue() < hours) {
			System.out.println("餘額不足，不得提款");
		} else {
			// 2. prepare timeledger data
			TimeLedger timeLedger = new TimeLedger();
			timeLedger.setMemberId(memberId);
			timeLedger.setWithdrawalValue(hours);
			timeLedger.setTransactionTime(LocalDateTime.now());
			timeLedger.setBalanceValue(lastTimeLedger.getBalanceValue() - hours);
			timeLedger.setDescription("withdrawal");

			// 3. insert
			timeLedgerDao.save(timeLedger);
			System.out.println("提款成功");
		}

	}

	// 查詢特定會員某段時間的交易紀錄
	public void searchTransactionByMemberIdAndTime(Long memberId, LocalDateTime transactionTimeBegin,
			LocalDateTime transactionTimeEnd) {
		Collection<TimeLedger> periodSpecificMemberTimeLedgers = timeLedgerDao
				.findByMemberIdAndTransactionTimeBetween(memberId, transactionTimeBegin, transactionTimeEnd);
		if (periodSpecificMemberTimeLedgers.isEmpty()) {
			System.out.println("此區間查無交易紀錄");
		} else {
			for (TimeLedger timeLedger : periodSpecificMemberTimeLedgers) {
				System.out.print(timeLedger.toString());
			}
		}
	}

	// 更新一筆資料
	public void update(TimeLedger timeLedger) {
		timeLedgerDao.save(timeLedger);
		System.out.println("更新單筆存摺資料成功");
	}

	// 刪除一筆資料
	public void delete(Long id) {
		timeLedgerDao.deleteById(id);
		System.out.println("刪除單筆存摺資料成功");
	}

	// 查詢全部交易紀錄
	public Collection<TimeLedger> getAll(Long memberId) {
		Collection<TimeLedger> specificMemberTimeLedgers = timeLedgerDao.findAll();
		return specificMemberTimeLedgers;
	}

	// 尋找最新一筆資料
	public TimeLedger searchLastTransaction(Long memberId) {
		TimeLedger timeLedger = timeLedgerDao.findTop1ByMemberIdOrderByTransactionTimeDesc(memberId);
		// 尚無交易紀錄者
		if (timeLedger == null) {
			System.out.println("會員尚無交易紀錄");
		}
		return timeLedger;
	}

	public int getBalanceValueByMemberId(Long memberId) {
		int balanceValue = 0;
		
		TimeLedger timeLedger = timeLedgerDao.findTop1ByMemberIdOrderByTransactionTimeDesc(memberId);
		if (timeLedger == null) {
			balanceValue=0;
		}else {

		balanceValue += timeLedger.getBalanceValue();
		}
		return balanceValue;

	}

}
