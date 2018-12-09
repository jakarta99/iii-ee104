package team.lala.timebank.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;

import team.lala.timebank.entity.Order;
import team.lala.timebank.enums.YesNo;

public interface OrderDao extends JpaRepository<Order,Long>, JpaSpecificationExecutor<Order>{
	//Jasmine
	//透過志工會員id查詢所有申請及目前審核狀態 (流程：志工申請提供服務的紀錄)
	public List<Order> findBySupplierId(Long supplierId);
	
	public List<Order> findByConfirmation(YesNo confirmation);
	
	//Jasmine
	//情境：篩選資料的欄位跨資料表時
	//步驟一：合併表格(ENTITY要設好一對多及多對一的關係)(參考hybernate)
	//步驟二：@QUERY寫法 
	//參考網址=>  https://www.cnblogs.com/zj0208/p/6008627.html
	//參考網址=>  https://www.baeldung.com/spring-data-jpa-query
	@Query(value = "select * from ORDER_LIST o join requests r "
					+ "on o.request_List_Id = r.request_List_Id"
					+ " where o.supplier_Id=?1 and r.job_Title =?2", nativeQuery = true)
	public List<Order> findOrderBySupplierIdAndJobTitle(Long supplierId, String jobTitle);


}
