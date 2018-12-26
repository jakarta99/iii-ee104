package team.lala.timebank.web.commons;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
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
	
	@Autowired
	private PasswordEncoder encoder;
	
	@RequestMapping("/type")
	public String typePage(Model model) {
		return "/basic/commons/sign_up/sign-up_type";
	}
	
	@RequestMapping("/add")
	public String addPage(@RequestParam("memberType") MemberType memberType, Model model) {
		model.addAttribute("memberType", memberType);
		return "/basic/commons/sign_up/sign-up_add";
	}
	
//	@InitBinder
//	public void registerCustomPropertyEditor(WebDataBinder webDataBinder) {
//		webDataBinder.registerCustomEditor(java.util.Date.class, 
//				"birthDate", new CustomDateEditor(new SimpleDateFormat("yyyy-MM-dd"),true));	
//	}
	
	@RequestMapping("/insert")
	@ResponseBody
	public AjaxResponse<Member> insertMember(Member member/*, BindingResult bindingResults*/) {		
		
//		if(bindingResults != null && bindingResults.hasFieldErrors()) {
//			if(bindingResults.hasFieldErrors("birthDate")) {
//				errors.put("birthDate", "birthDate must be a date of YYYY-MM-DD");
//			}
//		}
		
		log.debug("member={}", member);
//		AjaxResponse<Member> response = new AjaxResponse<Member>();
		AjaxResponse<Member> response = new AjaxResponse<Member>();//回傳前端
//		Map<String, Object> result = new HashMap<>(); //ajaxResponse.obj
//		Map<String, String> errors = new HashMap<>();
		
		
		
//		response.setObj(result);
//		result.put("member", member); //ajaxResponse.obj.member
//		result.put("errors", errors);//ajaxResponse.obj.errors
		
		
		//驗證資料
		// 檢查帳號  長度必須大於等於6
//		if (member.getAccount() != null && member.getAccount().trim().length() >= 6) {
//			// 檢查必須全英文或數字
//			for (int i = 0; i < member.getAccount().length(); i++) {
//				String test = member.getAccount().substring(i, i + 1);
//				if (test.matches("[a-zA-Z0-9]")) {
//				}
//			}
//		}else {
//			errors.put("account", "wrong");
//		}
		
		
		
		// 檢查帳號是否重複，如果沒重複則insert資料庫
		// findByLoginAccount回傳如果是null，代表資料庫沒相同的帳號，可以註冊
		if (memberService.findByAccount(member) == null) {
			try {
				member.setPassword(encoder.encode(member.getPassword()));
				Member newMember = memberService.insert(member);
//				result.put("member", newMember);
//				response.setObj(result);
				
				response.setObj(newMember);
				
				log.debug("新增成功");
			} catch (Exception e) {
				response.addMessage("新增失敗" + e.getMessage());
				e.printStackTrace();
				
			}
		}else {
//			errors.put("account", "帳號重複(測)");
			log.debug("wrong!!!帳號重複");
			response.addMessage("帳號重複");
		}
		
		//要放在驗證資料之後
//		if(errors!=null && !errors.isEmpty()) {
//			return "/basic/commons/sign_up/sign-up_add";
//		}
//		model.addAttribute("errors", errors);
//		result.put("errors", errors);
//		log.debug("test={}", errors.get("account"));
		return response;
	}

//	public boolean checkMember(Member member, Model model) {
//		// 檢查密碼  長度必須大於等於6
//		if (member.getPassword() != null && member.getPassword().trim().length() >= 6) {
//			// 檢查必須全英文或數字
//			for (int i = 0; i < member.getPassword().length(); i++) {
//				String test = member.getPassword().substring(i, i + 1);
//				if (test.matches("[a-zA-Z0-9]")) {
//					return true;
//				}
//			}
//		}else {
//			log.debug("密碼有誤");
//		}
//		// 檢查名稱  長度必須大於等於2
//		if (member.getName() != null && member.getName().trim().length() >= 2) {
//			// 檢查必須全中文
//			for (int i = 0; i < member.getName().length(); i++) {
//				String test = member.getName().substring(i, i + 1);
//				if (test.matches("[\\u4E00-\\u9FA5]")) {
//					return true;
//				}
//			}
//		}else {
//			log.debug("名稱有誤");
//		}
//		// 檢查email是否有輸入
//		if (member.getEmail() != null && member.getEmail().trim().length() != 0) {
//			// 檢查格式是否符合
//			String regex = "^\\w{1,63}@[a-zA-Z0-9]{2,63}\\.[a-zA-Z]{2,63}(\\.[a-zA-Z]{2,63})?$";
//			Pattern p = Pattern.compile(regex);
//			if (p.matcher(member.getEmail()).find()) {
//				return true;
//			}
//		}else {
//			log.debug("email有誤");
//		}
//		// 檢查長度必須等於10
//		if (member.getTelephone() != null && member.getTelephone().trim().length() == 10) {
//			// 檢查格式必須全數字
//			for (int i = 0; i < member.getTelephone().length(); i++) {
//				String test = member.getTelephone().substring(i, i + 1);
//				if (test.matches("[0-9]")) {
//					return true;
//				}
//			}
//		}else {
//			log.debug("手機有誤");
//		}
//		return false;
//	}

}
