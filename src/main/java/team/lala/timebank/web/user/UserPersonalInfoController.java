package team.lala.timebank.web.user;

import java.util.regex.Pattern;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
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
@RequestMapping("/user/personal-info")
public class UserPersonalInfoController {
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private PasswordEncoder encoder;
	
	@RequestMapping("/edit")
	public String editPage(Model model) {
		Member userDetails = (Member) SecurityContextHolder.getContext()  
							.getAuthentication()  
							.getPrincipal();
		Member member = memberService.getOne(userDetails.getId());
		model.addAttribute("member", member);
		return "/basic/user/personal_info/personal-info_edit";
	}
	
	@RequestMapping("/update")
	@ResponseBody
	public AjaxResponse<Member> updateMember(Member member, @RequestParam("passwordCheck") String passwordCheck, 
			@RequestParam("passwordNew") String passwordNew/*, BindingResult bindingResults*/) {		
		
//		if(bindingResults != null && bindingResults.hasFieldErrors()) {
//			if(bindingResults.hasFieldErrors("birthDate")) {
//				errors.put("birthDate", "birthDate must be a date of YYYY-MM-DD");
//			}
//		}
		
		boolean fPasswordOld = false;
		boolean fPassword1 = false;
		boolean fPassword2 = false;
		boolean fPassword3 = false;
		boolean fPasswordNew = false;
		boolean fPassword4 = false;
		boolean fPassword5 = false;
		boolean fPassword6 = false;
		boolean fPasswordCheck = false;		
		boolean fName = false;
		boolean fIdNumber = false;
		boolean fDate = false;
		boolean fEmail = false;
		boolean fTelephone = false;
		boolean fMobile = false;
		boolean fOrgFounder = false;
		boolean fOrgCeo = false;
		boolean fOrgContactPerson = false;
		boolean fOrgContactPersonTel = false;
		boolean fOrgContactPersonMobile = false;
		boolean fOrgWebsiteLink = false;

		log.debug("member={}", member);
		AjaxResponse<Member> response = new AjaxResponse<Member>();//回傳前端
		
		//驗證資料
		
		// 檢查舊密碼 是否與資料庫相符
		if(member.getPassword() != null) {
			Member userDetails = (Member) SecurityContextHolder.getContext()  
					.getAuthentication()  
					.getPrincipal();
			String encodeDB = (memberService.getOne(userDetails.getId())).getPassword();
			log.debug("insertPassword={}",member.getPassword());

			//確認輸入的密碼 與 轉碼後的隱碼 是否相符
			if(encoder.matches(member.getPassword(), encodeDB)) {
				fPasswordOld = true;
			}else {
				log.debug("舊密碼XXX");
				response.addMessage("密碼輸入錯誤");
			}
		}
		// 不可空白，長度必須大於等於8小於等於16
//		if (member.getPassword() != null && member.getPassword().trim().length() >= 8 && member.getPassword().trim().length() <= 16) {
//			// 判斷是否包含字母、數字、特殊符號
//			for (int i = 0; i < member.getPassword().length(); i++) {
//				String test = member.getPassword().substring(i, i + 1);
//				if (test.matches("[a-zA-Z]")) {
//					fPassword1 = true;
//				}else if(test.matches("[0-9]")){
//					fPassword2 = true;
//				}else if(test.matches("[~!@#$%^&*]")){
//					fPassword3 = true;
//				}else {
//					response.addMessage("舊密碼格式錯誤");
//				}
//			}
//			if (fPassword1 && fPassword2 && fPassword3) {
//				fPasswordOld = true;
//			}
//		}else {
//			log.debug("舊密碼XXX");
//			response.addMessage("舊密碼格式錯誤");
//		}
				
		// 檢查新密碼  不可空白，長度必須大於等於8小於等於16
		if (passwordNew != null && passwordNew.trim().length() >= 8 && passwordNew.trim().length() <= 16) {
			// 判斷是否包含字母、數字、特殊符號
			for (int i = 0; i < passwordNew.length(); i++) {
				String test = passwordNew.substring(i, i + 1);
				if (test.matches("[a-zA-Z]")) {
					fPassword4 = true;
				}else if(test.matches("[0-9]")){
					fPassword5 = true;
				}else if(test.matches("[~!@#$%^&*]")){
					fPassword6 = true;
				}else {
					response.addMessage("新密碼格式錯誤");
				}
			}
			if (fPassword4 && fPassword5 && fPassword6) {
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
		
		//檢查 公司資料
		if(member.getMemberType() == MemberType.O) {
			//創辦人
			if (member.getOrgFounder() != null && member.getOrgFounder().trim().length() >= 2) {
				// 檢查必須全部為中文
				for (int i = 0; i < member.getOrgFounder().length(); i++) {
					String test = member.getOrgFounder().substring(i, i + 1);
					if (test.matches("[\\u4E00-\\u9FA5]")) {
						fOrgFounder = true;
					}else {
						fOrgFounder = false;
						log.debug("創辦人XXX");
						response.addMessage("創辦人格式錯誤");
						break;
					}
				}
			}else {
				log.debug("創辦人XXX");
				response.addMessage("創辦人格式錯誤");
			}
			//執行長
			if (member.getOrgCeo() != null && member.getOrgCeo().trim().length() >= 2) {
				// 檢查必須全部為中文
				for (int i = 0; i < member.getOrgCeo().length(); i++) {
					String test = member.getOrgCeo().substring(i, i + 1);
					if (test.matches("[\\u4E00-\\u9FA5]")) {
						fOrgCeo = true;
					}else {
						fOrgCeo = false;
						log.debug("執行長XXX");
						response.addMessage("執行長格式錯誤");
						break;
					}
				}
			}else {
				log.debug("執行長XXX");
				response.addMessage("執行長格式錯誤");
			}
			//聯絡人
			if (member.getOrgContactPerson() != null && member.getOrgContactPerson().trim().length() >= 2) {
				// 檢查必須全部為中文
				for (int i = 0; i < member.getOrgContactPerson().length(); i++) {
					String test = member.getOrgContactPerson().substring(i, i + 1);
					if (test.matches("[\\u4E00-\\u9FA5]")) {
						fOrgContactPerson = true;
					}else {
						fOrgContactPerson = false;
						log.debug("聯絡人XXX");
						response.addMessage("聯絡人格式錯誤");
						break;
					}
				}
			}else {
				log.debug("聯絡人XXX");
				response.addMessage("聯絡人格式錯誤");
			}
			//聯絡人電話
			if(member.getOrgContactPersonTel() != null && member.getOrgContactPersonTel().trim().length() != 0) {
				String regex = "^[0-9]{2}-[0-9]{6,8}$";
				Pattern p = Pattern.compile(regex);
				if (p.matcher(member.getOrgContactPersonTel()).find()) {
					fOrgContactPersonTel = true;
				}else {
					log.debug("聯絡人電話XXX");
					response.addMessage("聯絡人電話格式錯誤");
				}
			}else {
				fOrgContactPersonTel = true;
			}
			//聯絡人手機
			if(member.getOrgContactPersonMobile() != null && member.getOrgContactPersonMobile().trim().length() != 0) {
				String regex = "^09[0-9]{2}-[0-9]{3}-[0-9]{3}$";
				Pattern p = Pattern.compile(regex);
				if (p.matcher(member.getOrgContactPersonMobile()).find()) {
					fOrgContactPersonMobile = true;
				}else {
					log.debug("聯絡人手機XXX");
					response.addMessage("聯絡人手機格式錯誤");
				}
			}else {
				fOrgContactPersonMobile = true;
			}
			//網址
			if(member.getOrgWebsiteLink() != null && member.getOrgWebsiteLink().trim().length() != 0) {
				String regex = "^((https|http|ftp|rtsp|mms)?://)"
			    	   	+ "?(([0-9a-zA-Z_!~*'().&=+$%-]+: )?[0-9a-zA-Z_!~*'().&=+$%-]+@)?" //ftp的user@
			    	   	+ "(([0-9]{1,3}.){3}[0-9]{1,3}" // IP URL- 123.123.123.123
			    	   	+ "|" // allow IP和DOMAIN
				    	+ "([0-9a-zA-Z_!~*'()-]+.)*" // DOMAIN- www.
				    	+ "([0-9a-zA-Z][0-9a-zA-Z-]{0,61})?[0-9a-zA-Z]." // second DOMAIN
				    	+ "[a-z]{2,6})" // first level domain- .com or .museum
				    	+ "(:[0-9]{1,4})?" // port- :80
				    	+ "((/?)|" // a slash isn't required if there is no file name
				    	+ "(/[0-9a-zA-Z_!~*'().;?:@&=+$,%#-]+)+/?)$";
				Pattern p = Pattern.compile(regex);
				if (p.matcher(member.getOrgWebsiteLink()).find()) {
					fOrgWebsiteLink = true;
				}else {
					log.debug("網址XXX");
					response.addMessage("網址格式錯誤");
				}
			}else {
				fOrgWebsiteLink = true;
			}
		}
		
		//要放在驗證資料之後
		if( fPasswordOld && fPasswordNew && fPasswordCheck && fName && fIdNumber /*&& fDate*/ 
				&& fEmail && fTelephone && fMobile) {
			if(member.getMemberType() == MemberType.O) {
				if( fOrgFounder && fOrgCeo && fOrgContactPerson 
						&& fOrgContactPersonTel && fOrgContactPersonMobile && fOrgWebsiteLink) {
					try {
						String encode = encoder.encode(passwordNew);
						log.debug("encode={}",encode);
						member.setPassword(encode);
						
						Member updatedMember = memberService.update(member);
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
			}else if(member.getMemberType() == MemberType.P){
				try {
					String encode = encoder.encode(passwordNew);
					log.debug("encode={}",encode);
					member.setPassword(encode);
					
					Member updatedMember = memberService.update(member);
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
		}else {
			response.addMessage("資料有誤");
		}
		return response;
	}
	
	@RequestMapping("/changePassword")
	@ResponseBody
	public String passwordChange(@RequestParam("password") String password){
		Member userDetails = (Member) SecurityContextHolder.getContext()  
							.getAuthentication()  
							.getPrincipal();
		String encodeDB = (memberService.getOne(userDetails.getId())).getPassword();
		//檢查舊密碼是否正確，與資料庫相符
		String result = "密碼輸入錯誤";
		log.debug("insertPassword={}",password);
		
//		String encodeOld = encoder.encode(password);
//		log.debug("encodeOld={}",encodeOld);
//		String encodeTest = encoder.encode(password);
//		log.debug("encodeTest={}",encodeTest);
		
		//確認輸入的密碼 與 轉碼後的隱碼 是否相符
		if(encoder.matches(password, encodeDB)) {
			result = "正確";
		}
		return result;
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
	
//	@ResponseBody
//	@RequestMapping("/update")
//	public AjaxResponse<Member> updateMember(Member member) {
//		log.debug("inputMember={}",member);			
//		AjaxResponse<Member> response = new AjaxResponse<Member>();
//		try {
//			Member updatedMember = memberService.update(member);
//			response.setObj(updatedMember);
//			log.debug("updatedMember={}",updatedMember);		
//			log.debug("資料更新成功");
//		} catch (Exception e) {
//			response.addMessage("資料更新失敗" + e.getMessage());
//			log.debug("資料更新失敗");
//		}
//		return 	response;
//	}
	
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
