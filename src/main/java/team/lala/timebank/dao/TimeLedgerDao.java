package team.lala.timebank.dao;

import java.time.LocalDateTime;
import java.util.Collection;

import org.springframework.data.jpa.repository.JpaRepository;

import team.lala.timebank.entity.Penalty;
import team.lala.timebank.entity.TimeLedger;

public interface TimeLedgerDao extends JpaRepository<TimeLedger, Long> {
	//查詢特定會員最近一筆交易紀錄(jasmine)
	public TimeLedger findTop1ByMemberIdOrderByTransactionTimeDesc(Long memberId);
	
	//查詢特定會員特定區間之交易紀錄(jasmine)
	public Collection<TimeLedger> findByMemberIdAndTransactionTimeBetween(Long memberId,
			LocalDateTime transactionTimeBegin, LocalDateTime transactionTimeEnd);
	
	
	public Collection<TimeLedger> findByMemberId(Long memberId);
}
