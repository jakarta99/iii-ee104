package team.lala.timebank.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import team.lala.timebank.entity.Member;

public interface MemberDao extends JpaRepository<Member, Long> {

}
