package team.lala.timebank.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import team.lala.timebank.commons.ajax.AjaxResponse;
import team.lala.timebank.commons.ajax.PageResponse;
import team.lala.timebank.entity.Order;
import team.lala.timebank.service.OrderService;
import team.lala.timebank.spec.OrderSpecification;

@Controller
@RequestMapping("/order")
public class OrderController {

	@Autowired
	private OrderService orderService;

	@RequestMapping("/list")
	public String listPage() {
//		List<Order> orders = orderService.findAll();
//		model.addAttribute("orders", orders);
		return "/order/order_list"; // getRequestDispatcher("/WEB-INF/jsp/order_list.jsp").forward(request,
									// response);
	}
	
	@RequestMapping("/query")
	@ResponseBody
	public PageResponse<Order> queryOrder(Order order, @RequestParam("pageNumber") Integer pageNumber,
												@RequestParam("pageSize") Integer pageSize){
		PageResponse<Order> response = new PageResponse<Order>();
		
		try {
			OrderSpecification orderSpecification = new OrderSpecification(order);
			PageRequest thisPage = PageRequest.of(pageNumber, pageSize);
			Page<Order> orders = orderService.findBySpecification(orderSpecification, thisPage);
			response.setPage(orders);
		} catch (Exception e) {
			response.addMessage("查詢失敗，" + e.getMessage());
			e.printStackTrace();
		}

		return response;

	}
	

	@RequestMapping("/add")
	public String addPage() {
		return "/order/order_add";
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
		
		return "/order/order_edit";
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