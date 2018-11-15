package team.lala.timebank.entity.inherit;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;


public interface MemberInheritDao extends JpaRepository<MemberInherit, Long> {
	
}
