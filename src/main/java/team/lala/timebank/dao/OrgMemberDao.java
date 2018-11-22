package team.lala.timebank.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import team.lala.timebank.entity.OrgMember;


public interface OrgMemberDao extends JpaRepository<OrgMember, Long> {
	
}
