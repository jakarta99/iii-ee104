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

import lombok.extern.slf4j.Slf4j;
import team.lala.timebank.entity.Member;
import team.lala.timebank.entity.Mission;
import team.lala.timebank.entity.Order;
import team.lala.timebank.enums.MissionStatus;
import team.lala.timebank.enums.OrderStatus;

@Slf4j
@SuppressWarnings("serial")
public class OrderSpecification implements Specification<Order>  {
	private Order inputOrder;

	public OrderSpecification(Order inputOrder) {
		this.inputOrder = inputOrder;
	}

	@Override
	public Predicate toPredicate(Root<Order> root, CriteriaQuery<?> query, CriteriaBuilder criteriaBuilder) {
		List<Predicate> list = new ArrayList<Predicate>();
		
		if(!StringUtils.isEmpty(inputOrder.getId())) {
			list.add(criteriaBuilder.equal(root.get("id").as(Long.class), inputOrder.getId()));
		}
		if(!StringUtils.isEmpty(inputOrder.getMission())) {
			list.add(criteriaBuilder.equal(root.get("mission").as(Mission.class), inputOrder.getMission()));
		}

		if(!StringUtils.isEmpty(inputOrder.getVolunteerAccount())) {
			Join<Member, Order> join = root.join("volunteer", JoinType.LEFT);
			list.add(criteriaBuilder.equal(join.get("account"), inputOrder.getVolunteerAccount()));
		}
		
		if(!StringUtils.isEmpty(inputOrder.getMissionTitle())) {
			Join<Mission, Order> join = root.join("mission", JoinType.LEFT);
			list.add(criteriaBuilder.like(join.get("title").as(String.class), "%" + inputOrder.getMissionTitle() + "%"));
		}
		
		if(StringUtils.isEmpty(inputOrder.getOrderStatus())) {
			if (!StringUtils.isEmpty(inputOrder.getOrderStatusDetail())) {
				list.add(criteriaBuilder.like(root.get("orderStatus").as(String.class), "%" + inputOrder.getOrderStatusDetail() + "%"));
			}
		}
		
		if (!StringUtils.isEmpty(inputOrder.getOrderStatusNeedPay())) {
			list.add(criteriaBuilder.in(root.get("orderStatus").as(OrderStatus.class)).value(OrderStatus.ServiceFinishNotPay).value(OrderStatus.ServiceFinishPayMatchSuccess).value(OrderStatus.ServiceFinishNotPay));
		}
		
		if(!StringUtils.isEmpty(inputOrder.getOrderStatus())) {
			list.add(criteriaBuilder.like(root.get("orderStatus").as(String.class), "%" + inputOrder.getOrderStatus() + "%"));
		}
		
		if (!StringUtils.isEmpty(inputOrder.getStartDate())) {
			Join<Mission, Order> join = root.join("mission", JoinType.LEFT);
			list.add(criteriaBuilder.greaterThanOrEqualTo(join.get("startDate").as(java.util.Date.class),
					inputOrder.getStartDate()));
		}
		
		if (!StringUtils.isEmpty(inputOrder.getEndDate())) {
			Join<Mission, Order> join = root.join("mission", JoinType.LEFT);
			list.add(criteriaBuilder.greaterThanOrEqualTo(join.get("endDate").as(java.util.Date.class),
					inputOrder.getEndDate()));
		}
		
		if(!StringUtils.isEmpty(inputOrder.getCounty())) {
			Join<Mission, Order> join = root.join("mission", JoinType.LEFT);
			list.add(criteriaBuilder.equal(join.get("county").as(String.class), inputOrder.getCounty()));
		}
		
		if(!StringUtils.isEmpty(inputOrder.getDistrict())) {
			Join<Mission, Order> join = root.join("mission", JoinType.LEFT);
			list.add(criteriaBuilder.equal(join.get("district").as(String.class), inputOrder.getDistrict()));
		}
		
		if(!StringUtils.isEmpty(inputOrder.getMemberScore())) {
			list.add(criteriaBuilder.equal(root.get("memberScore").as(String.class), inputOrder.getMemberScore()));
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
