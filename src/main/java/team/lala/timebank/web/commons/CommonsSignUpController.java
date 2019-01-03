package team.lala.timebank.web.commons;

import java.util.Set;
import java.util.TreeSet;
import java.util.regex.Pattern;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.extern.slf4j.Slf4j;
import team.lala.timebank.commons.ajax.AjaxResponse;
import team.lala.timebank.entity.Member;
import team.lala.timebank.entity.Role;
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
	
//	@Autowired
//	private Set<Role> roles;
//	
//	@Autowired
//	private Role role;
	
	@RequestMapping("/type")
	public String typePage(Model model) {
		return "/basic/commons/sign_up/sign-up_type";
	}
	
	@RequestMapping("/add")
	public String addPage(@RequestParam("memberType") MemberType memberType, Model model) {
		model.addAttribute("memberType", memberType);
		return "/basic/commons/sign_up/sign-up_add";
	}
	
	@RequestMapping("/edit")
	public String editPage(Member m, Model model) {
		Member member = memberService.findByAccount(m);
		model.addAttribute("member", member);
		return "/basic/commons/sign_up/sign-up_edit";
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
		boolean fAccount = false;
		boolean fAccountD = false;
		boolean fPassword = false;
		boolean fPassword1 = false;
		boolean fPassword2 = false;
		boolean fPassword3 = false;
		boolean fName = false;
		boolean fIdNumber = false;
		boolean fDate = false;
		boolean fEmail = false;
		boolean fTelephone = false;
		boolean fMobile = false;

		log.debug("member={}", member);
//		AjaxResponse<Member> response = new AjaxResponse<Member>();
		AjaxResponse<Member> response = new AjaxResponse<Member>();//回傳前端
//		Map<String, Object> result = new HashMap<>(); //ajaxResponse.obj
//		Map<String, String> errors = new HashMap<>();
		
//		response.setObj(result);
//		result.put("member", member); //ajaxResponse.obj.member
//		result.put("errors", errors);//ajaxResponse.obj.errors
		
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
		if (memberService.findByAccount(member) == null) {
			fAccountD = true;
		}else {
//			errors.put("account", "帳號重複(測)");
			log.debug("wrong!!!帳號重複");
			response.addMessage("帳號重複");
		}
		
		// 檢查密碼  不可空白，長度必須大於等於8小於等於16
		if (member.getPassword() != null && member.getPassword().trim().length() >= 8 && member.getPassword().trim().length() <= 16) {
			// 判斷是否包含字母、數字、特殊符號
			for (int i = 0; i < member.getPassword().length(); i++) {
				String test = member.getPassword().substring(i, i + 1);
				if (test.matches("[a-zA-Z]")) {
					fPassword1 = true;
				}else if(test.matches("[0-9]")){
					fPassword2 = true;
				}else if(test.matches("[~!@#$%^&*]")){
					fPassword3 = true;
				}else {
					response.addMessage("密碼格式錯誤");
				}
			}
			if (fPassword1 && fPassword2 && fPassword3) {
				fPassword = true;
			}
		}else {
			log.debug("密碼XXX");
			response.addMessage("密碼格式錯誤");
		}
		
		//檢查Name 不可空白，至少2個字以上
		if (member.getName() != null && member.getName().trim().length() >= 2) {
			// 檢查必須全部為中文
			for (int i = 0; i < member.getName().length(); i++) {
				String test = member.getName().substring(i, i + 1);
				if (test.matches("[\\u4E00-\\u9FA5]")) {
					fName = true;
				}
			}
		}else {
			log.debug("姓名XXX");
			response.addMessage("姓名格式錯誤");
		}
		
		//檢查IdNumber
		if(member.getCertificateIdNumber() != null) {
			if(member.getMemberType() == MemberType.P) {
				Pattern TWPID_PATTERN = Pattern.compile("[ABCDEFGHJKLMNPQRSTUVXYWZIO][12]\\d{8}");
				String pattern = "ABCDEFGHJKLMNPQRSTUVXYWZIO";
			    if (TWPID_PATTERN.matcher(member.getCertificateIdNumber().toUpperCase()).matches()) {
			    	int code = pattern.indexOf(member.getCertificateIdNumber().toUpperCase().charAt(0)) + 10;
			        int sum = 0;
			        sum = (int) (code / 10) + 9 * (code % 10) + 8 * (member.getCertificateIdNumber().charAt(1) - '0')
			            + 7 * (member.getCertificateIdNumber().charAt(2) - '0') + 6 * (member.getCertificateIdNumber().charAt(3) - '0')
			            + 5 * (member.getCertificateIdNumber().charAt(4) - '0') + 4 * (member.getCertificateIdNumber().charAt(5) - '0')
			            + 3 * (member.getCertificateIdNumber().charAt(6) - '0') + 2 * (member.getCertificateIdNumber().charAt(7) - '0')
			            + 1 * (member.getCertificateIdNumber().charAt(8) - '0') + (member.getCertificateIdNumber().charAt(9) - '0');
			        if ( (sum % 10) == 0) {
			        	fIdNumber = true;
			        }else {
			        	response.addMessage("身分證字號格式錯誤");
			        }
			    }else {
					log.debug("IdNumberXXX");
					response.addMessage("身分證字號格式錯誤");
				}
			}
			if(member.getMemberType() == MemberType.O) {
				Pattern TWBID_PATTERN = Pattern.compile("^[0-9]{8}$");
				String weight = "12121241";
			    boolean flag = false; //第七個數是否為七
			    if (TWBID_PATTERN.matcher(member.getCertificateIdNumber()).matches()) {
			    	int tmp = 0, sum = 0;
			    	for (int i = 0; i < 8; i++) {
			    		tmp = (member.getCertificateIdNumber().charAt(i) - '0') * (weight.charAt(i) - '0');
			    		sum += (int) (tmp / 10) + (tmp % 10); //取出十位數和個位數相加
			    		if (i == 6 && member.getCertificateIdNumber().charAt(i) == '7') {
			    			flag = true;
			    		}
			    	}
			    	if (flag) {
			    		if ( (sum % 10) == 0 || ( (sum + 1) % 10) == 0) { //如果第七位數為7
			    			fIdNumber = true;
			    		}else {
			    			response.addMessage("統一編號格式錯誤");
			    		}
			    	} else {
			    		if ( (sum % 10) == 0) {
			    			fIdNumber = true;
			    		}else {
			    			response.addMessage("統一編號格式錯誤");
			    		}
			    	}
			    }else {
					log.debug("IdNumberXXX");
					response.addMessage("統一編號格式錯誤");
				}
			}
		}else {
			log.debug("IdNumberXXX");
			response.addMessage("IdNumber格式錯誤");
		}
		
		//檢查BirthDate
//		String date = member.getBirthDate().toString();
//		System.out.println(date);
//		if (member.getBirthDate() != null) {
//			// 檢查格式是否符合
//			String regex = "^\\d{4}\\/\\d{1,2}\\/\\d{1,2}$";
//			Pattern p = Pattern.compile(regex);
////			String date = member.getBirthDate().toString();
////			System.out.println(date);
////			if (p.matcher(member.getBirthDate()).find()) {
////				fDate = true;
////			}
////			var re = /^\d{4}\/\d{1,2}\/\d{1,2}$/;
////	        var theDate = new Date(strDate);
////	        var theYear = theDate.getFullYear();
////	        var theMonth = theDate.getMonth() + 1;
////	        var theDate = theDate.getDate();
////	        var aryDate = strDate.split("/");
////            if (re.test(strDate)) {
////                if (aryDate[0] == theYear && aryDate[1] == theMonth && aryDate[2] == theDate){
////                    msgChk.innerHTML = "<img src='/img/O.jpg'><span style='color:green'>正確</span>";
////                }else{
////                    msgChk.innerHTML = "<img src='/img/X.jpg'><span style='color:red'>輸入錯誤，請重新輸入</span>";
////                }
////            }else{
////                msgChk.innerHTML = "<img src='/img/X.jpg'><span style='color:red'>格式錯誤，請重新輸入</span>";
////            }
////        }else{
////            msgChk.innerHTML = "<img src='/img/X.jpg'><span style='color:red'>不可空白</span>";
//        }
		
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
		
		//檢查電話
		if(member.getTelephone() != null && member.getTelephone().trim().length() != 0) {
			String regex = "^[0-9]{2}-[0-9]{6,8}$";
			Pattern p = Pattern.compile(regex);
			if (p.matcher(member.getTelephone()).find()) {
				fTelephone = true;
			}else {
				log.debug("電話XXX");
				response.addMessage("電話格式錯誤");
			}
		}else {
			fTelephone = true;
		}
		
		//檢查手機
		if(member.getMobile() != null && member.getMobile().trim().length() != 0) {
			String regex = "^09[0-9]{2}-[0-9]{3}-[0-9]{3}$";
			Pattern p = Pattern.compile(regex);
			if (p.matcher(member.getMobile()).find()) {
				fMobile = true;
			}else {
				log.debug("手機XXX");
				response.addMessage("手機格式錯誤");
			}
		}else {
			fMobile = true;
		}

		
		//要放在驗證資料之後
		if( fAccount && fAccountD && fPassword && fName && fIdNumber 
				/*&& fDate*/ && fEmail && fTelephone && fMobile) {
			try {
				member.setPassword(encoder.encode(member.getPassword()));
				Member newMember = memberService.insert(member);
//				Set<Role> roles = new TreeSet<Role>();
//				Role role = new Role();
//				role.setRoleName("user");
//				roles.add(role);
//				member.setRoles(roles);
				
//				result.put("member", newMember);
//				response.setObj(result);
				response.setObj(newMember);
				
				log.debug("新增成功");
			} catch (Exception e) {
				response.addMessage("新增失敗" + e.getMessage());
				e.printStackTrace();
				
			}
		}else {
			response.addMessage("資料有誤");
		}
		
//		model.addAttribute("errors", errors);
//		result.put("errors", errors);
//		log.debug("test={}", errors.get("account"));
		return response;
	}
	
	@RequestMapping("/update")
	@ResponseBody
	public AjaxResponse<Member> update(Member member, Model model) {
		AjaxResponse<Member> response = new AjaxResponse<Member>();
		try {
			memberService.update(member);
		} catch (Exception e) {
			response.addMessage("Failed to update. " + e.getMessage());
			e.printStackTrace();
		}finally {
			response.setObj(member);
		}
		return response;
	}

}
