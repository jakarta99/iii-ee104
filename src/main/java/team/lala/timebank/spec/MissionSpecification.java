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
import team.lala.timebank.entity.Mission;
import team.lala.timebank.enums.MissionStatus;
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
		
		if (!StringUtils.isEmpty(inputMission.getMissionstatus())) {
			
			
			if(inputMission.getMissionstatus() == MissionStatus.A_New||inputMission.getMissionstatus()==MissionStatus.A_VolunteerApproved) {
				list.add(criteriaBuilder.in(root.get("missionstatus").as(MissionStatus.class)).value(MissionStatus.A_New).value(MissionStatus.A_VolunteerApproved));
			}else if (inputMission.getMissionstatus()==MissionStatus.B_AccountsPayable) {
				list.add(criteriaBuilder.equal(root.get("missionstatus").as(MissionStatus.class), inputMission.getMissionstatus()));
			}else if(inputMission.getMissionstatus()==MissionStatus.C_Cancel||inputMission.getMissionstatus()==MissionStatus.C_Finish){
				list.add(criteriaBuilder.in(root.get("missionstatus").as(MissionStatus.class)).value(MissionStatus.C_Cancel).value(MissionStatus.C_Finish));
			}else
			list.add(criteriaBuilder.equal(root.get("missionstatus").as(MissionStatus.class), inputMission.getMissionstatus()));
		}

		if (!StringUtils.isEmpty(inputMission.getAutoPayDate())) {
			list.add(criteriaBuilder.lessThanOrEqualTo(root.get("autoPayDate").as(Date.class), inputMission.getAutoPayDate()));
		}
		if (!StringUtils.isEmpty(inputMission.getTitle())) {
			list.add(criteriaBuilder.like(root.get("title").as(String.class), "%" + inputMission.getTitle() + "%"));
		}
		
		
		if (!StringUtils.isEmpty(inputMission.getMissionStatusTransient())) {
			list.add(criteriaBuilder.in(root.get("missionstatus").as(MissionStatus.class)).value(MissionStatus.A_New));
		}

		if (!StringUtils.isEmpty(inputMission.getMemberAccount())) {
			Join<Member, Mission> join = root.join("member", JoinType.LEFT);
			list.add(criteriaBuilder.equal(join.get("account"), inputMission.getMemberAccount()));
		}

		if (!StringUtils.isEmpty(inputMission.getServiceTypeDetail())) {
			Join<Member, Mission> join = root.join("serviceType", JoinType.LEFT);
			list.add(criteriaBuilder.equal(join.get("serviceType"), inputMission.getServiceTypeDetail()));
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
