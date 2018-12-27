package team.lala.timebank.spec;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Join;
import javax.persistence.criteria.JoinType;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import org.springframework.data.jpa.domain.Specification;
import org.springframework.util.StringUtils;

import team.lala.timebank.entity.Member;
import team.lala.timebank.entity.Order;
import team.lala.timebank.entity.OrderStatus;

@SuppressWarnings("serial")
public class OrderSpecification implements Specification<Order>  {
	private Order inputOrder;

	public OrderSpecification(Order inputOrder) {
		this.inputOrder = inputOrder;
	}

	@Override
	public Predicate toPredicate(Root<Order> root, CriteriaQuery<?> query, CriteriaBuilder criteriaBuilder) {
		List<Predicate> list = new ArrayList<Predicate>();  
		
		if(!StringUtils.isEmpty(inputOrder.getOrderStatusDetail())) {
			// set order join AttributeName and joinType
			Join<OrderStatus, Order> join = root.join("orderStatus", JoinType.LEFT);
			// set AttributeName for search
			list.add(criteriaBuilder.equal(join.get("orderStatus"), inputOrder.getOrderStatusDetail()));
		}
		
		if(!StringUtils.isEmpty(inputOrder.getId())) {
			list.add(criteriaBuilder.equal(root.get("id").as(Long.class), inputOrder.getId()));
		}

		if(!StringUtils.isEmpty(inputOrder.getVolunteerId())) {
			Join<Member, Order> join = root.join("volunteer", JoinType.LEFT);
			list.add(criteriaBuilder.equal(join.get("account"), inputOrder.getVolunteerId()));
		}
		
		if (!StringUtils.isEmpty(inputOrder.getStatus())) {
			Join<OrderStatus, Order> join = root.join("orderStatus", JoinType.LEFT);
			if (inputOrder.getStatus() == 7) {
				list.add(criteriaBuilder.greaterThanOrEqualTo(join.get("id").as(Long.class), 7L));
				list.add(criteriaBuilder.lessThanOrEqualTo(join.get("id").as(Long.class), 11L));
			} else if (inputOrder.getStatus() == 3){
				list.add(criteriaBuilder.greaterThanOrEqualTo(join.get("id").as(Long.class), 3L));
				list.add(criteriaBuilder.lessThanOrEqualTo(join.get("id").as(Long.class), 5L));				
			}
		}
		//排序(暫時寫死)，如何從前端傳排序資料
		//同時針對兩個欄位排序
//		List<javax.persistence.criteria.Order> orderList = new ArrayList();
//		javax.persistence.criteria.Order orderByConfirm = criteriaBuilder.desc(root.get("confirmation"));
//		javax.persistence.criteria.Order orderBySupplierId = criteriaBuilder.desc(root.get("supplierId"));
//		orderList.add(orderByConfirm);
//		orderList.add(orderBySupplierId);
//		query.orderBy(orderList);

		
		Predicate[] p = new Predicate[list.size()];
		return criteriaBuilder.and(list.toArray(p));

		
	}
	
	
	
	
	
	
}
