package team.lala.timebank.web;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class IndexController {

	@RequestMapping("/")
	public String home(@RequestParam(required=false) String emailVerify, Model model) {
		if (!StringUtils.isEmpty(emailVerify)) {
			model.addAttribute("emailVerify", emailVerify);			
		}
		return "/index";
	}
}
