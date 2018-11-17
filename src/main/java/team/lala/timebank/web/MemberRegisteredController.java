package team.lala.timebank.web;

import java.util.regex.Pattern;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RestController;

import team.lala.timebank.entity.Member;
import team.lala.timebank.service.MemberService;

//louis
@RestController
public class MemberRegisteredController {
	@Autowired
	private MemberService memberService;
	private MemberRegisteredController memberRegisteredController;

	public Member MemberRegistered(String loginAccount, String password, String name, String type, String email,
			String telephone, String mobile) {
		boolean baccount = memberRegisteredController.checkLoginAccount(loginAccount); // 檢查帳號
		boolean bpassword = memberRegisteredController.checkPassword(password); // 檢查密碼
		boolean bname = memberRegisteredController.checkName(name); // 檢查名子
		boolean bemail = memberRegisteredController.checkEmail(email); // 檢查email
		boolean btelephone = memberRegisteredController.checkphone(telephone); // 檢查家電
		boolean bmobile = memberRegisteredController.checkphone(mobile); // 檢查手機

		// 檢查格式是否都符合
		Member member = new Member();
		if (baccount && bpassword && bemail && bname && btelephone && bmobile) {
			// 將註冊者的資料封裝
			member.setLoginAccount(loginAccount);
			member.setPassword(password);
			member.setName(name);
			member.setEmail(email);
			member.setType(type);
			member.setTelephone(telephone);
			member.setMobile(mobile);
		} else {
			return member;
		}
		// 檢查帳號是否重複，如果沒重複則insert資料庫
		member = memberService.findByLoginAccount(member);
		if (member != null) {
			member = memberService.save(member);
		}
		return member;
	}

	public boolean checkLoginAccount(String loginAccount) {
		// 檢查長度必須大於等於6
		if (loginAccount != null && loginAccount.trim().length() >= 6) {
			// 檢查必須全英文或數字
			for (int i = 0; i < loginAccount.length(); i++) {
				String test = loginAccount.substring(i, i + 1);
				if (test.matches("[a-zA-Z0-9]")) {
					return true;
				}
			}
		}
		return false;
	}

	public boolean checkPassword(String password) {
		// 檢查長度必須大於等於6
		if (password != null && password.trim().length() >= 6) {
			// 檢查必須全英文或數字
			for (int i = 0; i < password.length(); i++) {
				String test = password.substring(i, i + 1);
				if (test.matches("[a-zA-Z0-9]")) {
					return true;
				}
			}
		}
		return false;
	}

	public boolean checkName(String name) {
		// 檢查長度必須大於等於2
		if (name != null && name.trim().length() >= 2) {
			// 檢查必須全中文
			for (int i = 0; i < name.length(); i++) {
				String test = name.substring(i, i + 1);
				if (test.matches("[\\u4E00-\\u9FA5]")) {
					return true;
				}
			}
		}
		return false;
	}

	public boolean checkEmail(String email) {
		// 檢查email是否有輸入
		if (email != null && email.trim().length() != 0) {
			// 檢查格式是否符合
			String regex = "^\\w{1,63}@[a-zA-Z0-9]{2,63}\\.[a-zA-Z]{2,63}(\\.[a-zA-Z]{2,63})?$";
			Pattern p = Pattern.compile(regex);
			if (p.matcher(email).find()) {
				return true;
			}
		}
		return false;
	}

	public boolean checkphone(String phone) {
		// 檢查長度必須等於10
		if (phone != null && phone.trim().length() == 10) {
			// 檢查格式必須全數字
			for (int i = 0; i < phone.length(); i++) {
				String test = phone.substring(i, i + 1);
				if (test.matches("[0-9]")) {
					return true;
				}
			}
		}
		return false;
	}

}
