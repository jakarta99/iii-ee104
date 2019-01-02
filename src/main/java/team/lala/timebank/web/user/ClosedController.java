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
@RequestMapping("/user/closed")
public class ClosedController {
	@Autowired
	private OrderService orderService;
	@Autowired
	private MissionService missionService;

	@RequestMapping("/list")
	public String listPage(@RequestParam(value = "id") Long id, Model model) {
		
		model.addAttribute("mission", missionService.getOne(id));
		return "/basic/user/volunteerRecruitment/endRecord";
	}

	@RequestMapping("/query")
	@ResponseBody
	public Mission getMission(@RequestParam(value = "missionId") Long id) {
		
		Mission mission = missionService.getOne(id);
		
		return mission;
	}

}
