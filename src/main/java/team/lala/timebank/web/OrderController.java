package team.lala.timebank.web;

import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import team.lala.timebank.entity.Order;
import team.lala.timebank.service.OrderService;

@RestController
public class OrderController {
	
	@Autowired
	private OrderService orderService;
	
	//Jasmine:模擬2號會員(志工)查詢申請紀錄(申請服務)及審核狀態
	private Long supplierId = 2L; 
	
	@RequestMapping("/order")
	public String findMemberOrders() {
		String htmlString = "<html><h4>【OrderController Test_1】透過志工會員id查詢所有申請紀錄(申請服務)及目前審核狀態</h4>";
		Collection<Order> orders1 = orderService.findBySupplierId(supplierId);
		for (Order order : orders1) {
			htmlString += order.toString() + "<br>";
		}
		
		htmlString += "<h4>【OrderController Test_2】ORDER join REQUEST後，透過志工會員id查詢所有申請紀錄</h4>";
		Collection<Order> orders2 = orderService.findBySupplierId(supplierId);
		for (Order order : orders2) {
			htmlString += order.joinTableToString() + "<br>";  //這裡的方法有多印request實例變數
		}
		
		htmlString += "<h4>【OrderController Test_3】使用@Query註解，跨資料表作條件篩選"
					+ "(透過[Order]志工id及[Request]活動名稱查詢所有申請紀錄</h4>";
		Order orders3 = orderService.findOrderBySupplierIdAndJobTitle(supplierId, "平日活動志工");
		htmlString += "只印Order==>" + orders3.toString() + "<br>";
		htmlString += "印Order==>" + orders3.joinTableToString() + "<br>";
		
		htmlString += "</html>";
		return htmlString;
	}
	
	
	
// 查詢order資料表的全部資料	
//	@RequestMapping("/order")
//	public String findOrders() {
//		String result="<html><p>";
//		Collection<Order> orders = orderService.findAll();
//		for (Order order : orders) {
//			result += order.toString() + "<br>";
//		}
//		result += "</p></html>";
//		
//		return result;
//	}
}
