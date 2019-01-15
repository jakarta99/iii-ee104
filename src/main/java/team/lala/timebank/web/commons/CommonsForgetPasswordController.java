package team.lala.timebank.web.commons;

import org.apache.commons.lang3.StringUtils;
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
				String verificationCode = memberService.pwdGenerator(8, 1);
				log.debug("verificationCode={}", verificationCode);
				member.setVerificationCode(verificationCode);
				Member memberResult = memberService.update(member);
				mailService.sendVerificationCodeMail(member);
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
	
	@RequestMapping("/password")
	public String passwordPage(@RequestParam("account") String account, 
			@RequestParam("verificationCode") String verificationCode, Model model) {
		Member member = memberService.findByAccount(account);
		if (!StringUtils.isEmpty(account) && !StringUtils.isEmpty(verificationCode) ) {
			
			String verificationCodeDB = member.getVerificationCode();
			//亂碼--- url VS DB
			log.debug("verificationCode={}", verificationCode);
			log.debug("verificationCodeDB={}", verificationCodeDB);
			if(verificationCode.equals(verificationCodeDB)) {
				log.debug("I'm in !");
				model.addAttribute("member", member);							
			}
		}
		
		model.addAttribute("member", member);
		return "/basic/commons/login_forget/login-forget_password";
	}
	
	@RequestMapping("/updatePassword")
	@ResponseBody
	public AjaxResponse<Member> updatePassword(Member member, @RequestParam("passwordCheck") String passwordCheck, 
			@RequestParam("passwordNew") String passwordNew) {		
		
		Member memberDB = memberService.getOne(member.getId());
		
		boolean fPasswordNew = false;
		boolean fPassword1 = false;
		boolean fPassword2 = false;
		boolean fPassword3 = false;
		boolean fPasswordCheck = false;		

		log.debug("member={}", member);
		AjaxResponse<Member> response = new AjaxResponse<Member>();//回傳前端
		
		//驗證資料
				
		// 檢查新密碼  不可空白，長度必須大於等於8小於等於16
		if (passwordNew != null && passwordNew.trim().length() >= 8 && passwordNew.trim().length() <= 16) {
			// 判斷是否包含字母、數字、特殊符號
			for (int i = 0; i < passwordNew.length(); i++) {
				String test = passwordNew.substring(i, i + 1);
				if (test.matches("[a-zA-Z]")) {
					fPassword1 = true;
				}else if(test.matches("[0-9]")){
					fPassword2 = true;
				}else if(test.matches("[~!@#$%^&*]")){
					fPassword3 = true;
				}else {
					response.addMessage("新密碼格式錯誤");
				}
			}
			if (fPassword1 && fPassword2 && fPassword3) {
				fPasswordNew = true;
			}
		}else {
			log.debug("新密碼XXX");
			response.addMessage("新密碼格式錯誤");
		}
		
		//檢查確認密碼，與新密碼相同
		if(passwordCheck.equals(passwordNew)) {
			fPasswordCheck = true;
		}else {
			log.debug("確認密碼XXX");
			response.addMessage("密碼不一致");
		}
		
		//要放在驗證資料之後
		if(fPasswordNew && fPasswordCheck) {
			try {
				log.debug("忘記密碼-newPassword={}",passwordNew);
				String encode = encoder.encode(passwordNew);
				log.debug("encode={}",encode);
				memberDB.setPassword(encode);
				Member updatedMember = memberService.update(memberDB);
				log.debug("updatedMember.getId()={}", updatedMember.getId());
				response.setObj(updatedMember);
				log.debug("資料更新成功");
			} catch (Exception e) {
				response.addMessage("資料更新失敗" + e.getMessage());
				e.printStackTrace();
			}
		}else {
			response.addMessage("資料有誤");
		}
		return response;
	}
	
	@RequestMapping("/checkPassword")
	@ResponseBody
	public String passwordCheck(@RequestParam("passwordCheck") String passwordCheck,
			@RequestParam("passwordNew") String passwordNew){
		//檢查確認密碼，與新密碼相同
		String result = "密碼不一致";
		if(passwordCheck.equals(passwordNew)) {
			result = "正確";
		}
		return result;
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

}
