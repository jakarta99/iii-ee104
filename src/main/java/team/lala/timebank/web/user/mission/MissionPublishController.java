package team.lala.timebank.web.user.mission;

import java.io.File;
import java.io.FileOutputStream;
import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import lombok.extern.slf4j.Slf4j;
import team.lala.timebank.commons.ajax.AjaxResponse;
import team.lala.timebank.entity.Member;
import team.lala.timebank.entity.Mission;
import team.lala.timebank.entity.ServiceType;
import team.lala.timebank.service.MemberService;
import team.lala.timebank.service.MissionService;
import team.lala.timebank.service.ServiceTypeService;
@Slf4j
@Controller
@RequestMapping("/user/missionPublish")
public class MissionPublishController {
	@Autowired
	private MissionService missionService;
	@Autowired
	private MemberService memberService;
	@Autowired
	private ServiceTypeService serviceTypeService;

	@RequestMapping("/add")
	public String addPage(Model model, Principal principal) {
		
		List<ServiceType> serviceType = serviceTypeService.findAll();
		model.addAttribute("serviceType", serviceType);

		return "/basic/user/volunteerRecruitment/mission_add";
	}
	//刊登mission
	@RequestMapping(value = "/insert", method = RequestMethod.POST)
	public String insert(Mission mission, Principal principal,
			@RequestParam("missionPicture") MultipartFile missionPicture, HttpServletRequest request, Model model) {
		AjaxResponse<Mission> response = new AjaxResponse<Mission>();
		Member member = memberService.findByAccount(principal.getName());
		List<ServiceType> serviceType = serviceTypeService.findAll();
		model.addAttribute("serviceType", serviceType);
		model.addAttribute("mission", mission);
		model.addAttribute(response);
		log.debug("member.getBalanceValue()={}",member.getBalanceValue());
		
		if(member.getBalanceValue() == null || mission.getTimeValue() == null) {
			member.setBalanceValue(0);
			mission.setTimeValue(0);
			log.debug("member.getBalanceValue()={}",member.getBalanceValue());
			return "/basic/user/volunteerRecruitment/mission_add";
		}else if(member.getBalanceValue().intValue() == 0 || mission.getTimeValue().intValue() == 0) {
			response.addMessage("餘額不足 無法刊登");
			return "/basic/user/volunteerRecruitment/mission_add";
		}
		//使用額度超過member餘額 無法刊登
		if(member.getBalanceValue().intValue() >= mission.getTimeValue().intValue()) {
			//member可使用額度減少
			member.setBalanceValue(member.getBalanceValue().intValue() - mission.getTimeValue().intValue());
			missionService.insert(mission, principal);
		}else {
			return "/basic/user/volunteerRecruitment/mission_add";
		}
		try {	
			if (missionPicture.getOriginalFilename().length() > 0) {
				// 取得應用程式根目錄中圖片之路徑
				String realPath = request.getServletContext().getRealPath("/") + "WEB-INF\\image\\user\\mission\\";
				System.out.println(realPath + "***************************");
				// 確認是否有此資料夾，如無則建資料夾
				File dir = new File(realPath);
				if (!dir.exists()) {
					dir.mkdirs();
				}
				// 檔名
				String location = realPath + "missionPicture_" + mission.getId() + ".jpg";
				// 寫出檔案到Server
				FileOutputStream fos = new FileOutputStream(location);
				fos.write(missionPicture.getBytes());
				fos.close();
				// 將檔名存入DB
				mission.setMissionPicName("missionPicture_" + mission.getId() + ".jpg");
				missionService.insert(mission, principal);
			}
		} catch (Exception e) {
			response.addMessage("刊登失敗，" + e.getMessage());
			e.printStackTrace();
		}
		return "/basic/user/volunteerRecruitment/mission_add";
	}

}
