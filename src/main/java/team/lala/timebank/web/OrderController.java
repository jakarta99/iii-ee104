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

	// Jasmine:模擬2號會員(志工)查詢申請紀錄
	private Long supplierId = 2L; // 篩選欄位來自order_list資料表
	private String jobTitle = "中華關懷協會"; // 篩選欄位來自requests資料表(目前資料表中的jobTitle暫時塞的假資料是機構名稱，日後再改)。

	
	
	@RequestMapping("/order")
	public String findMemberOrders() {
		//STEP1-VIEW傳入的資料驗證
		if(supplierId == null || supplierId == 0 || jobTitle==null || jobTitle.trim().length()==0) {
			String htmlString = "<html><h4>【supplierId】或【jobTitle】格式錯誤，請重新輸入</h4></html>";
			return htmlString;
		} else {
			//STEP2-VIEW傳入資料確認無誤後，進資料庫查資料
			//【沒有JOIN版--ORDER_LIST資料表】志工透過id查詢自己的所有申請紀錄
			String htmlString = "<html><h4>【沒有JOIN版--ORDER_LIST資料表】志工透過id查詢自己的所有申請紀錄</h4>";
			Collection<Order> orders1 = orderService.findBySupplierId(supplierId);
			if(orders1 == null) {
				htmlString += "查無【" + supplierId + "】號志工提出之order<br>";
			} else {
				for (Order order : orders1) {
					htmlString += order.toString() + "<br>";
				}
			}
			
			//【JOIN版(v.1)--ORDER_LIST資料表+REQUESTS資料表】志工透過id查詢自己的所有申請紀錄(多了REQUESTS資料表中，有關機構徵人的細節)
			htmlString += "<h4>【JOIN版(v.1)--ORDER_LIST資料表+REQUESTS資料表】志工透過id查詢自己的所有申請紀錄"
						+ "(多了REQUESTS資料表中，有關機構徵人的細節)</h4>";
			Collection<Order> orders2 = orderService.findBySupplierId(supplierId);
			if(orders2 == null) {
				htmlString += "查無【" + supplierId + "】號志工提出之order<br>";
			} else {
				for (Order order : orders2) {
					htmlString += order.ToStringByJoinOrderAndRequestResult() + "<br>";  //多印order entity 中的request實例變數
				}
			}
			
			//【JOIN版(v.2)--ORDER_LIST資料表+REQUESTS資料表】志工透過自己的id和jobtitle篩選申請紀錄(where條件跨資料表)
			htmlString += "<h4>【JOIN版(v.2)--ORDER_LIST資料表+REQUESTS資料表】"
						+ "志工透過自己的id和jobtitle篩選申請紀錄(where條件跨資料表)</h4>";
			Order orders3 = orderService.getOrderBySupplierIdAndJobTitle(supplierId, jobTitle);
			if(orders3 == null) {
				htmlString += "查無【" + supplierId + "】號志工申請【" + jobTitle +"】之紀錄<br>";
			} else {
				htmlString += "【可以只印Order】" + orders3.toString() + "<br>";
				htmlString += "【也可以印Order + Request】" + orders3.ToStringByJoinOrderAndRequestResult() + "<br>";
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