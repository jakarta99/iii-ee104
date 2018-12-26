package team.lala.timebank.web.user;

import java.security.Principal;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.extern.slf4j.Slf4j;
import team.lala.timebank.entity.Mission;
import team.lala.timebank.entity.Order;
import team.lala.timebank.service.OrderService;

@Slf4j
@Controller
@RequestMapping("/user/volunteerVerify")
public class VolunteerVerify {
	
	@Autowired
	private OrderService orderService;
	
	@RequestMapping("/list")
	public String listPage() {

		return "/basic/user/volunteerRecruitment/volunteerVerify";
	}

	@RequestMapping("/query")
	@ResponseBody
	public Page<Order> getOrderByMemberIdAndStatus(Order inputOrder, Principal principal,
			@RequestParam(value = "start", required = false) Optional<Integer> start,
			@RequestParam(value = "length", required = false) Optional<Integer> length) {
		int page = start.orElse(0) / length.orElse(10);
		
//		Page<Mission> missions = missionService.findByAccount(principal, inputMission, PageRequest.of(page, length.orElse(10)));
		Page<Order> Orders = orderService(principal, inputMission, page, length);
		return missions;
	}
	
	
	
	
	

}
