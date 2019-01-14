package team.lala.timebank.web.user.mission;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.extern.slf4j.Slf4j;
import team.lala.timebank.entity.Mission;
import team.lala.timebank.enums.OrderStatus;
import team.lala.timebank.service.MissionService;
import team.lala.timebank.service.OrderService;

@Slf4j
@Controller
@RequestMapping("/user/closed")
public class ClosedController {
	@Autowired
	private OrderService orderService;
	@Autowired
	private MissionService missionService;

	@RequestMapping("/list")
	public String listPage(@RequestParam(value = "id") Long missionId, Model model) {
		
		model.addAttribute("mission", missionService.getOne(missionId));
		model.addAttribute("orders", orderService.findByMissionAndOrderStatus(missionService.getOne(missionId), OrderStatus.ServiceFinishPayMatchSuccess));
		return "/basic/user/volunteerRecruitment/endRecord";
	}

	@RequestMapping("/query")
	@ResponseBody
	public Mission getMission(@RequestParam(value = "missionId") Long id) {
		
		Mission mission = missionService.getOne(id);
		
		return mission;
	}

}
