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
	
	@RequestMapping("/order")
	public String findOrders() {
		String result="<html><p>";
		Collection<Order> orders = orderService.findAll();
		for (Order order : orders) {
			result += orders.toString() + "<br>";
		}
		result += "</p></html>";
		
		return result;
	}
	
}
