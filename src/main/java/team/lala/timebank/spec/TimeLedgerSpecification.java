package team.lala.timebank.spec;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import org.springframework.data.jpa.domain.Specification;
import org.springframework.util.StringUtils;

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
		
//		if (!StringUtils.isEmpty(inputTimeLedger.getTransactionTime())) {
//            list.add(cb.equal(root.get("transactionTime").as(java.time.LocalDateTime.class), inputTimeLedger.getTransactionTime()));
//        }
		
		if(!StringUtils.isEmpty(inputTimeLedger.getId())) {
			list.add(cb.equal(root.get("id").as(Long.class), inputTimeLedger.getId()));
		}
		
		if(!StringUtils.isEmpty(inputTimeLedger.getMemberId())) {
			list.add(cb.equal(root.get("memberId").as(Long.class), inputTimeLedger.getMemberId()));
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
