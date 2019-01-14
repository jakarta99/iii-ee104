package team.lala.timebank.dao;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

import team.lala.timebank.entity.Member;
import team.lala.timebank.entity.SystemMessage;
import team.lala.timebank.enums.YesNo;

public interface SystemMessageDao extends JpaRepository<SystemMessage, Long>, JpaSpecificationExecutor<SystemMessage>  {
	public Page<SystemMessage> findByReadStatusAndMemberAccount(YesNo readStatus, String memberAccount, Pageable Pageable);
	
	public List<SystemMessage> findByReadStatusAndMemberAccount(YesNo readStatus, String memberAccount);
	
	public Page<SystemMessage> findByMemberAccount(String memberAccount, Pageable Pageable);
	
	public List<SystemMessage> findByMemberAccount(String memberAccount);
}
