package team.lala.timebank.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;

import team.lala.timebank.dao.MemberDao;
import team.lala.timebank.dao.OrderDao;
import team.lala.timebank.dao.OrderStatusDao;
import team.lala.timebank.entity.Member;
import team.lala.timebank.entity.Order;
import team.lala.timebank.entity.OrderStatus;

@Service
public class OrderService {
	
	@Autowired
	private OrderDao orderDao;
	@Autowired
	private MemberDao memberDao;
	
	@Autowired
	private OrderStatusDao orderStatusDao;
	
	public List<Order> findBySpecification(Specification<Order> specification){
		return orderDao.findAll(specification);
	}
	
	public Page<Order> findBySpecification(Specification<Order> specification, PageRequest pageRequest) {
		return orderDao.findAll(specification, pageRequest);
	}
	
	//根據申請中狀態查詢
	public Page<Order> findByVolunteerAndOrderStatus(String account, Long orderStatus, PageRequest pageRequest){	
		OrderStatus status = orderStatusDao.getOne(orderStatus);
		Member member = memberDao.findByAccount(account);
		return orderDao.findByVolunteerAndOrderStatus(member, status, pageRequest);
	}
	
	//根據媒合結果狀態查詢
	public Page<Order> findByVolunteerAndOrderStatusBetween(Specification<Order> specification,
			String account, Long orderStatus, PageRequest pageRequest){
		Member member = memberDao.findByAccount(account);
		orderDao.findByVolunteer(member, pageRequest, specification);
		return null;
		
	}
	
	public List<Order> findAll() {
		List<Order> orders = orderDao.findAll();
		return orders;
	}
	
	public List<Order> findByVolunteer(Member volunteer) {
		List<Order> orders = orderDao.findByVolunteer(volunteer);
		return orders;
	}
	
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
	
	public Order insert(Order order) {
		order.setVolunteerApplyTime(new java.util.Date());
		return orderDao.save(order);
	}
	
	public Order update(Order order) {
		Order dbOrder = orderDao.getOne(order.getId());
//		orderStatusDao.getOne(order.getId())
		if(order.getId() != null ) {
			dbOrder.setVolunteer(order.getVolunteer());
			dbOrder.setOrderStatus(order.getOrderStatus());
			dbOrder.setVolunteerApplyTime(order.getVolunteerApplyTime());
			dbOrder.setOrderAcceptTime(order.getOrderAcceptTime());
			dbOrder = orderDao.save(dbOrder);
		}
		return dbOrder;
	}
	
	public void deleteById(Long id) { //spring jpa預設void
		orderDao.deleteById(id);
	}
	
}
