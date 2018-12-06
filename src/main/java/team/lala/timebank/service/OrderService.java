package team.lala.timebank.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;

import team.lala.timebank.dao.OrderDao;
import team.lala.timebank.entity.Order;
import team.lala.timebank.enums.YesNo;

@Service
public class OrderService {
	
	@Autowired
	private OrderDao orderDao;
	
	
	
	public List<Order> findBySpecification(Specification<Order> specification){
		return orderDao.findAll(specification);
	}
	
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
	public List<Order> findOrderBySupplierIdAndJobTitle(Long supplierId, String jobTitle) {
		List<Order> order = orderDao.findOrderBySupplierIdAndJobTitle(supplierId, jobTitle);
		return order;
	}
	
	public List<Order> findByConfirmation(YesNo confirmation){
		List<Order> order = orderDao.findByConfirmation(confirmation);
		return order;
	};
	
	
	public Order getById(Long id) {
		//getOne查無資料不會回傳null，而是噴錯(確認是在Service處理Exception，還是在Controller)
		Order order = orderDao.getOne(id);
		return order;
	}
	
	
	//測試用，待確認Optional物件用法，用不到記得刪
	public Optional<Order> findById(Long id) {
		Optional<Order> order = orderDao.findById(id);
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
