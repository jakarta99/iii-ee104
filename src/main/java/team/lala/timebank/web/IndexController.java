package team.lala.timebank.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class IndexController {

	@RequestMapping("/")
	public String home() {
		System.out.println("home");
		return "/index";
	}
}
