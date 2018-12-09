package team.lala.timebank.web;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import team.lala.timebank.commons.ajax.AjaxResponse;
import team.lala.timebank.entity.Member;
import team.lala.timebank.enums.MemberType;
import team.lala.timebank.enums.YesNo;
import team.lala.timebank.service.MemberService;
import team.lala.timebank.spec.MemberSpecification;

@Controller
@RequestMapping("/member")
public class MemberController {

	@Autowired
	private MemberService memberService;

	
	@RequestMapping("/list")
	public String listPage(Model model) {
		List<Member> members = memberService.findAll();
		model.addAttribute("members", members);
		
		return "/member/member_list4";
//		return "/member/member_list";

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
	public List<Member> queryMember(Member inputMember){
		System.out.println("query");
		System.out.println("inputmember=" + inputMember);
		MemberSpecification memberSpec = new MemberSpecification(inputMember);
		List<Member> members = memberService.findBySpecification(memberSpec);
		System.out.println("queryMember=" +members);
		return members;
	}
	
	@RequestMapping("/queryPageRequest")
	@ResponseBody
	public Page<Member> queryMember(Member inputMember,	@RequestParam(value="start",required=false) Optional<Integer> start, 
			@RequestParam(value="length",required=false) Optional<Integer> length,Model model){
		int page = start.orElse(0)/10;
		System.out.println("queryPageRequest");
		System.out.println("inputmember=" + inputMember);
		System.out.println("start=" + start + ", page"+ page+", length=" +length);
		
		MemberSpecification memberSpec = new MemberSpecification(inputMember);		
		Page<Member> members = memberService.findBySpecification(memberSpec,PageRequest.of(page, length.orElse(10)));

		System.out.println("queryMember=" +members);
		return members;
	}
	
	@ResponseBody
	@RequestMapping("/update")
	public AjaxResponse<Member> updateMember(Member member) {
		System.out.println("inputMember="+member);			
		AjaxResponse<Member> response = new AjaxResponse<Member>();
		try {
			Member updatedMember = memberService.update(member);
			response.setObj(updatedMember);
			System.out.println("updatedMember="+updatedMember);		
			System.out.println("資料更新成功");
		} catch (Exception e) {
			response.addMessage("資料更新失敗" + e.getMessage());
			System.out.println("資料更新失敗");
		}
		return 	response;
	}


	@RequestMapping("/insert")
	@ResponseBody
	public AjaxResponse<Member> insertMember(Member member) {		
		System.out.println("member = " + member);
		AjaxResponse<Member> response = new AjaxResponse<Member>();
		
		try {
			Member newMember = memberService.insert(member);
			response.setObj(newMember);
			System.out.println("新增成功");
		} catch (Exception e) {
			response.addMessage("新增失敗" + e.getMessage());
			e.printStackTrace();
		}
		return response;
	}

	@RequestMapping("/delete")
	@ResponseBody
	public AjaxResponse<Member> deleteMember(@RequestParam("id") Long id) {
		AjaxResponse<Member> response = new AjaxResponse<Member>();
		System.out.println("id = "+id);
		try {
			memberService.deleteById(id);
			System.out.println("刪除成功");
		} catch (Exception e) {
			response.addMessage("刪除失敗" + e.getMessage());
			e.printStackTrace();
		}		
		return response;

	}
	

	


}