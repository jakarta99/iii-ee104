package team.lala.timebank.web.user;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/user")
public class CalendarController {
	
	@RequestMapping("/calendar")
	public String calendar() {
		return "/basic/user/calendar/calendar";
	}

}
