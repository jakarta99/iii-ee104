package team.lala.timebank.service;

import java.util.Collection;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import team.lala.timebank.dao.OrderDao;
import team.lala.timebank.entity.Order;

@Service
public class OrderService {
	
	@Autowired
	private OrderDao orderDao;
	
	public List<Order> findAll() {
		List<Order> orders = orderDao.findAll();
		return orders;
	}
	
	//透過志工會員id查詢所有申請及目前審核狀態 (流程：志工申請提供服務的紀錄)
	public List<Order> findBySupplierId(Long supplierId) {
		List<Order> orders = orderDao.findBySupplierId(supplierId);
		return orders;
	}
	
	//測試join用
	public Order getOrderBySupplierIdAndJobTitle(Long supplierId, String jobTitle) {
		Order order = orderDao.findOrderBySupplierIdAndJobTitle(supplierId, jobTitle);
		return order;
	}
	
	public Order getById(Long id) {
		Order order = orderDao.getOne(id);
		return order;
	}
	
	public Order save(Order order) {
		Order o = orderDao.save(order);
		return o;
	}
	
	public void deleteById(Long id) { //spring jpa預設void
		orderDao.deleteById(id);
	}
	
}
