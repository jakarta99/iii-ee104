package team.lala.timebank.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

import team.lala.timebank.entity.SystemMessage;

public interface SystemMessageDao extends JpaRepository<SystemMessage, Long>, JpaSpecificationExecutor<SystemMessage>  {


}
