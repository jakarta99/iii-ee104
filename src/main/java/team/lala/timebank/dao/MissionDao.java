package team.lala.timebank.dao;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

import team.lala.timebank.entity.Member;
import team.lala.timebank.entity.Mission;

public interface MissionDao extends JpaRepository<Mission, Long>, JpaSpecificationExecutor<Mission> {

	public List<Mission> findByMember(Member member);
	
	public Page<Mission> findByMember(Member member, Pageable pageable);
			
}
