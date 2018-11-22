package team.lala.timebank.web;

import java.io.IOException;
import java.util.Collection;
import java.util.List;
import java.util.Optional;

import javax.persistence.EntityNotFoundException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;

import team.lala.timebank.entity.Order;
import team.lala.timebank.service.OrderService;

@RestController
public class OrderController {

	@Autowired
	private OrderService orderService;
	
//	private Requests requestTest = new Requests();
	private Long supplierId = 3L; // 篩選欄位來自order_list資料表
	private String jobTitle = "中華關懷協會"; // 篩選欄位來自requests資料表

	@RequestMapping("/getOrdersById")
	public String getOrdersById() {
		String htmlString = "<html><h4>【save Order】</h4></html>";
		Order order;
		try {
			order = orderService.getById(4L);
			htmlString += order.toString();
		} catch (EntityNotFoundException e) {
			htmlString += "ID不存在<br>" + e.toString();
		}

		return htmlString;
	}
	
	
	@RequestMapping("/insertOrder")
	public String insertOrders() {
		Order order = new Order(6L, supplierId, 2L,	false, false, "3");
		String htmlString = "<html><h4>【save Order】</h4></html>";
		Order order2 = orderService.save(order);
		htmlString += supplierId + "號會員提出申請成功，內容：" + order2.toString();
		return htmlString;
	}
	
	@RequestMapping("/updateOrder")
	public String updateOrders() {
		String htmlString = "<html><h4>【save Order】</h4></html>";
		Order order = orderService.getById(2L);
		if(order != null) {
			htmlString += "更新前資料:" + order.toString() + "<br>";
			order.setStatus("4");
			order = orderService.save(order);
			htmlString += "更新後資料:" + order.toString();
		} else {
			htmlString += "查無該筆資料";
		}		
		return htmlString;
	}
	
	@RequestMapping("/deleteOrder")
	public String deleteOrders() {
		String htmlString = "<html><h4>【delete Order by Id】</h4></html>";
		try {
			Order order = orderService.getById(10L);
			htmlString += "即將刪除資料為[" + order.toString() + "<br>";
			orderService.deleteById(10L);
			htmlString += "刪除完成";
		} catch (EmptyResultDataAccessException e) {
			htmlString += "ID不存在，無法刪除";
			return htmlString;
		}
		return htmlString;
	}
	
	
	@RequestMapping("/findMemberOrders")
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
			List<Order> orders3 = orderService.getOrderBySupplierIdAndJobTitle(supplierId, jobTitle);
			if(orders3 == null) {
				htmlString += "查無【" + supplierId + "】號志工申請【" + jobTitle +"】之紀錄<br>";
			} else {
				htmlString += "【印Order】" + orders3.toString() + "<br>";
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
	
	
//*************************************以下結合網頁測試************************************************************	
	
	
//	bean轉成JSON，回傳到HTML用AJAX (失敗，GSON、JSON轉換失敗)
	@RequestMapping("/findAllOrders")
	public void findAllOrders(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		//DB取資料
		List<Order> orders = orderService.findAll();
		Gson gson = new Gson();
		String json = null;
		json = gson.toJson(orders, Order.class);
		
		if(orders == null || orders.isEmpty()) { 
			json = gson.toJson("");
		} else {
			json = gson.toJson(orders);
		}
		response.getWriter().print(json);
		return;
	}
	
	
	
//	資料字串回傳到HTML，用AJAX
	@RequestMapping("/findMyOrdersByhtml")
	public void findVolunOrders(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		//讀取志工輸入之ID
		String temp1 = request.getParameter("supplierId");
		Long supplier_Id = 0L;
		//資料格式判斷&型別轉換
		if (temp1 != null && temp1.trim().length() > 0) {
			try {
				supplier_Id = Long.valueOf(temp1);
			} catch (NumberFormatException e) {
				response.getWriter().print("資料格式錯誤");
				return;
			}
		} else {
			System.out.println(temp1);
			response.getWriter().print("未輸入資料喔><");
			return;
		}
		
		String htmlString = "<html><h4>【ORDER_LIST表】志工透過id查詢自己的所有申請紀錄</h4>";
		//DB取資料
		Collection<Order> orders1 = orderService.findBySupplierId(supplier_Id);
		if(orders1 == null || orders1.isEmpty()) { 
			htmlString += "查無【" + supplier_Id + "】號志工提出之order<br>";
			response.getWriter().print(htmlString);
			return;
		} else {
			for (Order order : orders1) {
				htmlString += order.toString() + "<br>";
			}
			response.getWriter().print(htmlString);
			return;
		}
	}
	
//用ModelAndView物件存資料+送到JSP，JSP再用EL呈現資料
//無法用傳統的servlet的sendRedirect、getRequestDispatcher????
	@RequestMapping("/findMyOrdersByJsp")
	public ModelAndView findVolunOrdersJoinRequest(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		Long supplier_Id = 0L;
		//讀取志工輸入之ID
		String temp1 = request.getParameter("supplierId");
		String job_Title = request.getParameter("jobTitle");
		
		//準備ModelAndView物件(導向OrderResult.jsp)/request.Attribute
		ModelAndView modelAndView = new ModelAndView("OrdersResult");
		//modelAndView.setViewName("OrderResult");
		//Map<String, String> errorMsg = new HashMap<>();
		//request.setAttribute("errorMsg", errorMsg);
		
		//資料格式判斷&型別轉換
		if (temp1 == null || temp1.trim().length() == 0) {
			//errorMsg.put("wrongSupplierId", "未輸入supplier_Id");
			modelAndView.addObject("wrongInput", "未輸入supplier_Id");
			return modelAndView;
		} 
		
		if (job_Title == null || job_Title.trim().length() == 0) {
			//errorMsg.put("wrongJobTitle", "未輸入jobTitle");
			modelAndView.addObject("wrongInput", "未輸入jobTitle");
			return modelAndView;
		}
		
		try {
			supplier_Id = Long.valueOf(temp1);
		} catch (NumberFormatException e) {
			//errorMsg.put("wrongSupplierIdFormat", "supplier_Id資料格式錯誤");
			modelAndView.addObject("wrongInput", "supplier_Id資料格式錯誤");
			return modelAndView;
		}
		
//		if(!errorMsg.isEmpty()) {
//			request.getRequestDispatcher("/資料驗證失敗後返回原jsp的路徑").forward(request, response);
//			return;
//		}
		
		//HttpSession session = request.getSession();
		//DB取資料
		List<Order> orders = orderService.getOrderBySupplierIdAndJobTitle(supplier_Id, job_Title);
		//List<Order> orders = orderService.findBySupplierId(supplier_Id);
		if(orders != null) { 
//			session.setAttribute("orderBean", orders);
//			response.sendRedirect("/資料驗證成功後抵達下一頁jsp的路徑");
//			return;
			modelAndView.addObject("orderBean", orders);
			return modelAndView;
		} else {
//			session.setAttribute("dataNotFound", "查無【" + supplier_Id + "】號會員申請【" + jobTitle + "】之資料");
//			response.sendRedirect("/資料驗證成功後抵達下一頁jsp的路徑");
//			return;
			modelAndView.addObject("dataNotFound", "查無【" + supplier_Id + "】號會員申請【" + jobTitle + "】之資料");
			return modelAndView;
		}
		
	}
	
	
}