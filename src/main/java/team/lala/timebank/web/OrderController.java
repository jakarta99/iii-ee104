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

		return "/order/order_list"; // getRequestDispatcher("/WEB-INF/jsp/order_list.jsp").forward(request,
								// response);
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
	public String update(Order order, Model model) {
		
		Order dbOrder = orderService.getById(order.getId());
		
		dbOrder.setSupplierAcception(order.getSupplierAcception());
		dbOrder.setConfirmation(order.getConfirmation());
		dbOrder.setStatus(order.getStatus());
		
		orderService.save(dbOrder);
		
		return editPage(order.getId(), model);
	}
	
	@RequestMapping("/insert")
	public String insert(Order order) {
		
		orderService.save(order);
		
		return "redirect:/order/add";
	}
	

	
	@RequestMapping("/delete")
	public String delete(@RequestParam("id") Long id, Model model) {
		orderService.deleteById(id);
		
		return listPage(model);
	}
	
	
	
	
}