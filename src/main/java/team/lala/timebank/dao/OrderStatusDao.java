package team.lala.timebank.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

import team.lala.timebank.entity.OrderStatus;

public interface OrderStatusDao extends JpaRepository<OrderStatus, Long>, JpaSpecificationExecutor<OrderStatus> {

	
}
