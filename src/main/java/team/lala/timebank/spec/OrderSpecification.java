package team.lala.timebank.spec;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import org.springframework.data.jpa.domain.Specification;
import org.springframework.util.StringUtils;

import team.lala.timebank.entity.Order;
import team.lala.timebank.enums.YesNo;

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

		if(!StringUtils.isEmpty(inputOrder.getSupplierId())) {
			list.add(criteriaBuilder.equal(root.get("supplierId").as(String.class), inputOrder.getSupplierId()));
		}

		if(!StringUtils.isEmpty(inputOrder.getRequesterId())) {
			list.add(criteriaBuilder.equal(root.get("requesterId").as(Long.class), inputOrder.getRequesterId()));
		}

		if(!StringUtils.isEmpty(inputOrder.getSupplierAcception())) {
			list.add(criteriaBuilder.equal(root.get("supplierAcception").as(YesNo.class), inputOrder.getSupplierAcception()));
		}
		
		if(!StringUtils.isEmpty(inputOrder.getConfirmation())) {
			list.add(criteriaBuilder.equal(root.get("confirmation").as(YesNo.class), inputOrder.getConfirmation()));
		}
		
		if(!StringUtils.isEmpty(inputOrder.getStatus())) {
			list.add(criteriaBuilder.equal(root.get("status").as(String.class), inputOrder.getStatus()));
		}
		
		//排序(暫時寫死)，如何從前端傳排序資料
		//如何同時針對兩個欄位排序(同樣有排列組合問題)
		//JpaSpecificationExecutor>>>dao.findAll(Specification<T> spec, Sort sort)回傳List<T>
//		javax.persistence.criteria.Order orderByConfirm = criteriaBuilder.desc(root.get("confirmation"));
//		javax.persistence.criteria.Order orderBySupplierId = criteriaBuilder.desc(root.get("supplierId"));
//
//		query.orderBy(orderByConfirm);
//		query.orderBy(orderBySupplierId);
		
		//*****針對兩個欄位排序(and只作用在Predicate--where條件，無法在order by子句中發生作用)*****
		//criteriaBuilder.and(root.get("confirmation"), root.get("supplierId"));
		//query.orderBy(criteriaBuilder.desc(criteriaBuilder.and(root.get("confirmation"), root.get("supplierId"))));
		
		Predicate[] p = new Predicate[list.size()];
		return criteriaBuilder.and(list.toArray(p));

		
	}
	
	
	
	
	
	
}
