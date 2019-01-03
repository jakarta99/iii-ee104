package team.lala.timebank.web.user;

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
import team.lala.timebank.service.MissionService;
import team.lala.timebank.service.OrderService;
import team.lala.timebank.service.PayService;
import team.lala.timebank.service.TimeLedgerService;

@Slf4j
@Controller
@RequestMapping("/user/payTime")
public class PayTimeController {
	@Autowired
	private OrderService orderService;
	@Autowired
	private MissionService missionService;
	@Autowired
	private PayService payService;

	@RequestMapping("/list")
	public String listPage(@RequestParam(value = "id") Long id, Model model) {

		// Mission mission = missionService.getOne(id);
		// model.addAttribute("mission", mission);
		model.addAttribute("missionId", id);
		return "/basic/user/volunteerRecruitment/payTime";
	}

	@RequestMapping("/query")
	@ResponseBody
	public Page<Order> getOrderByMissionAndStatus(
			@RequestParam(value = "start", required = false) Optional<Integer> start,
			@RequestParam(value = "length", required = false) Optional<Integer> length,
			@RequestParam(value = "missionId") Long id) {
		int page = start.orElse(0) / length.orElse(10);
		Mission mission = missionService.getOne(id);
		// Page<Mission> missions = missionService.findByAccount(principal,
		// inputMission, PageRequest.of(page, length.orElse(10)));
		Page<Order> orders = orderService.findByMission(mission, page, length);
		return orders;
	}

	// 會員付款
	@RequestMapping("/pay")
	@ResponseBody
	public AjaxResponse<Order> pay(@RequestParam("orderId") Long orderId, @RequestParam("hours") Integer hours,@RequestParam("score") Integer score) {
		log.debug("orderId={}",orderId);
		AjaxResponse<Order> response = new AjaxResponse<Order>();
		try {
			response.setObj(orderService.getById(orderId));

			Long volunteerId = orderService.getById(orderId).getVolunteer().getId();
			Long payerId = orderService.getById(orderId).getMission().getMember().getId();
			Mission mission = orderService.getById(orderId).getMission();
			payService.transaction(hours, volunteerId, payerId, mission, orderId,score);

		} catch (Exception e) {
			response.addMessage("付款失敗，" + e.getMessage());

			e.printStackTrace();
		}
		return response;
	}

}
