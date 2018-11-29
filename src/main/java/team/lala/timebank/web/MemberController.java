package team.lala.timebank.web;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
		return "/member/member_list3";

	}

	@RequestMapping("/add")
	public String addMember(@RequestParam("memberType") MemberType memberType, Model model) {
		List<Area> areaList = areaService.findAll();
		model.addAttribute("areaList", areaList);
		model.addAttribute("memberType", memberType);
		return "/member/member_add";

	}

	@RequestMapping("/edit")
	public String editMember(@RequestParam("id") Long id, Model model) {
		Member member = memberService.getOne(id);
		model.addAttribute("member", member);
		List<Area> areaList = areaService.findAll();
		model.addAttribute("areaList", areaList);
		return "/member/member_edit";
	}

	@RequestMapping("/update")
	public String updateMember(Member member, Model model) {
		if (member.getId() != null) {
//			 System.out.println("member = " + member);
			Member dbMember = memberService.getOne(member.getId());
			dbMember.setPassword(member.getPassword());
			dbMember.setName(member.getName());
			dbMember.setEmail(member.getEmail());
			dbMember.setTelephone(member.getTelephone());
			dbMember.setMobile(member.getMobile());
			dbMember.setCity(member.getCity());
			dbMember.setEmailVerification(member.getEmailVerification());
			if (member.getMemberType() == MemberType.O) {
				dbMember.setOrgCeo(member.getOrgCeo());
				dbMember.setOrgFounder(member.getOrgFounder());
			}
			 System.out.println("dbMember= " + dbMember);
			memberService.save(dbMember);
		}

		return editMember(member.getId(), model);
	}

	@RequestMapping("/insert")
	public String insertMember(Member member, Model model) {
		// System.out.println("member = " + member);
		member.setSignUpDate(new Date());

		memberService.save(member);

		return "redirect:/member/list";
	}

	@RequestMapping("/delete")
	public String deleteMember(@RequestParam("id") Long id, Model model) {
		memberService.deleteById(id);

		return "redirect:/member/list";

	}
	
	@RequestMapping("/query")
	@ResponseBody
	public List<Member> query(Model model){
		List<Member> members = memberService.findAll();
		return members;
	}

}