package team.lala.timebank.web.user;

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import team.lala.timebank.entity.Mission;
import team.lala.timebank.entity.Order;
import team.lala.timebank.service.MissionService;
import team.lala.timebank.service.OrderService;

@Controller
@RequestMapping("/user")
public class CalendarController {
	
	@Autowired
	OrderService orderService;
	@Autowired
	MissionService missionService;
	
	@RequestMapping("/calendar")
	public String calendar() {
		return "/basic/user/calendar/calendar";
	}
	
	@ResponseBody
	@RequestMapping("/getOrder")
	public List<Order> getOrder(Principal principal) {
		List<Order> order = new ArrayList<Order>();
		order = orderService.findByVolunteer(principal);
		return order;
	}
	
	@ResponseBody
	@RequestMapping("/getMission")
	public List<Mission> getMission(Principal principal){
		List<Mission> mission = new ArrayList<Mission>();
		mission = missionService.findByMember(principal);
		return mission;
	}

}
