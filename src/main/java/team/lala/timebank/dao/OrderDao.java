package team.lala.timebank.dao;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

import team.lala.timebank.entity.Member;
import team.lala.timebank.entity.Order;
import team.lala.timebank.entity.OrderStatus;

public interface OrderDao extends JpaRepository<Order,Long>, JpaSpecificationExecutor<Order>{

	public List<Order> findByVolunteer(Member volunteer);
	
	public Page<Order> findByVolunteerAndOrderStatus(Member volunteer, OrderStatus orderStatus, Pageable Pageable);

}
