package team.lala.timebank.dao;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

import team.lala.timebank.entity.Member;
import team.lala.timebank.enums.MemberType;

public interface MemberDao extends JpaRepository<Member, Long>, JpaSpecificationExecutor<Member> {
	//查詢這個帳號是否在資料庫有資料
	public Member findByAccount(String loginAccount);
	
	public Page<Member> findByMemberType(MemberType memberType, Pageable pageable);
	
	public default List<Member> findMembersByListOfAccounts(Collection<String> accountList,EntityManager em){
		CriteriaBuilder cb = em.getCriteriaBuilder();
		CriteriaQuery<Member> query = cb.createQuery(Member.class);
		Root<Member> root = query.from(Member.class);		
		List<Predicate> list = new ArrayList<>();
		for (String account :accountList) {
			list.add(cb.equal(root.get("account").as(String.class), account));		
		}
		Predicate[] p = new Predicate[list.size()];
		Predicate predicate = cb.or(list.toArray(p));
		query.where(predicate);
		TypedQuery<Member> q = em.createQuery(query);
		return q.getResultList();
		
	}

}
