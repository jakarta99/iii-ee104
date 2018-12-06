package team.lala.timebank.dao;

import java.util.*;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;

import team.lala.timebank.entity.Member;
import team.lala.timebank.entity.Requests;

public interface RequestsDao extends JpaRepository<Requests,Long>,JpaSpecificationExecutor<Requests> {
	
	public List<Requests> findByJobAreaAndServiceType(Integer jobArea,Integer serviceType );
	

//	@Query(value="select * from requests where member_Id = ?1",nativeQuery = true)
	public List<Requests> findByMemberId(Long memberid);

}
