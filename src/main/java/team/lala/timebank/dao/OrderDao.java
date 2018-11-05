package team.lala.timebank.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import team.lala.timebank.entity.Order;

public interface OrderDao extends JpaRepository<Order,Long>{

}
