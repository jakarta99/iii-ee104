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


	private Long supplierId = 2L; // 篩選欄位來自order_list資料表
	private String jobTitle = "中華關懷協會"; // 篩選欄位來自requests資料表
	
	
	@RequestMapping("/order")
	public String findMemberOrders() {
		//VIEW傳入的資料驗證
		if(supplierId == null || supplierId == 0 || jobTitle==null || jobTitle.trim().length()==0) {
			String htmlString = "<html><h4>【supplierId】或【jobTitle】格式錯誤，請重新輸入</h4></html>";
			return htmlString;
		} else {
			//查資料
			//【沒有JOIN版--ORDER_LIST資料表】志工透過id查詢自己的所有申請紀錄
			String htmlString = "<html><h4>【ORDER_LIST資料表】志工透過id查詢自己的所有申請紀錄</h4>";
			Collection<Order> orders1 = orderService.findBySupplierId(supplierId);
			if(orders1 == null || orders1.isEmpty()) { 
				htmlString += "查無【" + supplierId + "】號志工提出之order<br>";
			} else {
				for (Order order : orders1) {
					htmlString += order.toString() + "<br>";
				}
			}
			
			//【ORDER_LIST資料表+REQUESTS資料表】志工透過id查詢自己的所有申請紀錄
			htmlString += "<h4>【ORDER_LIST資料表+REQUESTS資料表】志工透過id查詢自己的所有申請紀錄</h4>";
			Collection<Order> orders2 = orderService.findBySupplierId(supplierId);
			if(orders2 == null || orders2.isEmpty()) {
				htmlString += "查無【" + supplierId + "】號志工提出之order<br>";
			} else {
				for (Order order : orders2) {
					htmlString += order.ToStringByJoinOrderAndRequestResult() + "<br>";  //多印order entity 中的request實例變數
				}
			}
			
			
			//【ORDER_LIST資料表+REQUESTS資料表】志工透過自己的id和jobtitle篩選申請紀錄(where條件跨資料表)
			htmlString += "<h4>【ORDER_LIST資料表+REQUESTS資料表】"
						+ "志工透過自己的id和jobtitle篩選申請紀錄(條件跨資料表)</h4>";
			Order orders3 = orderService.getOrderBySupplierIdAndJobTitle(supplierId, jobTitle);
			if(orders3 == null) {
				htmlString += "查無【" + supplierId + "】號志工申請【" + jobTitle +"】之紀錄<br>";
			} else {
				htmlString += "【印Order】" + orders3.toString() + "<br>";
				htmlString += "【印Order + Request】" + orders3.ToStringByJoinOrderAndRequestResult() + "<br>";
			}
			
			htmlString += "</html>";
			return htmlString;
		}
	

// 查詢order資料表的全部資料
// @RequestMapping("/order")
// public String findOrders() {
// String result="<html><p>";
// Collection<Order> orders = orderService.findAll();
// for (Order order : orders) {
// result += order.toString() + "<br>";
// }
// result += "</p></html>";
//
// return result;
// }
	}
}