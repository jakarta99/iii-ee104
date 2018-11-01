package team.lala.timebank.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import team.lala.timebank.entity.TimeLedger;

public interface TimeLedgerDao extends JpaRepository<TimeLedger, Long>{
	
	
}
