package team.lala.timebank.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

import team.lala.timebank.entity.Order;
import team.lala.timebank.entity.Penalty;

public interface PenaltyDao extends JpaRepository<Penalty, Long>, JpaSpecificationExecutor<Penalty> {

	public List<Penalty> findByAccuser(Long accuser);
	
	public List<Penalty> findByOrder(Order order);

}
