package team.lala.timebank.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import team.lala.timebank.entity.Order;
import team.lala.timebank.enums.YesNo;
import team.lala.timebank.service.OrderService;
import team.lala.timebank.service.RequestsService;

@Controller
@RequestMapping("/order")
public class OrderController {

	@Autowired
	private OrderService orderService;
	private RequestsService requestsService;

	@RequestMapping("/list")
	public String listPage(Model model) {
//		List<Order> orders = orderService.findAll();
//		model.addAttribute("orders", orders);
		return "/order/order_list"; // getRequestDispatcher("/WEB-INF/jsp/order_list.jsp").forward(request,
								// response);
	}
	
	@RequestMapping("/query")
	@ResponseBody
	public List<Order> queryOrder(@RequestParam("confirmation") YesNo confirmation){
//		System.out.println("confirmation=" + confirmation);
		
		if(confirmation != null) {
			List<Order> orders = orderService.findByConfirmation(confirmation);
			return orders;
		}
		
		List<Order> orders = orderService.findAll();
		return orders;
	}
	


	@RequestMapping("/add")
	public String addPage() {
		return "/order/order_add";
	}

	@RequestMapping("/edit")
	public String editPage(@RequestParam("id") Long id, Model model) {
		
		Order order = orderService.getById(id);
		
		model.addAttribute("order", order);
		
		return "/order/order_edit";
	}

	@RequestMapping("/update")
	@ResponseBody
	public String update(Order order, Model model) {
		try {
			Order dbOrder = orderService.getById(order.getId());
			dbOrder.setSupplierAcception(order.getSupplierAcception());
			dbOrder.setConfirmation(order.getConfirmation());
			dbOrder.setStatus(order.getStatus());
			
			orderService.save(dbOrder);
			
			return "【no." + order.getId() + " order】 has been updated";
			
		} catch (Exception e) {
			e.printStackTrace();
			return "Failed to update 【no." + order.getId() + "order】";
		}
		
	}
	
	
	
	@RequestMapping("/insert")
	@ResponseBody
	public String insert(Order order) {
		try {
			orderService.save(order);
			return "【no." + order.getId() + " order】 has been inserted";
		} catch (Exception e) {
			e.printStackTrace();
			return "Failed to insert 【no." + order.getId() + "order】";
		}
	}
	

	

	
	@RequestMapping("/delete")
	@ResponseBody
	public String delete(@RequestParam("id") Long id) {
		try {
			orderService.deleteById(id);
			return "【no." + id + " order】 has been deleted";
		} catch (Exception e) {
			e.printStackTrace();
			return "Failed to delete 【no." + id + "order】";
		}
	}
	
	
	
	
}