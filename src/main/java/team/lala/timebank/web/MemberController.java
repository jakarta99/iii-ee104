package team.lala.timebank.web;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import team.lala.timebank.entity.Area;
import team.lala.timebank.entity.Member;
import team.lala.timebank.enums.MemberType;
import team.lala.timebank.enums.YesNo;
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
	public String listPage(Model model) {
		List<Member> members = memberService.findAll();
		model.addAttribute("members", members);
		return "/member/member_list";

	}

	@RequestMapping("/add")
	public String addPage(@RequestParam("memberType") MemberType memberType, Model model) {
		model.addAttribute("memberType", memberType);
		return "/member/member_add";

	}

	@RequestMapping("/edit")
	public String editPage(@RequestParam("id") Long id, Model model) {
		Member member = memberService.getOne(id);
		model.addAttribute("member", member);
		return "/member/member_edit";
	}
	
	
	@RequestMapping("/query")
	@ResponseBody
	public List<Member> queryPage(){
		List<Member> members = memberService.findAll();
		return members;
	}
	
	@ResponseBody
	@RequestMapping("/update")
	public Map<String, Object> updateMember(Member member) {
		System.out.println("using ajax");
		Map<String, Object> msg = new HashMap<>();
		System.out.println(member);
		if (member.getId() != null) {
			Member dbMember = memberService.getOne(member.getId());
			dbMember.setPassword(member.getPassword());
			dbMember.setName(member.getName());
			dbMember.setCertificateIdNumber(member.getCertificateIdNumber());
			dbMember.setBirthDate(member.getBirthDate());
			dbMember.setEmail(member.getEmail());
			dbMember.setTelephone(member.getTelephone());
			dbMember.setMobile(member.getMobile());
			dbMember.setCounty(member.getCounty());
			dbMember.setDistrict(member.getDistrict());
			dbMember.setAddress(member.getAddress());
			dbMember.setEmailVerification(member.getEmailVerification());
			dbMember.setBirthDate(member.getBirthDate());
			dbMember.setCertificateIdNumber(member.getCertificateIdNumber());
			
			if (member.getMemberType() == MemberType.O) {
				dbMember.setOrgCeo(member.getOrgCeo());
				dbMember.setOrgFounder(member.getOrgFounder());
				dbMember.setOrgContactPerson(member.getOrgContactPerson());
				dbMember.setOrgContactPersonMobile(member.getOrgContactPersonMobile());
				dbMember.setOrgContactPersonTel(member.getOrgContactPersonTel());
				dbMember.setOrgFoundPurpose(member.getOrgFoundPurpose());
				dbMember.setOrgIdConfirmation(member.getOrgIdConfirmation());
				dbMember.setOrgWebsiteLink(member.getOrgWebsiteLink());
			}
			 System.out.println("dbMember= " + dbMember);
			try {
				memberService.save(dbMember);
				msg.put("memberInfo", dbMember);
				msg.put("msg", "資料更新成功");
				System.out.println("資料更新成功");
			} catch (Exception e) {
				msg.put("memberInfo", member);
				msg.put("msg", "資料更新失敗");
				System.out.println("資料更新失敗");
				e.printStackTrace();
			}			
		}
		return 	msg;
	}


	@RequestMapping("/insert")
	@ResponseBody
	public Map<String, String> insertMember(Member member, Model model) {
		Map<String, String> msg = new HashMap<>();
		 System.out.println("member = " + member);
		member.setSignUpDate(new Date());
		member.setEmailVerification(YesNo.N);
		member.setOrgIdConfirmation(YesNo.N);
		try {
			memberService.save(member);
			msg.put("msg", "新增成功");
			System.out.println("新增成功");
		} catch (Exception e) {
			msg.put("msg", "新增失敗");
			System.out.println("新增失敗");
			e.printStackTrace();
		}
		return msg;
	}

	@RequestMapping("/delete")
	@ResponseBody
	public Map<String, String> deleteMember(@RequestParam("id") Long id, Model model) {
		Map<String, String> msg = new HashMap<>();
		System.out.println("id = "+id);
		try {
			memberService.deleteById(id);
			msg.put("msg", "刪除成功");
			System.out.println("刪除成功");
		} catch (Exception e) {
			msg.put("msg", "刪除失敗");
			System.out.println("刪除失敗");
			e.printStackTrace();
		}		
		return msg;

	}
	

	


}