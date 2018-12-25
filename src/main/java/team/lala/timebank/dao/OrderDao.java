package team.lala.timebank.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

import team.lala.timebank.entity.Member;
import team.lala.timebank.entity.Order;

public interface OrderDao extends JpaRepository<Order,Long>, JpaSpecificationExecutor<Order>{

	public List<Order> findByVolunteer(Member volunteer);
	


}
