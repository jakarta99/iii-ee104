package team.lala.timebank.web.admin;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.extern.slf4j.Slf4j;
import team.lala.timebank.commons.ajax.AjaxResponse;
import team.lala.timebank.entity.Order;
import team.lala.timebank.service.OrderService;
import team.lala.timebank.spec.OrderSpecification;

@Slf4j
@Controller
@RequestMapping("/admin/order")
public class AdminOrderController {

	@Autowired
	private OrderService orderService;

	@RequestMapping("/list")
	public String listPage() {
		return "/admin/order/order_list"; // getRequestDispatcher("/WEB-INF/jsp/order_list.jsp").forward(request,
											// response);
	}
	
	@ResponseBody
	@RequestMapping("/query")
	public Page<Order> queryOrder(Order inputOrder, @RequestParam(value="start",required=false) Optional<Integer> start, 
			@RequestParam(value="length",required=false) Optional<Integer> length) {
		int page = start.orElse(0)/length.orElse(10);
		OrderSpecification orderSpec = new OrderSpecification(inputOrder);
		Page<Order> orders = orderService.findBySpecification(
				orderSpec, PageRequest.of(page, length.orElse(10)));
		System.out.println("orders={}"+orders );
		log.debug("orders={}", orders );
		return orders;

	}
	
	
	@RequestMapping("/add")
	public String addPage() {
		return "/admin/order/order_add";
	}
	
	
	@RequestMapping("/insert")
	@ResponseBody
	public AjaxResponse<Order> insert(Order order) {
		AjaxResponse<Order> response = new AjaxResponse<Order>();
		try {
			orderService.insert(order);
		} catch (Exception e) {
			response.addMessage("新增失敗，" + e.getMessage());
			e.printStackTrace();
		}
		response.setObj(order);
		return response;
	}

	@RequestMapping("/edit")
	public String editPage(@RequestParam("id") Long id, Model model) {
		
		Order order = orderService.getById(id);
		
		model.addAttribute("order", order);
		
		return "/admin/order/order_edit";
	}

	
	@RequestMapping("/update")
	@ResponseBody
	public AjaxResponse<Order> update(Order order) {
		AjaxResponse<Order> response = new AjaxResponse<Order>();
		try {
			orderService.update(order);
		} catch (Exception e) {
			response.addMessage("修改失敗，" + e.getMessage());
			e.printStackTrace();
		}
		response.setObj(order);
		return response;
	}

	
	@RequestMapping("/delete")
	@ResponseBody
	public AjaxResponse<Order> delete(@RequestParam("id") Long id) {
		AjaxResponse<Order> response = new AjaxResponse<Order>();
		try {
			response.setObj(orderService.getById(id));
			orderService.deleteById(id);
		} catch (Exception e) {
			response.addMessage("刪除失敗，" + e.getMessage());
			e.printStackTrace();
		}
		return response;
	}
	
}