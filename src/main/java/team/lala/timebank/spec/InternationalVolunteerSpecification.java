package team.lala.timebank.spec;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import org.springframework.data.jpa.domain.Specification;
import org.springframework.util.StringUtils;

import team.lala.timebank.entity.InternationalVolunteer;


@SuppressWarnings("serial")
public class InternationalVolunteerSpecification implements Specification<InternationalVolunteer> {
	
	private InternationalVolunteer iVolunteer;
	
	public InternationalVolunteerSpecification(InternationalVolunteer iVolunteer) {
		this.iVolunteer = iVolunteer;
	}

	@Override
	public Predicate toPredicate(Root<InternationalVolunteer> root, CriteriaQuery<?> query,
			CriteriaBuilder cb) {
		List<Predicate> list = new ArrayList<Predicate>();
		
		if (!StringUtils.isEmpty(iVolunteer.getContinent())) {
			list.add(cb.equal(root.get("continent").as(String.class), iVolunteer.getContinent()));
		}
		
		//查詢項目開始日期是否晚於查詢日期或是自由選擇出發日期
		if (!StringUtils.isEmpty(iVolunteer.getDateChosenStart()) ) {
			list.add(cb.or(cb.isNull(root.get("startDate").as(Date.class)),
				cb.greaterThanOrEqualTo(root.get("startDate").as(Date.class), iVolunteer.getDateChosenStart())));			
		}
		//查詢項目結束日期是否早於查詢日期或是自由選擇出發日期
		if (!StringUtils.isEmpty(iVolunteer.getDateChosenEnd())) {
			list.add(cb.or(cb.isNull(root.get("endDate").as(Date.class)),
					cb.lessThanOrEqualTo(root.get("endDate").as(Date.class), iVolunteer.getDateChosenEnd())));
		}
		
		
		Predicate[] p = new Predicate[list.size()];
		return cb.and(list.toArray(p));
	}

}
