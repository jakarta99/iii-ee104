package team.lala.timebank.spec;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import org.springframework.data.jpa.domain.Specification;
import org.springframework.util.StringUtils;

import team.lala.timebank.entity.Penalty;

@SuppressWarnings("serial")
public class PenaltySpecification implements Specification<Penalty> {

	private Penalty inputPenalty;

	public PenaltySpecification(Penalty penalty) {
		this.inputPenalty = penalty;
	}

	@Override
	public Predicate toPredicate(Root<Penalty> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
		List<Predicate> list = new ArrayList<Predicate>();

		if (!StringUtils.isEmpty(inputPenalty.getOrderListId())) {
			list.add(cb.equal(root.get("orderListId").as(String.class), inputPenalty.getOrderListId()));
		}
		if (!StringUtils.isEmpty(inputPenalty.getMemberId())) {
			list.add(cb.equal(root.get("memberId").as(String.class), inputPenalty.getMemberId()));
		}
		if (!StringUtils.isEmpty(inputPenalty.getUpdateDate())) {
			list.add(cb.between(root.get("updateDate").as(LocalDateTime.class),
					root.get("dateBefore").as(LocalDateTime.class), root.get("dateAfter").as(LocalDateTime.class)));
		}
		if (!StringUtils.isEmpty(inputPenalty.getDescription())) {
			list.add(cb.like(root.get("description").as(String.class), "%" + inputPenalty.getDescription() + "%"));
		}
		if (!StringUtils.isEmpty(inputPenalty.getStatus())) {
			list.add(cb.equal(root.get("status").as(String.class), inputPenalty.getStatus()));
		}
		if (!StringUtils.isEmpty(inputPenalty.getPenaltyTimeValue())) {
			list.add(cb.ge(root.get("penaltyTimeValue").as(Integer.class), 0));
		}

		Predicate[] p = new Predicate[list.size()];
		return cb.and(list.toArray(p));
	}

}
