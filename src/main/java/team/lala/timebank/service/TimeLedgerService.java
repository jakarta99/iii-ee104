package team.lala.timebank.service;

import java.security.Principal;
import java.time.LocalDateTime;
import java.util.Date;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import team.lala.timebank.dao.MemberDao;
import team.lala.timebank.dao.TimeLedgerDao;
import team.lala.timebank.entity.Member;
import team.lala.timebank.entity.Penalty;
import team.lala.timebank.entity.TimeLedger;
import team.lala.timebank.spec.TimeLedgerSpecification;

@Slf4j
@Service
public class TimeLedgerService {

	@Autowired
	private TimeLedgerDao timeLedgerDao;
	
	@Autowired
	private MemberDao memberDao;

	// 存款
	public TimeLedger deposit(int hours, Long memberId) {
		// 1.找出會員最近一筆交易紀錄
		TimeLedger lastTimeLedger = timeLedgerDao.findTop1ByMemberIdOrderByTransactionTimeDesc(memberDao.getOne(memberId));

		// 尚無交易紀錄者，先將存款餘額設為0
		if (lastTimeLedger == null) {
			lastTimeLedger = new TimeLedger();
			lastTimeLedger.setBalanceValue(0); // balanceValue型別為Integer，預設null改為0
			log.debug("會員第一次交易");
		}

		// 2. prepare timeledger data
		TimeLedger timeLedger = new TimeLedger();
		timeLedger.setMemberId(memberDao.getOne(memberId));
		timeLedger.setDepositValue(hours);
		timeLedger.setBalanceValue(lastTimeLedger.getBalanceValue() + hours);
		timeLedger.setTransactionTime(new Date());
		timeLedger.setDescription("deposit");

		// 3. insert
		return timeLedgerDao.save(timeLedger);
	}

	// 提款
	public TimeLedger withdrawal(Integer hours, Long memberId) {
		// 1. findTimeLedgerByMemberId
		TimeLedger lastTimeLedger = timeLedgerDao.findTop1ByMemberIdOrderByTransactionTimeDesc(memberDao.getOne(memberId));
		TimeLedger timeLedger = null;

		// 尚無交易紀錄，或帳戶餘額小於本次提款時數者，不得提款
		if (lastTimeLedger != null && lastTimeLedger.getBalanceValue() >= hours) {
			// 2. prepare timeledger data
			timeLedger = new TimeLedger();
			timeLedger.setMemberId(memberDao.getOne(memberId));
			timeLedger.setWithdrawalValue(hours);
			timeLedger.setTransactionTime(new Date());
			timeLedger.setBalanceValue(lastTimeLedger.getBalanceValue() - hours);
			timeLedger.setDescription("withdrawal");
		}
		// 3. insert
		return timeLedgerDao.save(timeLedger);

	}
	
