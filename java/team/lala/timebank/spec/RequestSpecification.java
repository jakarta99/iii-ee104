package team.lala.timebank.spec;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import org.springframework.data.jpa.domain.Specification;
import org.springframework.util.StringUtils;

import team.lala.timebank.entity.Member;
import team.lala.timebank.entity.Requests;

@SuppressWarnings("serial")
public class RequestSpecification implements Specification<Requests> {

	private Requests inputRequest;

	public RequestSpecification(Requests requests) {
		this.inputRequest = requests;
	}

	@Override
	public Predicate toPredicate(Root<Requests> root, CriteriaQuery<?> query, CriteriaBuilder criteriaBuilder) {
		List<Predicate> list = new ArrayList<Predicate>();

		if (!StringUtils.isEmpty(inputRequest.getId())) {
			list.add(criteriaBuilder.equal(root.get("id").as(String.class), inputRequest.getId()));
		}

		if (!StringUtils.isEmpty(inputRequest.getJobArea())) {
			list.add(criteriaBuilder.equal(root.get("jobArea").as(String.class), inputRequest.getJobArea()));
		}

		if (!StringUtils.isEmpty(inputRequest.getServiceType())) {
			list.add(criteriaBuilder.equal(root.get("serviceType").as(String.class), inputRequest.getServiceType()));
		}

		if (!StringUtils.isEmpty(inputRequest.getJobTitle())) {
			list.add(criteriaBuilder.like(root.get("jobTitle").as(String.class),"%" + inputRequest.getJobTitle() + "%"));
		}
		if (!StringUtils.isEmpty(inputRequest.getTermType())) {
			list.add(criteriaBuilder.equal(root.get("termType").as(String.class), inputRequest.getTermType()));
		}
//		if (!StringUtils.isEmpty(inputRequest.getTimeValue())) {
//			list.add(criteriaBuilder.equal(root.get("timeValue").as(String.class), inputRequest.getTimeValue()));
//		}

		Predicate[] p = new Predicate[list.size()];  
        return criteriaBuilder.and(list.toArray(p));  
	}
}
