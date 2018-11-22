package team.lala.timebank.service;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import team.lala.timebank.dao.TimeLedgerDao;
import team.lala.timebank.entity.TimeLedger;

@Service
public class TimeLedgerService {

	@Autowired
	private TimeLedgerDao timeLedgerDao;

	// 存款
	public TimeLedger deposit(int hours, Long memberId) {
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
		return timeLedgerDao.save(timeLedger);
	}

	// 提款
	public TimeLedger withdrawal(Integer hours, Long memberId) {
		// 1. findTimeLedgerByMemberId
		TimeLedger lastTimeLedger = timeLedgerDao.findTop1ByMemberIdOrderByTransactionTimeDesc(memberId);
		TimeLedger timeLedger = null;

		// 尚無交易紀錄，或帳戶餘額小於本次提款時數者，不得提款
		if (lastTimeLedger != null && lastTimeLedger.getBalanceValue() >= hours) {
			// 2. prepare timeledger data
			timeLedger = new TimeLedger();
			timeLedger.setMemberId(memberId);
			timeLedger.setWithdrawalValue(hours);
			timeLedger.setTransactionTime(LocalDateTime.now());
			timeLedger.setBalanceValue(lastTimeLedger.getBalanceValue() - hours);
			timeLedger.setDescription("withdrawal");
		}
		// 3. insert
		return timeLedgerDao.save(timeLedger);

	}

	// 查詢特定會員某段時間的交易紀錄
	public List<TimeLedger> findByMemberIdAndTransactionTimeBetween(Long memberId, LocalDateTime transactionTimeBegin,
			LocalDateTime transactionTimeEnd) {
		List<TimeLedger> periodSpecificMemberTimeLedgers = timeLedgerDao
				.findByMemberIdAndTransactionTimeBetween(memberId, transactionTimeBegin, transactionTimeEnd);
		return periodSpecificMemberTimeLedgers;
	}

	// 更新一筆資料
	public TimeLedger save(TimeLedger timeLedger) {
		timeLedgerDao.save(timeLedger);
		return timeLedger;
	}

	// 刪除一筆資料
	public void delete(Long id) {
		timeLedgerDao.deleteById(id);
		System.out.println("刪除單筆存摺資料成功");
	}

	// 查詢全部交易紀錄
	public List<TimeLedger> findAll() {
		List<TimeLedger> specificMemberTimeLedgers = timeLedgerDao.findAll();
		return specificMemberTimeLedgers;
	}

	// 尋找最新一筆資料 更新by Brian
	public TimeLedger getLastTransaction(Long memberId) {
		TimeLedger timeLedger = timeLedgerDao.findTop1ByMemberIdOrderByTransactionTimeDesc(memberId);
		if (timeLedger == null) {
			return null;
		}
		return timeLedger;
	}

	// 尋找一名會員所有資料 更新by Anchor
//	public List<TimeLedger> findAllByMemberId(Long memberId) {
//		List<TimeLedger> timeLedgers = timeLedgerDao.findAllByMemberId(memberId);
//		return timeLedgers;
//	}
	
	public TimeLedger findById(Long id) {
		Optional<TimeLedger> t = timeLedgerDao.findById(id);
		TimeLedger timeLedger = t.orElse(null);
		return timeLedger;
	}
	
	

}
