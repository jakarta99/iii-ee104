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

import team.lala.timebank.entity.Member;

@SuppressWarnings("serial")
public class MemberSpecification implements Specification<Member> {
	
	private Member inputMember;
	
	public MemberSpecification(Member member) {
		this.inputMember = member;
	}

	@Override
	public Predicate toPredicate(Root<Member> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
	
		List<Predicate> list = new ArrayList<Predicate>();  
        
		
		if(!StringUtils.isEmpty(inputMember.getName())) {
			list.add(cb.like(root.get("name").as(String.class), "%"+inputMember.getName()+"%"));
		}  
		
		if(!StringUtils.isEmpty(inputMember.getAccount())) {
			list.add(cb.equal(root.get("account").as(String.class), inputMember.getAccount()));
		}
		
		if (inputMember.getSignUpDateStart()!= null ) {
			list.add(cb.greaterThanOrEqualTo(root.get("signUpDate").as(Date.class), inputMember.getSignUpDateStart()));
		}
		if (inputMember.getSignUpDateEnd()!= null) {
			list.add(cb.lessThanOrEqualTo(root.get("signUpDate").as(Date.class), inputMember.getSignUpDateEnd()));					
		}
		
		
		
		
        Predicate[] p = new Predicate[list.size()];  

        return cb.and(list.toArray(p));  
		
		
	}

}
