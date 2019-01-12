package team.lala.timebank.web.commons;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

//關於我們、聯絡我們的頁面
@Controller
@RequestMapping("/commons/aboutUs")
public class AboutUsController {
	
	@RequestMapping("/aboutTimeBank")
	public String aboutUsPage() {
		return "/basic/commons/aboutUs";
	}
	
	@RequestMapping("/contactUs")
	public String contactUsPage() {
		return "/basic/commons/contactUs";
	}
	
}
