package team.lala.timebank.web.commons;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.extern.slf4j.Slf4j;
import team.lala.timebank.commons.ajax.AjaxResponse;
import team.lala.timebank.commons.mail.MailServiceImpl;
import team.lala.timebank.entity.Member;
import team.lala.timebank.enums.MemberType;
import team.lala.timebank.service.MemberService;

@Slf4j
@Controller
@RequestMapping("/commons/login-forget")
//@SessionAttributes(names = {"memberId"})
public class CommonsForgetPasswordController {
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private PasswordEncoder encoder;
	
	@Autowired
	private MailServiceImpl mailService;
	
	@RequestMapping("/type")
	public String typePage(Model model) {
		return "/basic/commons/login_forget/login-forget_type";
	}
	
	@RequestMapping("/check")
	public String checkPage(@RequestParam("memberType") MemberType memberType, Model model) {
		model.addAttribute("memberType", memberType);
		return "/basic/commons/login_forget/login-forget_check";
	}
	
//	@RequestMapping("/checkAccount")
//	@ResponseBody
//	public String accountCheck(@RequestParam("account") String account, HttpSession session){
//		
//		String result = "沒有此帳號";
//		if (memberService.findByAccount(account) != null) {
//			Member member = memberService.findByAccount(account);
//			log.debug("member.getId()={}", member.getId());
//			session.setAttribute("memberId", member.getId());
//			result = "帳號輸入正確";
//		}
//		return result;
//	}
//	
//	@RequestMapping("/checkIdNumber")
//	@ResponseBody
//	public String idNumberCheck(@RequestParam("certificateIdNumber") String certificateIdNumber, HttpSession session){
//		Long memberId = (Long)session.getAttribute("memberId");
//		Member member = memberService.getOne(memberId);	//因session會將member蓋掉，所以以memberId取
//		
//		String result = "IdNumber輸入錯誤";
//		if (certificateIdNumber.equals(member.getCertificateIdNumber())) {
//			result = "IdNumber輸入正確";
//		}
//		return result;
//	}
	
	@RequestMapping("/mailNewPassword")
	@ResponseBody
	public AjaxResponse<Member> mailNewPassword(@RequestParam("account") String account, 
			@RequestParam("certificateIdNumber") String certificateIdNumber){
		
		log.debug("account={}", account);
		log.debug("certificateIdNumber={}", certificateIdNumber);
		AjaxResponse<Member> response = new AjaxResponse<Member>();
		
		boolean checkAccount = false;
		boolean checkIdNumber = false;		
		
//		checkAccount
		if (memberService.findByAccount(account) != null) {
			Member member = memberService.findByAccount(account);
			log.debug("member.getId()={}", member.getId());
			checkAccount = true;
//			checkIdNumber
			if(certificateIdNumber.equals(member.getCertificateIdNumber())) {
				checkIdNumber = true;
			}else {
//				response.addMessage("IdNumber輸入錯誤");
				if(member.getMemberType() == MemberType.P) {
					response.addMessage("身分證字號輸入錯誤");
				}
				if(member.getMemberType() == MemberType.O) {
					response.addMessage("統一編號輸入錯誤");
				}
			}
		}else {
			response.addMessage("沒有此帳號");	
		}
		
		if(checkAccount && checkIdNumber) {
			Member member = memberService.findByAccount(account);
			try {
				String newPassword = memberService.pwdGenerator(8, 1);
				log.debug("newPassword={}", newPassword);
				mailService.sendNewPasswordMail(member, newPassword);
				member.setPassword(encoder.encode(newPassword));
				Member memberResult = memberService.update(member);
				response.setObj(memberResult);
//				session.invalidate();	//清掉session
			} catch (Exception e) {
				e.printStackTrace();
				response.addMessage("資料有誤");
			}
		}else {
			response.addMessage("資料有誤");
		}
		return response;
	}

}
