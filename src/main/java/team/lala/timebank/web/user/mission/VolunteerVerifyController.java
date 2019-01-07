package team.lala.timebank.web.user.mission;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.extern.slf4j.Slf4j;
import team.lala.timebank.commons.ajax.AjaxResponse;
import team.lala.timebank.entity.Mission;
import team.lala.timebank.entity.Order;
import team.lala.timebank.entity.ServiceType;
import team.lala.timebank.entity.SystemMessage;
import team.lala.timebank.enums.SystemMessageType;
import team.lala.timebank.service.MissionService;
import team.lala.timebank.service.OrderService;
import team.lala.timebank.service.ServiceTypeService;
import team.lala.timebank.service.SystemMessageService;

@Slf4j
@Controller
@RequestMapping("/user/volunteerVerify")
public class VolunteerVerifyController {

	@Autowired
	private OrderService orderService;
	@Autowired
	private MissionService missionService;
	@Autowired
	private SystemMessageService systemMessageService;

	@RequestMapping("/list")
	public String listPage(@RequestParam(value = "id") Long id, Model model) {

		// Mission mission = missionService.getOne(id);
		// model.addAttribute("mission", mission);
		model.addAttribute("missionId", id);
		return "/basic/user/volunteerRecruitment/volunteerVerify";
	}

	@RequestMapping("/query")
	@ResponseBody
	public Page<Order> getOrderByMissionAndStatus(
			@RequestParam(value = "page", required = false) int page,
			@RequestParam(value = "length", required = false) Optional<Integer> length,
			@RequestParam(value = "missionId") Long id) {
		Mission mission = missionService.getOne(id);
		// Page<Mission> missions = missionService.findByAccount(principal,
		// inputMission, PageRequest.of(page, length.orElse(10)));
		Page<Order> orders = orderService.findByMission(mission, page, length);
		return orders;
	}

	// 接受志工
	@RequestMapping("/accept")
	@ResponseBody
	public AjaxResponse<Order> accept(@RequestParam("id") Long orderId) {
		AjaxResponse<Order> response = new AjaxResponse<Order>();
		try {
			response.setObj(orderService.getById(orderId));
			orderService.accept(orderId);
			SystemMessage systemMessage = new SystemMessage();
			systemMessage.setMessageType(SystemMessageType.MissionAccecpt);
			systemMessageService.volunteerVerify(systemMessage, orderService.getById(orderId));

		} catch (Exception e) {
			response.addMessage("接受失敗，" + e.getMessage());

			e.printStackTrace();
		}
		return response;
	}

	// 拒絕志工
	@RequestMapping("/reject")
	@ResponseBody
	public AjaxResponse<Order> reject(@RequestParam("id") Long orderId) {
		AjaxResponse<Order> response = new AjaxResponse<Order>();
		try {
			response.setObj(orderService.getById(orderId));
			orderService.reject(orderId);
			SystemMessage systemMessage = new SystemMessage();
			systemMessage.setMessageType(SystemMessageType.MissionReject);
			systemMessageService.volunteerVerify(systemMessage, orderService.getById(orderId));

		} catch (Exception e) {
			response.addMessage("接受失敗，" + e.getMessage());

			e.printStackTrace();
		}
		return response;
	}

}
