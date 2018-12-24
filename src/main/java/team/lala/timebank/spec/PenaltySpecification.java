package team.lala.timebank.spec;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import org.springframework.data.jpa.domain.Specification;
import org.springframework.util.StringUtils;

import lombok.extern.slf4j.Slf4j;
import team.lala.timebank.entity.Order;
import team.lala.timebank.entity.Penalty;
import team.lala.timebank.web.penalty.PenaltyController;

@Slf4j
@SuppressWarnings("serial")
public class PenaltySpecification implements Specification<Penalty> {

	private Penalty inputPenalty;

	public PenaltySpecification(Penalty penalty) {
		this.inputPenalty = penalty;
	}

	@Override
	public Predicate toPredicate(Root<Penalty> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
		List<Predicate> list = new ArrayList<Predicate>();
		if (!StringUtils.isEmpty(inputPenalty.getId())) {
			list.add(cb.equal(root.get("id").as(String.class), inputPenalty.getId()));
		}
//		log.debug("orderId={}", inputPenalty.getOrder().getId());
//		if (!StringUtils.isEmpty(inputPenalty.getOrder().getId())) {
//			list.add(cb.equal(root.get("order_list").as(Long.class), inputPenalty.getOrder().getId()));
//		}
		if (!StringUtils.isEmpty(inputPenalty.getAccuser())) {
			list.add(cb.equal(root.get("accuser").as(String.class), inputPenalty.getAccuser()));
		}
//		if (!StringUtils.isEmpty(inputPenalty.getDefendant().getId())) {
//			list.add(cb.equal(root.get("MEMBER").as(String.class), inputPenalty.getDefendant().getId()));
//		}
		
		if (!StringUtils.isEmpty(inputPenalty.getDateBefore())) {
			list.add(cb.greaterThanOrEqualTo(root.get("updateDate").as(java.util.Date.class),
					inputPenalty.getDateBefore()));
		}
		if (!StringUtils.isEmpty(inputPenalty.getDateAfter())) {
			list.add(cb.lessThanOrEqualTo(root.get("updateDate").as(java.util.Date.class),
					inputPenalty.getDateAfter()));
		}
		if (!StringUtils.isEmpty(inputPenalty.getDescription())) {
			list.add(cb.like(root.get("description").as(String.class), "%" + inputPenalty.getDescription() + "%"));
		}
		if (!StringUtils.isEmpty(inputPenalty.getStatus())) {
			list.add(cb.equal(root.get("status").as(String.class), inputPenalty.getStatus()));
		}
		if (!StringUtils.isEmpty(inputPenalty.getPenaltyTimeValue())) {
			list.add(cb.equal(root.get("penaltyTimeValue").as(Integer.class), inputPenalty.getPenaltyTimeValue()));
		}
		log.debug("list.size={}",list.size());
		Predicate[] p = new Predicate[list.size()];
		return cb.and(list.toArray(p));
	}

}
