package team.lala.timebank.service;

import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import team.lala.timebank.dao.OrderDao;
import team.lala.timebank.entity.Order;

@Service
public class OrderService {
	
	@Autowired
	private OrderDao orderDao;
	
	public void update(Order order) {
		orderDao.save(order);
	}
	
	public Order findById(Long id) {
		Order order = orderDao.getOne(id);
		return order;
	}
	
	public Collection<Order> findAll() {
		Collection<Order> orders = orderDao.findAll();
		return orders;
	}
	
	public void deleteById(Long id) {
		orderDao.deleteById(id);
	}
	
}
