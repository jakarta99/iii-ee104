package team.lala.timebank.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

import team.lala.timebank.entity.Member;

public interface MemberDao extends JpaRepository<Member, Long>, JpaSpecificationExecutor<Member> {
	//查詢這個帳號是否在資料庫有資料
	public Member findByAccount(String loginAccount);

}
