package team.lala.timebank.spec;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import org.springframework.data.jpa.domain.Specification;
import org.springframework.util.StringUtils;

import team.lala.timebank.entity.Mission;
import team.lala.timebank.enums.TermType;

@SuppressWarnings("serial")
public class MissionSpecification implements Specification<Mission> {

	private Mission inputMission;

	public MissionSpecification(Mission mission) {
		this.inputMission = mission;
	}

	@Override
	public Predicate toPredicate(Root<Mission> root, CriteriaQuery<?> query, CriteriaBuilder criteriaBuilder) {
		List<Predicate> list = new ArrayList<Predicate>();
		
		if (!StringUtils.isEmpty(inputMission.getStatus())) {
			list.add(criteriaBuilder.equal(root.get("status").as(Integer.class), inputMission.getStatus()));
		}
		
		if (!StringUtils.isEmpty(inputMission.getMemberId())) {
			list.add(criteriaBuilder.equal(root.get("memberId").as(Long.class), inputMission.getMemberId()));
		}
	
		if (!StringUtils.isEmpty(inputMission.getCounty())) {
			list.add(criteriaBuilder.equal(root.get("county").as(String.class), inputMission.getCounty()));
		}

		if (!StringUtils.isEmpty(inputMission.getDistrict())) {
			list.add(criteriaBuilder.equal(root.get("district").as(String.class), inputMission.getDistrict()));
		}

		if (!StringUtils.isEmpty(inputMission.getStartDate())) {
			list.add(criteriaBuilder.greaterThanOrEqualTo(root.get("startDate").as(Date.class),
					inputMission.getStartDate()));
		}
		if (!StringUtils.isEmpty(inputMission.getEndDate())) {
			list.add(criteriaBuilder.lessThanOrEqualTo(root.get("endDate").as(Date.class), inputMission.getEndDate()));
		}

		if (!StringUtils.isEmpty(inputMission.getServiceType())) {
			list.add(criteriaBuilder.equal(root.get("serviceType").as(String.class), inputMission.getServiceType()));
		}

		if (!StringUtils.isEmpty(inputMission.getTitle())) {
			list.add(criteriaBuilder.like(root.get("title").as(String.class), "%" + inputMission.getTitle() + "%"));
		}
		if (!StringUtils.isEmpty(inputMission.getTermType())) {
			list.add(criteriaBuilder.equal(root.get("termType").as(TermType.class), inputMission.getTermType()));
		}

		if (!StringUtils.isEmpty(inputMission.getTimeValue())) {
			list.add(criteriaBuilder.greaterThanOrEqualTo(root.get("timeValue").as(Integer.class),
					inputMission.getTimeValue()));
		}

		Predicate[] p = new Predicate[list.size()];
		return criteriaBuilder.and(list.toArray(p));
	}
}
