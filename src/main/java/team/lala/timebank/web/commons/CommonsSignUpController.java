package team.lala.timebank.web.commons;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.extern.slf4j.Slf4j;
import team.lala.timebank.commons.ajax.AjaxResponse;
import team.lala.timebank.entity.Member;
import team.lala.timebank.enums.MemberType;
import team.lala.timebank.service.MemberService;

@Slf4j
@Controller
@RequestMapping("/commons/sign-up")
public class CommonsSignUpController {
	
	@Autowired
	private MemberService memberService;
	
	@RequestMapping("/type")
	public String typePage(Model model) {
		return "/basic/commons/sign_up/sign-up_type";
	}
	
	@RequestMapping("/add")
	public String addPage(@RequestParam("memberType") MemberType memberType, Model model) {
		model.addAttribute("memberType", memberType);
		return "/basic/commons/sign_up/sign-up_add";
	}
	
	@RequestMapping("/insert")
	@ResponseBody
	public AjaxResponse<Member> insertMember(Member member) {		
		log.debug("member={}", member);
		AjaxResponse<Member> response = new AjaxResponse<Member>();
		
		try {
			Member newMember = memberService.insert(member);
			response.setObj(newMember);
			log.debug("新增成功" );
		} catch (Exception e) {
			response.addMessage("新增失敗" + e.getMessage());
			e.printStackTrace();
		}
		return response;
	}
	
}
