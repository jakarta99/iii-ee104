package team.lala.timebank.web;

import java.util.regex.Pattern;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.extern.slf4j.Slf4j;
import team.lala.timebank.commons.ajax.AjaxResponse;
import team.lala.timebank.entity.Member;
import team.lala.timebank.service.MemberService;

@Slf4j
@Controller
public class AuthController {
	
	@Autowired
	private MemberService memberService;
	
	@GetMapping("/login")
	public String loginPage() {
		return "/basic/commons/login";
	}
	
	@RequestMapping("/login/oauth2/google")
	public String googleAddPage(@RequestParam("email") String email, 
			@RequestParam("oauth2Id") String oauth2Id, Model model) {
		if(memberService.findByOauth2Id(oauth2Id) != null) {
			Member member = memberService.findByOauth2Id(oauth2Id);
			String account = member.getAccount();
			return "/index?account="+account;
		}else {
			model.addAttribute("email", email);
			model.addAttribute("oauth2Id", oauth2Id);
			return "/basic/commons/login_oauth2/login-oauth2_add";			
		}
	}
	
	@RequestMapping("/login/oauth2/facebook")
	public String facebookAddPage(@RequestParam("oauth2Id") String oauth2Id, Model model) {
		if(memberService.findByOauth2Id(oauth2Id) != null) {
			Member member = memberService.findByOauth2Id(oauth2Id);
			String account = member.getAccount();
			return "/index?account="+account;
		}else {
			model.addAttribute("oauth2Id", oauth2Id);
			return "/basic/commons/login_oauth2/login-oauth2_add";
		}
	}
	
	@RequestMapping("/login/oauth2/insert")
	@ResponseBody
	public AjaxResponse<Member> insertMember(Member member) {		
		//填寫 account、memberType、name
		boolean fAccount = false;
		boolean fAccountD = false;
		boolean fName = false;
		boolean fEmail = false;

		log.debug("member={}", member);	
		AjaxResponse<Member> response = new AjaxResponse<Member>();//回傳前端

		//驗證資料
		
		// 檢查帳號  不可空白，長度必須大於等於6
		if (member.getAccount() != null && member.getAccount().trim().length() >= 6) {
			// 檢查必須全英文或數字
			for (int i = 0; i < member.getAccount().length(); i++) {
				String test = member.getAccount().substring(i, i + 1);
				if (test.matches("[a-zA-Z0-9]")) {
					fAccount = true;
				}else {
					fAccount = false;
					response.addMessage("帳號格式錯誤");
				}
			}
		}else {
//			errors.put("account", "wrong");
			log.debug("帳號XXX");
			response.addMessage("帳號格式錯誤");
		}
		// 檢查帳號是否重複，如果沒重複則insert資料庫
		// findByLoginAccount回傳如果是null，代表資料庫沒相同的帳號，可以註冊
		if (memberService.findByAccount(member.getAccount()) == null) {
			fAccountD = true;
		}else {
			log.debug("wrong!!!已有此帳號");
			response.addMessage("已有此帳號");
		}
		
		//檢查Name 不可空白，至少2個字以上
		if (member.getName() != null && member.getName().trim().length() >= 2) {
			// 檢查必須全部為中文
			for (int i = 0; i < member.getName().length(); i++) {
				String test = member.getName().substring(i, i + 1);
				if (test.matches("[\\u4E00-\\u9FA5]")) {
					fName = true;
				}else {
					fName = false;
					log.debug("姓名XXX");
					response.addMessage("姓名格式錯誤");
					break;
				}
			}
		}else {
			log.debug("姓名XXX");
			response.addMessage("姓名格式錯誤");
		}
		
		//檢查Email
		if (member.getEmail() != null && member.getEmail().trim().length() != 0) {
			// 檢查格式是否符合
			String regex = "^\\w+((-\\w+)|(\\.\\w+))*\\@[A-Za-z0-9]+((\\.|-)[A-Za-z0-9]+)*\\.[A-Za-z]+$";
			Pattern p = Pattern.compile(regex);
			if (p.matcher(member.getEmail()).find()) {
				fEmail = true;
			}
		}else {
			log.debug("emailXXX");
			response.addMessage("email格式錯誤");
		}
		
		//要放在驗證資料之後
		if( fAccount && fAccountD && fName) {
			try {
				member.setOauth2Id(member.getOauth2Id());
				member.setMemberType(member.getMemberType());
				Member newMember = memberService.insert(member);
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
	
	@RequestMapping("/login/oauth2/checkAccount")
	@ResponseBody
	public String accountCheck(@RequestParam("account") String account){
		String result = "帳號可使用";
		if (memberService.findByAccount(account) != null) {
			result = "已有此帳號";
		}
		return result;
	}
}
