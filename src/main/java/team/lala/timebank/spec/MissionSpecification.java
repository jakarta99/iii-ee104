package team.lala.timebank.spec;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import org.springframework.data.jpa.domain.Specification;
import org.springframework.util.StringUtils;

import team.lala.timebank.entity.Mission;

@SuppressWarnings("serial")
public class MissionSpecification implements Specification<Mission> {

	private Mission inputMission;

	public MissionSpecification(Mission mission) {
		this.inputMission = mission;
	}

	@Override
	public Predicate toPredicate(Root<Mission> root, CriteriaQuery<?> query, CriteriaBuilder criteriaBuilder) {
		List<Predicate> list = new ArrayList<Predicate>();

		if (!StringUtils.isEmpty(inputMission.getId())) {
			list.add(criteriaBuilder.equal(root.get("id").as(String.class), inputMission.getId()));
		}

//		if (!StringUtils.isEmpty(inputMission.getJobArea())) {
//			list.add(criteriaBuilder.equal(root.get("jobArea").as(String.class), inputMission.getJobArea()));
//		}

		if (!StringUtils.isEmpty(inputMission.getServiceType())) {
			list.add(criteriaBuilder.equal(root.get("serviceType").as(String.class), inputMission.getServiceType()));
		}

		if (!StringUtils.isEmpty(inputMission.getTitle())) {
			list.add(criteriaBuilder.like(root.get("title").as(String.class),"%" + inputMission.getTitle() + "%"));
		}
		if (!StringUtils.isEmpty(inputMission.getTermType())) {
			list.add(criteriaBuilder.equal(root.get("termType").as(String.class), inputMission.getTermType()));
		}
//		if (!StringUtils.isEmpty(inputRequest.getTimeValue())) {
//			list.add(criteriaBuilder.equal(root.get("timeValue").as(String.class), inputRequest.getTimeValue()));
//		}

		Predicate[] p = new Predicate[list.size()];  
        return criteriaBuilder.and(list.toArray(p));  
	}
}
