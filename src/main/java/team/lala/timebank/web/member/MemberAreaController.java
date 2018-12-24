package team.lala.timebank.web.member;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import team.lala.timebank.commons.ajax.AjaxResponse;
import team.lala.timebank.entity.Order;

@Controller
@RequestMapping("/member/application")
public class MemberAreaController {

	@RequestMapping("/area")
	public String MemberArea() {
		return "/user/apply/memberArea";
	}

	@ResponseBody
	@RequestMapping("/application")
	public AjaxResponse<Order> Application() {
		AjaxResponse<Order> response = new AjaxResponse<Order>();
		return response;
	}

	@ResponseBody
	@RequestMapping("/acceptService")
	public AjaxResponse<Order> AcceptService() {
		AjaxResponse<Order> response = new AjaxResponse<Order>();
		return response;
	}

	@ResponseBody
	@RequestMapping("/eventEnd")
	public AjaxResponse<Order> EventEnd() {
		AjaxResponse<Order> response = new AjaxResponse<Order>();
		return response;
	}

	@ResponseBody
	@RequestMapping("/matchSuccessRecord")
	public AjaxResponse<Order> MatchSuccessRecord() {
		AjaxResponse<Order> response = new AjaxResponse<Order>();
		return response;
	}

	@ResponseBody
	@RequestMapping("/matchFailRecord")
	public AjaxResponse<Order> MatchFailRecord() {
		AjaxResponse<Order> response = new AjaxResponse<Order>();
		return response;
	}

}
