package team.lala.timebank.dao;

import java.util.Collection;

import org.springframework.data.jpa.repository.JpaRepository;

import team.lala.timebank.entity.Requests;

public interface RequestsDao extends JpaRepository<Requests,Long>{
	
	public Collection<Requests> findByJobAreaAndServiceType(Integer jobArea,Integer serviceType );
	
	
}
