package team.lala.timebank.web.commons;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import team.lala.timebank.entity.Member;
import team.lala.timebank.enums.MemberType;
import team.lala.timebank.service.MemberService;

@Controller
@RequestMapping("/commons/organization")
public class OrganizationController {
	
	@Autowired
	private MemberService memberService;
	
	@RequestMapping("/list")
	public String listPage(){
		return "/basic/commons/organization_list";
	}
	
	
	@RequestMapping("/query")
	public Page<Member> query(@RequestParam int page, @RequestParam int length){
		System.out.println("QEYR");
		return memberService.findByMemberType(MemberType.O, PageRequest.of(page, length));
	}

}
