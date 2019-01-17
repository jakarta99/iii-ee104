package team.lala.timebank.web;

import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import team.lala.timebank.commons.handler.MySimpleUrlAuthenticationSuccessHandler;
import team.lala.timebank.entity.Member;
import team.lala.timebank.enums.MemberType;
import team.lala.timebank.enums.YesNo;
import team.lala.timebank.service.MemberService;

@Controller
public class IndexController {
	
	@Autowired
	private MemberService memberService;

	@RequestMapping("/")
	public String home(@RequestParam(required=false) String emailVerify,
			@RequestParam(required=false) String account, Model model) {
		if (!StringUtils.isEmpty(emailVerify) && !StringUtils.isEmpty(account) ) {
			Member member = memberService.findByAccount(account);
			if (member.getMemberType() == MemberType.P) {
				memberService.addRole(member.getId(), 2l);
				member.setEmailVerification(YesNo.Y);
				memberService.update(member);
			} else if (member.getMemberType() == MemberType.O){
				memberService.addRole(member.getId(), 3l);
				member.setEmailVerification(YesNo.Y);
				member.setOrgIdConfirmation(YesNo.Y);
				memberService.update(member);
			}
			model.addAttribute("emailVerify", emailVerify);			
		}
		return "/index";
	}
	
	@Autowired
	private PasswordEncoder encoder;
	
	
	
	@RequestMapping("/oauth2")
	public String homeOauth(@RequestParam(required=false) String account, @RequestParam(required=false) String oauth2Id/*, Model model, HttpSession session, Authentication authentication*/) {
		if (!StringUtils.isEmpty(account) && !StringUtils.isEmpty(oauth2Id)) {
			Member member = memberService.findByAccount(account);
//			member.setPassword(encoder.encode(member.getOauth2Id()));
			memberService.update(member);
//			session.setAttribute("username", member.getAccount());
//			session.setAttribute("password", member.getPassword());
//			System.out.println(authentication.isAuthenticated());
//			try {
//				boolean isAuthenticated = authentication.isAuthenticated();
//				isAuthenticated = true; 
////				authentication.setAuthenticated(isAuthenticated);
//			} catch (Exception e) {
//				e.printStackTrace();
//			}
		}
		return "/index";
	}
}
