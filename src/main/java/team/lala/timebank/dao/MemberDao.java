package team.lala.timebank.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import team.lala.timebank.entity.Member;

public interface MemberDao extends JpaRepository<Member, Long> {
	//查詢這個帳號是否在資料庫有資料
	public Member findByLoginAccount(String loginAccount);

}
