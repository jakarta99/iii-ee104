package team.lala.timebank.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import team.lala.timebank.entity.Area;
import team.lala.timebank.entity.Member;
import team.lala.timebank.enums.MemberType;
import team.lala.timebank.service.AreaService;
import team.lala.timebank.service.MemberService;

@Controller
@RequestMapping("/member")
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private AreaService areaService;
	
	@RequestMapping("/list")
	public String listMember(Model model) {
		List<Member> members = memberService.findAll();
		model.addAttribute("members", members);
		return "/member/member_list";
		
	}
	
	@RequestMapping("/add")
	public String addMember(@RequestParam("memberType") MemberType memberType, Model model) {
		List<Area> areaList = areaService.findAll();
		model.addAttribute("areaList", areaList);
		model.addAttribute("memberType",memberType);
		return "/member/member_add";
		
	}
	
	@RequestMapping("/edit")
	public String editMember(@RequestParam("id") Long id,Model model) {
		Member member = memberService.getOne(id);		
		model.addAttribute("member",member);
		List<Area> areaList = areaService.findAll();
		model.addAttribute("areaList", areaList);
		return "/member/member_edit";	
	}
	
	
	@RequestMapping("/update")
	public String updateMember(Member member,Model model) {
		if (member.getId() != null) {			
			Member dbMember = memberService.getOne(member.getId());
			dbMember.setPassword(member.getPassword());
			dbMember.setName(member.getName());
			dbMember.setEmail(member.getEmail());
			dbMember.setTelephone(member.getTelephone());
			dbMember.setMobile(member.getMobile());
			dbMember.setArea(member.getArea());
			System.out.println("area="+member.getArea());
			if (member.getMemberType() == MemberType.O) {
				dbMember.setCeo(member.getCeo());
				dbMember.setFounder(member.getFounder());				
			}
			memberService.save(dbMember);	
		}
   
		return editMember(member.getId(), model);	
	}
	
	
	@RequestMapping("/insert")
	public String insertMember(Member member, Model model) {
		Member newMember = new Member();
		newMember.setMemberType(member.getMemberType());
		
		if (member.getLoginAccount() != null) {
			newMember.setLoginAccount(member.getLoginAccount());
		}
		if (member.getPassword() != null) {
			newMember.setPassword(member.getPassword());
		}
		if (member.getName() != null) {
			newMember.setName(member.getName());
		}
		if (member.getEmail() != null) {
			newMember.setEmail(member.getEmail());
		}
		if (member.getTelephone() != null) {
			newMember.setTelephone(member.getTelephone());
		}
		if (member.getMobile() != null) {
			newMember.setMobile(member.getMobile());
		}	
		if (member.getArea() != null) {		
			newMember.setArea(member.getArea());
		} else {
			newMember.setArea(1l);
		}
		if (member.getCeo() != null) {
			newMember.setCeo(member.getCeo());
		}
		if (member.getFounder() != null) {
			newMember.setFounder(member.getFounder());
		}
		memberService.save(newMember);
		
		return "redirect:/member/list";
		
	}
	
	
	@RequestMapping("/delete")
	public String deleteMember(@RequestParam("id") Long id,Model model) {
		memberService.deleteById(id);
	
		return "redirect:/member/list";
		
	}
	

}
