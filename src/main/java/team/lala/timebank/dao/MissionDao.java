package team.lala.timebank.dao;

import java.util.*;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

import team.lala.timebank.entity.Mission;

public interface MissionDao extends JpaRepository<Mission, Long>, JpaSpecificationExecutor<Mission> {

	public List<Mission> findByMemberId(Long memberid);

}
