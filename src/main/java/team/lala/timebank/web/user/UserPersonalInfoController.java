package team.lala.timebank.web.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.extern.slf4j.Slf4j;
import team.lala.timebank.commons.ajax.AjaxResponse;
import team.lala.timebank.entity.Member;
import team.lala.timebank.service.MemberService;

@Slf4j
@Controller
@RequestMapping("/basic/user/personal-info")
public class UserPersonalInfoController {
	
	@Autowired
	private MemberService memberService;
	
	@RequestMapping("/edit")
	public String editPage(Model model) {
		Member userDetails = (Member) SecurityContextHolder.getContext()  
							.getAuthentication()  
							.getPrincipal();
		Member member = memberService.getOne(userDetails.getId());
		model.addAttribute("member", member);
		return "/basic/user/personal_info/personal-info_edit";
	}
	
	@ResponseBody
	@RequestMapping("/update")
	public AjaxResponse<Member> updateMember(Member member) {
		log.debug("inputMember={}",member);			
		AjaxResponse<Member> response = new AjaxResponse<Member>();
		try {
			Member updatedMember = memberService.update(member);
			response.setObj(updatedMember);
			log.debug("updatedMember={}",updatedMember);		
			log.debug("資料更新成功");
		} catch (Exception e) {
			response.addMessage("資料更新失敗" + e.getMessage());
			log.debug("資料更新失敗");
		}
		return 	response;
	}
	
	//測試直接從登入資訊中取得會員id
	@RequestMapping("/test")
	public void showMember() {
		Member userDetails = (Member) SecurityContextHolder.getContext()  
	    					.getAuthentication()  
							.getPrincipal();  
		log.debug("USERID={}", userDetails.getId());		  
		log.debug("USERNAME={}", userDetails.getAccount());
		log.debug("USERNAME={}", userDetails.getUsername());
	}
}
