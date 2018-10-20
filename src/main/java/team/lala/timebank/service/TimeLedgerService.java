package team.lala.timebank.service;

import java.time.LocalDateTime;
import java.util.Collection;

import team.lala.timebank.dao.TimeLedgerDao;
import team.lala.timebank.entity.TimeLedger;

public class TimeLedgerService {

	private TimeLedgerDao timeLedgerDao = new TimeLedgerDao();

	// 存款
	public void deposit(int hours, Long memberId) {
		timeLedgerDao.getConnection();

		// 1. findTimeLedgerByMemberId
		TimeLedger lastTimeLedger = timeLedgerDao.findTop1ByMemberIdOrderByTransactionTime(memberId);
		if (lastTimeLedger == null) {
			lastTimeLedger = new TimeLedger();
		}

		// 2. prepare timeledger data
		TimeLedger timeLedger = new TimeLedger();
		timeLedger.setMemberId(memberId);
		timeLedger.setDepositValue(hours);
		timeLedger.setBalanceValue(lastTimeLedger.getBalanceValue() + hours);
		timeLedger.setTransactionTime(LocalDateTime.now());
		timeLedger.setDescription("deposit");

		// 3. insert
		timeLedgerDao.insert(timeLedger);
		System.out.println("存款成功");
		timeLedgerDao.closeConnection();

	}

	// 提款
	public void withdrawal(int hours, Long memberId) {
		timeLedgerDao.getConnection();

		// 1. findTimeLedgerByMemberId
		TimeLedger lastTimeLedger = timeLedgerDao.findTop1ByMemberIdOrderByTransactionTime(memberId);
		if (lastTimeLedger.getBalanceValue() < hours) {
			System.out.println("餘額不足");

		}

		// 2. prepare timeledger data
		TimeLedger timeLedger = new TimeLedger();
		timeLedger.setMemberId(memberId);
		timeLedger.setWithdrawlValue(hours);
		timeLedger.setTransactionTime(LocalDateTime.now());
		timeLedger.setBalanceValue(lastTimeLedger.getBalanceValue() - hours);
		timeLedger.setDescription("withdrawal");

		// 3. insert
		timeLedgerDao.insert(timeLedger);
		System.out.println("提款成功");
		timeLedgerDao.closeConnection();

	}

	/*
	 * 查詢某段時間的交易紀錄 public void searchOneTransactionByTime(LocalDateTime
	 * transactionTimeBegin, LocalDateTime transactionTimeEnd) {
	 * timeLedgerDao.getConnection();
	 * 
	 * Collection<TimeLedger> periodMemberTimeLedgers =
	 * timeLedgerDao.findByPeriodTime(transactionTimeBegin, transactionTimeEnd); if
	 * (periodMemberTimeLedgers == null) { System.out.println("查無此會員"); }else{ for
	 * (TimeLedger timeLedger : periodMemberTimeLedgers) {
	 * System.out.print(timeLedger.getId());
	 * System.out.print(timeLedger.getMemberId());
	 * System.out.print(timeLedger.getTransactionTime());
	 * System.out.print(timeLedger.getDepositValue());
	 * System.out.print(timeLedger.getWithdrawlValue());
	 * System.out.print(timeLedger.getBalanceValue());
	 * System.out.println(timeLedger.getDescription());
	 * 
	 * } } timeLedgerDao.closeConnection(); }
	 */

	// 查詢全部交易紀錄
	public Collection<TimeLedger> searchALLTransaction(Long memberId) {
		timeLedgerDao.getConnection();

		Collection<TimeLedger> specificMemberTimeLedgers = timeLedgerDao.findByMemberId(memberId);
		if (specificMemberTimeLedgers == null) {
			System.out.println("查無此會員");
		}

		timeLedgerDao.closeConnection();
		return specificMemberTimeLedgers;
	}

	// 尋找最新一筆資料
	public TimeLedger searchLastTransaction(Long memberId) {
		timeLedgerDao.getConnection();

		TimeLedger timeLedger = timeLedgerDao.findTop1ByMemberIdOrderByTransactionTime(memberId);
		if (timeLedger == null) {
			System.out.println("查無此會員");
		}

		timeLedgerDao.closeConnection();
		return timeLedger;
	}

}
