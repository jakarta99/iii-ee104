package team.lala.timebank.entity.inherit;

import org.springframework.data.jpa.repository.JpaRepository;


public interface OrgMemberDao extends JpaRepository<OrgMemberInherit, Long> {
	
}
