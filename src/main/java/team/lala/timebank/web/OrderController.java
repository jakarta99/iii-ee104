package team.lala.timebank.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import team.lala.timebank.entity.Order;
import team.lala.timebank.service.OrderService;

@Controller
@RequestMapping("/order")
public class OrderController {

	@Autowired
	private OrderService orderService;

	@RequestMapping("/list")
	public String listPage(Model model) {

		List<Order> orders = orderService.findAll();

		model.addAttribute("orders", orders);

		return "/order_list"; // getRequestDispatcher("/WEB-INF/jsp/order_list.jsp").forward(request,
								// response);
	}

	@RequestMapping("/add")
	public String addPage() {
		return "/order_add";
	}

	@RequestMapping("/edit")
	public String editPage(@RequestParam("id") Long id, Model model) {
		
		Order order = orderService.getById(id);
		
		model.addAttribute("order", order);
		
		return "/order_edit";
	}

	@RequestMapping("/insert")
	public String insertOrder(@RequestParam("requestListId") Long requestListId
			,@RequestParam("supplierId") Long supplierId, @RequestParam("requesterId") Long requesterId
			,@RequestParam("supplierAcception") boolean supplierAcception, @RequestParam("confirmation") boolean confirmation
			,@RequestParam("status") String status	
			, Model model) {
		Order order = new Order(requestListId, supplierId, requesterId, supplierAcception, confirmation, status);
		orderService.save(order);
		return "/order_add";
	}
	
	@RequestMapping("/delete")
	public String deleteOrder(@RequestParam("id") Long id, Model model) {
		orderService.deleteById(id);
		return "/order_list";
	}
	
	
	
	
}