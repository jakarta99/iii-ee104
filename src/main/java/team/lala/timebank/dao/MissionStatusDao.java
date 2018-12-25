package team.lala.timebank.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

import team.lala.timebank.entity.MissionStatus;

public interface MissionStatusDao extends JpaRepository<MissionStatus, Long>, JpaSpecificationExecutor<MissionStatus> {

	
}