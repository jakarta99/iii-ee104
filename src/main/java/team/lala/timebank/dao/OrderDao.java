package team.lala.timebank.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;

import team.lala.timebank.entity.Order;
import team.lala.timebank.enums.YesNo;

public interface OrderDao extends JpaRepository<Order,Long>, JpaSpecificationExecutor<Order>{

	public List<Order> findByVolunteerId(Long volunteerId);
	
	public List<Order> findByOrderConfirmation(YesNo orderConfirmation);

}
