package team.lala.timebank.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import team.lala.timebank.entity.Member;
import team.lala.timebank.service.MemberService;

@Controller
@RequestMapping("/member")
public class MemberController {
	
	@Autowired
	private MemberService service;
	
	@RequestMapping("/listMember")
	public String listMember(Model model) {
		List<Member> member = service.findAll();
		model.addAttribute("members", member);
		return "/member/member_list";
		
	}
	
	@RequestMapping("/add")
	public String addMember(Model model) {
		
		return "/member/member_add";
		
	}
	
	@RequestMapping("/edit")
	public String editMember(@RequestParam("id") Long id,Model model) {
		Member member = service.getOne(id);
		
		model.addAttribute("member",member);
		return "/member/member_edit";
		
	}
	
	@RequestMapping("/delete")
	public String deleteMember(@RequestParam("id") Long id,Model model) {
//		Member member = service.getOne(id);
//		model.addAttribute("member",member);
	
		return "/member/member_delete";
		
	}
	

}
