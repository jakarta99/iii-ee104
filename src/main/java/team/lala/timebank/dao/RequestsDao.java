package team.lala.timebank.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import team.lala.timebank.entity.Requests;

public interface RequestsDao extends JpaRepository<Requests,Long>{
	
	Requests findByJobAreaAndServiceType(Integer jobArea,Integer serviceType );
	
	
}
