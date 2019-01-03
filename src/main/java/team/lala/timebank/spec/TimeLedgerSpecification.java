package team.lala.timebank.spec;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Join;
import javax.persistence.criteria.JoinType;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import org.springframework.data.jpa.domain.Specification;
import org.springframework.util.StringUtils;

import team.lala.timebank.entity.Donation;
import team.lala.timebank.entity.Member;
import team.lala.timebank.entity.TimeLedger;

@SuppressWarnings("serial")
public class TimeLedgerSpecification implements Specification<TimeLedger> {
	private TimeLedger inputTimeLedger;

	public TimeLedgerSpecification(TimeLedger timeLedger) {
		this.inputTimeLedger = timeLedger;
	}
	
	@Override
	public Predicate toPredicate(Root<TimeLedger> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
		List<Predicate> list = new ArrayList<Predicate>();
		
		if (!StringUtils.isEmpty(inputTimeLedger.getTransactionTimeBegin())
				&& StringUtils.isEmpty(inputTimeLedger.getTransactionTimeEnd())) {
			list.add(cb.greaterThanOrEqualTo(root.get("transactionTime").as(Date.class),
					inputTimeLedger.getTransactionTimeBegin()));
		}
		if (!StringUtils.isEmpty(inputTimeLedger.getTransactionTimeEnd())
				&& StringUtils.isEmpty(inputTimeLedger.getTransactionTimeBegin())) {
			list.add(cb.lessThanOrEqualTo(root.get("transactionTime").as(Date.class),
					inputTimeLedger.getTransactionTimeEnd()));
		}
		if (!StringUtils.isEmpty(inputTimeLedger.getTransactionTimeBegin())
				&& !StringUtils.isEmpty(inputTimeLedger.getTransactionTimeEnd())) {
			list.add(cb.between(root.get("transactionTime").as(Date.class), inputTimeLedger.getTransactionTimeBegin(),
					inputTimeLedger.getTransactionTimeEnd()));
		}
		
		if(!StringUtils.isEmpty(inputTimeLedger.getId())) {
			list.add(cb.equal(root.get("id").as(Long.class), inputTimeLedger.getId()));
		}
		
//		//user transaction-record
//		if(!StringUtils.isEmpty(inputTimeLedger.getMemberId())) {
//			
////			Join<Member, TimeLedger> join = root.join("memberId", JoinType.LEFT);
////			list.add(cb.equal(join.get("account"),  inputTimeLedger.getMemberId()));
//			
//			list.add(cb.equal(root.get("memberId").as(Member.class), inputTimeLedger.getMemberId()));
//		}
		
		//前端接收MemberAccount，傳入memberId(member)，與member的account欄位join
		if(!StringUtils.isEmpty(inputTimeLedger.getMemberAccount())) {
			Join<Member, TimeLedger> join = root.join("memberId", JoinType.LEFT);
			list.add(cb.equal(join.get("account"),  inputTimeLedger.getMemberAccount()));
		}
		
		if(!StringUtils.isEmpty(inputTimeLedger.getDescription())) {
			list.add(cb.equal(root.get("description").as(String.class), inputTimeLedger.getDescription()));
		}
		
		if(!StringUtils.isEmpty(inputTimeLedger.getDepositValue())) {
			list.add(cb.equal(root.get("depositValue").as(Integer.class), inputTimeLedger.getDepositValue()));
		}
		
		if(!StringUtils.isEmpty(inputTimeLedger.getWithdrawalValue())) {
			list.add(cb.equal(root.get("withdrawalValue").as(Integer.class), inputTimeLedger.getWithdrawalValue()));
		}
		
		if(!StringUtils.isEmpty(inputTimeLedger.getBalanceValue())) {
			list.add(cb.equal(root.get("balanceValue").as(Integer.class), inputTimeLedger.getBalanceValue()));
		}

		Predicate[] p = new Predicate[list.size()];  
        return cb.and(list.toArray(p));
	}
	
}
