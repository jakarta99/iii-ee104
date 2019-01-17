package team.lala.timebank.web;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.extern.slf4j.Slf4j;
import team.lala.timebank.commons.ajax.AjaxResponse;
import team.lala.timebank.entity.Member;
import team.lala.timebank.enums.MemberType;
import team.lala.timebank.enums.YesNo;
import team.lala.timebank.service.MemberService;

@Slf4j
@Controller
public class AuthController {
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private PasswordEncoder encoder;
	
	@GetMapping("/login")
	public String loginPage() {
		return "/basic/commons/login";
	}
	
	@RequestMapping("/login/oauth2/google")
	@ResponseBody
	public Member googleAddPage(@RequestParam("name") String name, 
			@RequestParam("email") String email, 
			@RequestParam("oauth2Id") String oauth2Id, HttpSession session) {
		Member member = new Member();
		if(memberService.findByOauth2Id(oauth2Id) != null) {
			//已有此會員
			member = memberService.findByOauth2Id(oauth2Id);
			log.debug("member.getId()={}", member.getId());
		}else {
			member.setName(name);
			member.setEmail(email);
			member.setOauth2Id(oauth2Id);
			session.setAttribute("member", member);
		}
		log.debug("google member={}",member);
		return member;
	}
	
	@RequestMapping("/login/oauth2/insert")
	@ResponseBody
	public AjaxResponse<Member> insertMember(HttpSession session) {
		Member member = (Member)session.getAttribute("member");
		log.debug("insert member={}",member);
		AjaxResponse<Member> response = new AjaxResponse<Member>();
		if(memberService.findByOauth2Id(member.getOauth2Id()) == null) {
			try {
				String[] tokens = member.getEmail().split("@");
				String account = tokens[0];
				String password = encoder.encode(member.getOauth2Id());
				member.setMemberType(MemberType.P);
				member.setAccount(account);
				member.setPassword(password);
				member.setName(member.getName());
				member.setEmail(member.getEmail());
				member.setOauth2Id(member.getOauth2Id());
				Member newMember = memberService.insert(member);
				member.setEmailVerification(YesNo.Y);
				member.setBalanceValue(0);
				memberService.addRole(member.getId(), 2l);
				newMember = memberService.update(member);
				log.debug("newMember.getId()={}", newMember.getId());
				response.setObj(newMember);
				log.debug("新增成功");
			} catch (Exception e) {
				response.addMessage("新增失敗" + e.getMessage());
				e.printStackTrace();
			}
		}else {
			response.addMessage("資料有誤");		
		}
		return response;
	}
	
	
//	@RequestMapping("/login/oauth2/facebook")
//	public String facebookAddPage(@RequestParam("oauth2Id") String oauth2Id, Model model) {
//		if(memberService.findByOauth2Id(oauth2Id) != null) {
//			Member member = memberService.findByOauth2Id(oauth2Id);
//			String account = member.getAccount();
//			return "/index?account="+account;
//		}else {
//			model.addAttribute("oauth2Id", oauth2Id);
//			return "/basic/commons/login_oauth2/login-oauth2_add";
//		}
//	}
	
}
