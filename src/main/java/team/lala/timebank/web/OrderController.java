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
		//【沒有JOIN版--ORDER_LIST資料表】志工透過id查詢自己的所有申請紀錄
		String htmlString = "<html><h4>【沒有JOIN版--ORDER_LIST資料表】志工透過id查詢自己的所有申請紀錄</h4>";
		Collection<Order> orders1 = orderService.findBySupplierId(supplierId);
		for (Order order : orders1) {
			htmlString += order.toString() + "<br>";
		}
		
		//【JOIN版(v.1)--ORDER_LIST資料表+REQUESTS資料表】志工透過id查詢自己的所有申請紀錄(多了REQUESTS資料表中，有關機構徵人的細節)
		htmlString += "<h4>【JOIN版(v.1)--ORDER_LIST資料表+REQUESTS資料表】志工透過id查詢自己的所有申請紀錄"
					+ "(多了REQUESTS資料表中，有關機構徵人的細節)</h4>";
		Collection<Order> orders2 = orderService.findBySupplierId(supplierId);
		for (Order order : orders2) {
			htmlString += order.ToStringByJoinOrderAndRequestResult() + "<br>";  //多印order entity 中的request實例變數
		}

		//【JOIN版(v.2)--ORDER_LIST資料表+REQUESTS資料表】志工透過自己的id和jobtitle篩選申請紀錄(where條件跨資料表)
		htmlString += "<h4>【JOIN版(v.2)--ORDER_LIST資料表+REQUESTS資料表】"
					+ "志工透過自己的id和jobtitle篩選申請紀錄(where條件跨資料表)</h4>";
		Order orders3 = orderService.findOrderBySupplierIdAndJobTitle(supplierId, "中華關懷協會");
		htmlString += "只印Order==>" + orders3.toString() + "<br>";
		htmlString += "印Order + Request==>" + orders3.ToStringByJoinOrderAndRequestResult() + "<br>";
		
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
