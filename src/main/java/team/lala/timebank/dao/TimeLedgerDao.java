package team.lala.timebank.dao;

import java.time.LocalDateTime;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

import team.lala.timebank.entity.Member;
import team.lala.timebank.entity.TimeLedger;

public interface TimeLedgerDao extends JpaRepository<TimeLedger, Long>, JpaSpecificationExecutor<TimeLedger>  {
	// 查詢特定會員最近一筆交易紀錄(jasmine)
	public TimeLedger findTop1ByMemberIdOrderByTransactionTimeDesc(Member member);

	// 查詢特定會員特定區間之交易紀錄(jasmine)
	public List<TimeLedger> findByMemberIdAndTransactionTimeBetween(Long memberId, LocalDateTime transactionTimeBegin,
			LocalDateTime transactionTimeEnd);

	// 查詢某人的所有交易紀錄(by Anchor)
	public List<TimeLedger> findByMemberId(Long memberId);

}
