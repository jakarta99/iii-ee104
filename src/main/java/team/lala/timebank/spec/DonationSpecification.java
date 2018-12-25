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

import com.nimbusds.oauth2.sdk.id.Actor;

import team.lala.timebank.entity.Donation;
import team.lala.timebank.entity.Member;

@SuppressWarnings("serial")
public class DonationSpecification implements Specification<Donation> {

	private Donation inputDonation;

	public DonationSpecification(Donation donation) {
		this.inputDonation = donation;
	}

	@Override
	public Predicate toPredicate(Root<Donation> root, CriteriaQuery<?> query, CriteriaBuilder criteriaBuilder) {
		List<Predicate> list = new ArrayList<Predicate>();

		if (!StringUtils.isEmpty(inputDonation.getDonateTimeBegin())
				&& StringUtils.isEmpty(inputDonation.getDonateTimeEnd())) {
			list.add(criteriaBuilder.greaterThanOrEqualTo(root.get("donateTime").as(Date.class),
					inputDonation.getDonateTimeBegin()));
		}
		if (!StringUtils.isEmpty(inputDonation.getDonateTimeEnd())
				&& StringUtils.isEmpty(inputDonation.getDonateTimeBegin())) {
			list.add(criteriaBuilder.lessThanOrEqualTo(root.get("donateTime").as(Date.class),
					inputDonation.getDonateTimeEnd()));
		}
		if (!StringUtils.isEmpty(inputDonation.getDonateTimeBegin())
				&& !StringUtils.isEmpty(inputDonation.getDonateTimeEnd())) {
			list.add(criteriaBuilder.between(root.get("donateTime").as(Date.class), inputDonation.getDonateTimeBegin(),
					inputDonation.getDonateTimeEnd()));
		}

		if (!StringUtils.isEmpty(inputDonation.getOrgDoneeAccount())) {
			Join<Member, Donation> join = root.join("orgDonee", JoinType.LEFT);
			list.add(criteriaBuilder.equal(join.get("account"),  inputDonation.getOrgDoneeAccount()));

		}

		if (!StringUtils.isEmpty(inputDonation.getDonatorAccount())) {
			Join<Member, Donation> join = root.join("donator", JoinType.LEFT);
			list.add(criteriaBuilder.equal(join.get("account"),  inputDonation.getDonatorAccount()));
		}

		
		
		if (!StringUtils.isEmpty(inputDonation.getId())) {
			list.add(criteriaBuilder.equal(root.get("id").as(Long.class), inputDonation.getId()));
		}
		Predicate[] p = new Predicate[list.size()];
		return criteriaBuilder.and(list.toArray(p));

	}

}