	//Jasmine
	//審核檢舉案完畢後，進行扣款(未完成)
	//transaction_type還沒加入entity中，待改完要再加
	public TimeLedger doPenaltyDebit(Penalty penalty) {
		
		// 1. findTimeLedgerByMemberId
		log.debug("檢舉者ID={}", penalty.getDefendant().getId());
		TimeLedger lastTimeLedger = 
				timeLedgerDao.findTop1ByMemberIdOrderByTransactionTimeDesc(memberDao.getOne(penalty.getDefendant().getId()));
		log.debug("最後一筆交易紀錄={}", lastTimeLedger);
		//如果尚無交易紀錄，則先將餘額設為0元
		if(lastTimeLedger == null || lastTimeLedger.getBalanceValue() == null) {
			lastTimeLedger.setBalanceValue(0);
		}

		// 2. prepare PenaltyTimeledger data(可以倒扣)
		TimeLedger timeLedger = new TimeLedger();
		timeLedger.setMemberId(penalty.getDefendant());
		timeLedger.setWithdrawalValue(penalty.getPenaltyTimeValue());
		timeLedger.setDepositValue(0);
		timeLedger.setTransactionTime(new Date());
		timeLedger.setBalanceValue(lastTimeLedger.getBalanceValue() - penalty.getPenaltyTimeValue());
		String peanltyReason = "[違規處罰] 活動日期:"
				+ penalty.getOrder().getMission().getStartDate().toString()
				+ " ~ "
				+ penalty.getOrder().getMission().getEndDate().toString()
				+ ", 活動名稱:"
				+ penalty.getOrder().getMission().getTitle(); //活動日期+活動名稱+"-違規處罰"
		timeLedger.setDescription(peanltyReason);
		log.debug("扣款紀錄={}", timeLedger);
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
//	public TimeLedger save(TimeLedger timeLedger) {
//		timeLedger.setTransactionTime(LocalDateTime.now());
//		timeLedgerDao.save(timeLedger);
//		return timeLedger;
//	}
	
	public TimeLedger insert(TimeLedger newTimeLedger) {
		newTimeLedger.setTransactionTime(new Date());
		TimeLedger timeLedger = timeLedgerDao.save(newTimeLedger);
		return timeLedger;		
	}
	
	public TimeLedger update(TimeLedger timeLedger) {
		TimeLedger dbTimeLedger = null;
		if(timeLedger.getId() != null) {
			dbTimeLedger = timeLedgerDao.getOne(timeLedger.getId());
			dbTimeLedger.setBalanceValue(timeLedger.getBalanceValue());
			dbTimeLedger.setDepositValue(timeLedger.getDepositValue());
			dbTimeLedger.setDescription(timeLedger.getDescription());
			dbTimeLedger.setMemberId(timeLedger.getMemberId());
			dbTimeLedger.setTransactionTime(timeLedger.getTransactionTime());
			dbTimeLedger.setWithdrawalValue(timeLedger.getWithdrawalValue());
			dbTimeLedger = timeLedgerDao.save(dbTimeLedger);
		}
		return timeLedger;
	}

	// 刪除一筆資料
	public void delete(Long id) {
		timeLedgerDao.deleteById(id);
		log.debug("刪除單筆存摺資料成功");
	}

	// 查詢全部交易紀錄
	public List<TimeLedger> findAll() {
		List<TimeLedger> specificMemberTimeLedgers = timeLedgerDao.findAll();
		return specificMemberTimeLedgers;
	}

	// 尋找最新一筆資料 更新by Brian
	public TimeLedger getLastTransaction(Long memberId) {
		TimeLedger timeLedger = timeLedgerDao.findTop1ByMemberIdOrderByTransactionTimeDesc(memberDao.getOne(memberId));
		if (timeLedger == null) {
			return null;
		}
		return timeLedger;
	}
	
	public TimeLedger findById(Long id) {
		Optional<TimeLedger> t = timeLedgerDao.findById(id);
		TimeLedger timeLedger = t.orElse(null);
		return timeLedger;
	}
	
	public List<TimeLedger> findBySpecification(Specification<TimeLedger> specification) {
		return timeLedgerDao.findAll(specification);
	}
	
	public Page<TimeLedger> findBySpecification(Specification<TimeLedger> specification, PageRequest pageRequest) {
		return timeLedgerDao.findAll(specification, pageRequest);
	}
	
	// 尋找一名會員所有資料 更新by Anchor
	public Page<TimeLedger> findByMemberId(Member member, int page, Optional<Integer> length) {
		Page<TimeLedger> timeLedgers = timeLedgerDao.findByMemberId(member,PageRequest.of(page, length.orElse(10)));
		return timeLedgers;
	}
	
	// list for user
	public Page<TimeLedger> findByMemberIdAndSpecification(Principal principal, TimeLedger timeLedger, PageRequest pageRequest) {
//		timeLedger.setMemberId(memberDao.findByAccount(principal.getName()));
		timeLedger.setMemberAccount(principal.getName());	//可共用spec中的setMemberAccount判斷
		TimeLedgerSpecification timeLedgerSpec = new TimeLedgerSpecification(timeLedger);
		Page<TimeLedger> timeLedgers = this.findBySpecification(timeLedgerSpec, pageRequest);
		return timeLedgers;
	}
	
	// 根據memberId找出所有的timeLedger
	public List<TimeLedger> findByMemberId(Member memberId) {
		List<TimeLedger> timeLedgers = timeLedgerDao.findByMemberId(memberId);
		return timeLedgers;
	}
}
