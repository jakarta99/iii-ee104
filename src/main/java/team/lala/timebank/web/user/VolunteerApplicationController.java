package team.lala.timebank.web.user;

import java.security.Principal;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.extern.slf4j.Slf4j;
import team.lala.timebank.commons.ajax.AjaxResponse;
import team.lala.timebank.entity.Order;
import team.lala.timebank.service.OrderService;

@Slf4j
@Controller
@RequestMapping("/user")
public class VolunteerApplicationController {
	
	@Autowired
	private OrderService orderService;

	@RequestMapping("/volunteerApplication/applicationPage")
	public String ApplicationPage() {
		return "/basic/user/volunteerApplication/volunteerApplication";
	}
	
	@RequestMapping("/volunteerApplication/RecordPage")
	public String RecordPage() {
		return "/basic/user/volunteerApplication/volunteerServiceRecordInquire";	
	}

	@ResponseBody
	@RequestMapping("/volunteerApplication/queryApplication")
	public Page<Order> QueryApplication(Principal principal, @RequestParam(value="orderStatus") Long orderStatus, @RequestParam(value="start",required=false) Optional<Integer> start, 
			@RequestParam(value="length",required=false) Optional<Integer> length) {

		int page = start.orElse(0)/length.orElse(10);
		String account = principal.getName();
		
		return orderService.findByVolunteerAndOrderStatus(account, (Long)orderStatus, PageRequest.of(page, length.orElse(10)));
	}

	@ResponseBody
	@RequestMapping("/volunteerApplication/delete")
	public AjaxResponse<Order> cancelApplication(@RequestParam("id") Long id){
		AjaxResponse<Order> response = new AjaxResponse<Order>();
		try {
			orderService.deleteById(id);
		} catch (Exception e) {
			e.printStackTrace();
			response.addMessage("刪除失敗");
		}
		return response;
	}

}
