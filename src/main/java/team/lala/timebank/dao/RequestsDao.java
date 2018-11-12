package team.lala.timebank.dao;

import java.util.Collection;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import team.lala.timebank.entity.Requests;

public interface RequestsDao extends JpaRepository<Requests,Long>{
	
	public Collection<Requests> findByJobAreaAndServiceType(Integer jobArea,Integer serviceType );
	
	@Query(value="select id,memberId,jobTitle,timeValue,jobArea,termType,serviceType from requests where memberId = ?1",nativeQuery = true)
	public Collection<Requests> findAllById(Long id);
	
}
