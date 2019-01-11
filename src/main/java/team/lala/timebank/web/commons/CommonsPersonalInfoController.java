package team.lala.timebank.web.commons;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import lombok.extern.slf4j.Slf4j;
import team.lala.timebank.entity.Member;
import team.lala.timebank.service.MemberService;

@Slf4j
@Controller
@RequestMapping("/commons/personal-info")
//@SessionAttributes(names = {"memberId"})
public class CommonsPersonalInfoController {
	
	@Autowired
	private MemberService memberService;
	
	@RequestMapping("/list")
	public String listPage(@RequestParam(value = "memberId") Long memberId, Model model) {
		Member member = memberService.getOne(memberId);
		model.addAttribute("member", member);	
		return "/basic/commons/personal-info_list";
	}

//	@RequestMapping("/query")
//	@ResponseBody
//	public Member getMember(@RequestParam(value = "id") Long memberId) {
//		Member member = memberService.getOne(memberId);
//		return member;
//	}
	
}
