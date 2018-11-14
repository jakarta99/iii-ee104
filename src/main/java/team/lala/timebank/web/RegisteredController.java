package team.lala.timebank.web;

import java.util.regex.Pattern;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RestController;

import team.lala.timebank.entity.Member;
import team.lala.timebank.service.MemberService;

//louis
@RestController
public class RegisteredController {
	@Autowired
	private MemberService memberService ;

	public Member MemberRegistered(String loginAccount, String password, String name, String type, String email,
			String telephone, String mobile) {
		// 檢查帳號
		boolean baccount = false;
		// 檢查長度必須大於等於6
		if (loginAccount == null || loginAccount.trim().length() < 6) {
			System.out.println("帳號長度必須大於等於6");
		} else {
			// 檢查必須全英文或數字
			for (int i = 0; i < loginAccount.length(); i++) {
				String test = loginAccount.substring(i, i + 1);
				if (test.matches("[a-zA-Z0-9]")) {
					baccount = true;
				} else {
					System.out.println("帳號格式錯誤");
					baccount = false;
					break;
				}
			}
		}
		// 檢查密碼
		boolean bpassword = false;
		// 檢查長度必須大於等於6
		if (password == null || password.trim().length() < 6) {
			System.out.println("密碼長度必須大於等於6");
		} else {
			// 檢查必須全英文或數字
			for (int i = 0; i < password.length(); i++) {
				String test = password.substring(i, i + 1);
				if (test.matches("[a-zA-Z0-9]")) {
					bpassword = true;
				} else {
					System.out.println("密碼格式錯誤");
					bpassword = false;
					break;
				}
			}
		}
		// 檢查名子
		boolean bname = false;
		// 檢查長度必須大於等於2
		if (name == null || name.trim().length() < 2) {
			System.out.println("名子長度必須大於等於2");
		} else {
			// 檢查必須全中文
			for (int i = 0; i < name.length(); i++) {
				String test = name.substring(i, i + 1);
				if (test.matches("[\\u4E00-\\u9FA5]")) {
					bname = true;
				} else {
					System.out.println("名子格式錯誤");
					bname = false;
					break;
				}
			}
		}
		// 檢查email
		boolean bemail = false;
		// 檢查email是否有輸入
		if (email == null || email.trim().length() == 0) {
			System.out.println("必須輸入email");
		} else {
			// 檢查格式是否符合
			String regex = "^\\w{1,63}@[a-zA-Z0-9]{2,63}\\.[a-zA-Z]{2,63}(\\.[a-zA-Z]{2,63})?$";
			Pattern p = Pattern.compile(regex);
			if (p.matcher(email).find()) {
				bemail = true;
			} else {
				bemail = false;
			}

		}
		// 檢查家電
		boolean btelephone = false;
		// 檢查長度必須等於10
		if (telephone == null || telephone.trim().length() != 10) {
			System.out.println("電話格式錯誤-1");
		} else {
			// 檢查格式必須全數字
			for (int i = 0; i < telephone.length(); i++) {
				String test = telephone.substring(i, i + 1);
				if (test.matches("[0-9]")) {
					btelephone = true;
				} else {
					System.out.println("電話格式錯誤-2");
					btelephone = false;
					break;
				}
			}
		}
		// 檢查手機
		boolean bmobile = false;
		// 檢查長度必須等於10
		if (mobile == null || mobile.trim().length() != 10) {
			System.out.println("手機格式錯誤");
		} else {
			// 檢查格式必須全數字
			for (int i = 0; i < mobile.length(); i++) {
				String test = mobile.substring(i, i + 1);
				if (test.matches("[0-9]")) {
					bmobile = true;
				} else {
					System.out.println("手機格式錯誤");
					bmobile = false;
					break;
				}
			}
		}

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
		boolean checkAccount = memberService.checkAccountDuplicates(member);
		if (checkAccount) {
			System.out.println("註冊成功");
		} else {
			System.out.println("註冊失敗");
		}

		return member;
	}

}
