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
	
	public Order getById(Long id) {
		Order order = orderDao.getOne(id);
		if(order != null) {
			return order;
		}
		return null;
	}
	
	public Collection<Order> findAll() {
		Collection<Order> orders = orderDao.findAll();
		if(!orders.isEmpty()) {
			return orders;
		}
		return null;
	}
	
	public void deleteById(Long id) {
		orderDao.deleteById(id);
	}
	
	
	//Jasmine
	//透過志工會員id查詢所有申請及目前審核狀態 (流程：志工申請提供服務的紀錄)
	public Collection<Order> findBySupplierId(Long supplierId) {
		Collection<Order> orders = orderDao.findBySupplierId(supplierId);
		if(!orders.isEmpty()) {
			return orders;
		}
		return null;
	}
	
	public Order getOrderBySupplierIdAndJobTitle(Long supplierId, String jobTitle) {
		Order order = orderDao.findOrderBySupplierIdAndJobTitle(supplierId, jobTitle);
		if(order != null) {
			return order;
		}
		return null;
	}
	

	
}
