package team.lala.timebank.web.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import team.lala.timebank.commons.ajax.AjaxResponse;
import team.lala.timebank.entity.Member;
import team.lala.timebank.service.MemberService;

//@Slf4j
@Controller
@RequestMapping("/user/personal-info")
public class UserPersonalInfoController {
	
	@Autowired
	private MemberService memberService;
	
	@RequestMapping("/list")
	public String listPage(Model model) {
		return "/user/personal_info/personal-info_list";
	}
	
//	@RequestMapping("/edit")
//	public String editPage(@RequestParam("id") Long id, Model model) {
////		Member member = memberService.getOne(id);
////		model.addAttribute("member", member);
//		return "user/personal_info/personal-info_edit";
//	}
	
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
}
