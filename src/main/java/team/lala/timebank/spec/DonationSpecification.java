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

import team.lala.timebank.entity.Donation;

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
				&& !StringUtils.isEmpty(inputDonation.getDonateTimeEnd())) {
			list.add(criteriaBuilder.between(root.get("donateTime").as(LocalDateTime.class),
					inputDonation.getDonateTimeBegin(), inputDonation.getDonateTimeEnd()));
		}
		if (!StringUtils.isEmpty(inputDonation.getMemberId())) {
			list.add(criteriaBuilder.equal(root.get("memberId").as(Long.class), inputDonation.getMemberId()));
		}
		if (!StringUtils.isEmpty(inputDonation.getId())) {
			list.add(criteriaBuilder.equal(root.get("id").as(Long.class), inputDonation.getId()));
		}
		Predicate[] p = new Predicate[list.size()];
		return criteriaBuilder.and(list.toArray(p));

	}

}
