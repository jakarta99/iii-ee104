package team.lala.timebank.dao;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

import team.lala.timebank.entity.Member;
import team.lala.timebank.entity.SystemMessage;
import team.lala.timebank.enums.YesNo;

public interface SystemMessageDao extends JpaRepository<SystemMessage, Long>, JpaSpecificationExecutor<SystemMessage>  {
	public Page<SystemMessage> findByReadStatusAndMember(YesNo readStatus, Member member, Pageable Pageable);
	
	public Page<SystemMessage> findByMember(Member member, Pageable Pageable);

}
