package team.lala.timebank.dao;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

import team.lala.timebank.entity.Mission;
import team.lala.timebank.entity.Order;
import team.lala.timebank.entity.SystemMessage;
import team.lala.timebank.enums.YesNo;

public interface SystemMessageDao extends JpaRepository<SystemMessage, Long>, JpaSpecificationExecutor<SystemMessage>  {
	public Page<SystemMessage> findByReadStatus(YesNo readStatus, Pageable Pageable);

}
