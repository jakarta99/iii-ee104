package team.lala.timebank.web;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
}
