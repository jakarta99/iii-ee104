package team.lala.timebank.dao;

import java.util.Collection;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import team.lala.timebank.entity.Order;

public interface OrderDao extends JpaRepository<Order,Long>{
	//Jasmine
	//透過志工會員id查詢所有申請及目前審核狀態 (流程：志工申請提供服務的紀錄)
	public Collection<Order> findBySupplierId(Long supplierId);
	
	
	
	
//	Jasmine
//	透過志工會員id查詢所有申請及目前審核狀態 (流程：志工申請提供服務的紀錄)
//	合併查詢:Order與Request兩資料表合併，查出
//	final static String Q_GET_SUPPLIER_ORDERS 
//		= "SELECT ID,SUPPLIER_ID,REQUESTER_ID,SUPPLIER_ACCEPTION,SERVICE_CONFIRMATION,[STATUS],"
//				+ "r.REQUEST_LIST_ID, job_Title, time_Value, job_Area, term_Type, service_Type"
//		  + " FROM ORDER_LIST o JOIN REQUESTS r"
//		  + " on o.REQUEST_LIST_ID = r.REQUEST_LIST_ID";
//	= "SELECT *"
//	  + " FROM ORDER_LIST o JOIN REQUESTS r"
//	  + " on o.REQUEST_LIST_ID = r.REQUEST_LIST_ID";
//
//	@Query(Q_GET_SUPPLIER_ORDERS)
//	Collection<Order> findBySupplierIdFromRequestAndOrder();
	
}
