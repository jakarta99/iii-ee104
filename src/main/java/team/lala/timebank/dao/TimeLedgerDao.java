package team.lala.timebank.dao;

import java.time.LocalDateTime;
import java.util.Collection;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import team.lala.timebank.entity.TimeLedger;

public interface TimeLedgerDao extends JpaRepository<TimeLedger, Long> {
	// 查詢特定會員最近一筆交易紀錄(jasmine)
	public TimeLedger findTop1ByMemberIdOrderByTransactionTimeDesc(Long memberId);

	// 查詢特定會員特定區間之交易紀錄(jasmine)
	public List<TimeLedger> findByMemberIdAndTransactionTimeBetween(Long memberId, LocalDateTime transactionTimeBegin,
			LocalDateTime transactionTimeEnd);

	// 查詢某人的所有交易紀錄(by Anchor)
	public List<TimeLedger> findAllByMemberId(Long memberId);

}
