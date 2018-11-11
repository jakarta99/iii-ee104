package team.lala.timebank.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import team.lala.timebank.entity.Member;
import team.lala.timebank.service.MemberService;


@RestController
public class MemberLoginController {
	
	String account = "sheila1112";
	String password = "asdf";

	@Autowired
	private MemberService memberService;
	

	@RequestMapping("/Login")
	public String login() {
		String result = "<html>";
		if (account != null && account.trim().length() != 0 && password != null && password.trim().length() != 0) {
			Member member = memberService.login(account, password);
			if (member != null) {
				result += "<h2>Hello " + member.getName() + ",</h2>";
				result += "<p>" + member.toString() + "</p>";
			} else {
				result+= "帳號或密碼不正確";
			}
		} else {
			result += "請輸入帳號和密碼";
		}
		result += "</html>";
		return result;
	}
	
}
