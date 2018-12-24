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
import team.lala.timebank.enums.MemberType;
import team.lala.timebank.enums.YesNo;

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
		if(!StringUtils.isEmpty(inputMember.getMemberType())) {
			list.add(cb.equal(root.get("memberType").as(MemberType.class), inputMember.getMemberType()));
		}
		
		if (!StringUtils.isEmpty(inputMember.getBirthDateStart()) ) {
			list.add(cb.greaterThanOrEqualTo(root.get("birthDate").as(Date.class), inputMember.getBirthDateStart()));
		}
		if (!StringUtils.isEmpty(inputMember.getBirthDateEnd())) {
			list.add(cb.lessThanOrEqualTo(root.get("birthDate").as(Date.class), inputMember.getBirthDateEnd()));					
		}
		if(!StringUtils.isEmpty(inputMember.getEmail())) {
			list.add(cb.like(root.get("email").as(String.class), "%"+inputMember.getEmail()+"%"));
		} 
		if(!StringUtils.isEmpty(inputMember.getEmailVerification())) {
			list.add(cb.equal(root.get("emailVerification").as(YesNo.class), inputMember.getEmailVerification()));
		}
		if(!StringUtils.isEmpty(inputMember.getMobile())) {
			list.add(cb.equal(root.get("mobile").as(String.class), inputMember.getMobile()));
		}
		
		if(!StringUtils.isEmpty(inputMember.getCounty())) {
			list.add(cb.equal(root.get("county").as(String.class), inputMember.getCounty()));
		}
		if(!StringUtils.isEmpty(inputMember.getDistrict())) {
			list.add(cb.equal(root.get("district").as(String.class), inputMember.getDistrict()));
		}
		
		
		if (!StringUtils.isEmpty(inputMember.getSignUpDateStart()) ) {
			list.add(cb.greaterThanOrEqualTo(root.get("signUpDate").as(Date.class), inputMember.getSignUpDateStart()));
		}
		if (!StringUtils.isEmpty(inputMember.getSignUpDateEnd())) {
			list.add(cb.lessThanOrEqualTo(root.get("signUpDate").as(Date.class), inputMember.getSignUpDateEnd()));					
		}
			
        Predicate[] p = new Predicate[list.size()];  

        return cb.and(list.toArray(p));  
			
	}

}
