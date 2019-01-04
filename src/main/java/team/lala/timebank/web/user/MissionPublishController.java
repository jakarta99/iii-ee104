package team.lala.timebank.web.user;

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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import lombok.extern.slf4j.Slf4j;
import team.lala.timebank.commons.ajax.AjaxResponse;
import team.lala.timebank.entity.Mission;
import team.lala.timebank.entity.ServiceType;
import team.lala.timebank.service.MissionService;
import team.lala.timebank.service.ServiceTypeService;
@Slf4j
@Controller
@RequestMapping("/user/missionPublish")
public class MissionPublishController {
	@Autowired
	private MissionService missionService;

	@Autowired
	private ServiceTypeService serviceTypeService;

	@RequestMapping("/add")
	public String addPage(Model model, Principal principal) {
		
		List<ServiceType> serviceType = serviceTypeService.findAll();
		model.addAttribute("serviceType", serviceType);

		return "/basic/user/volunteerRecruitment/mission_add";
	}

	@RequestMapping(value = "/insert", method = RequestMethod.POST)
	public String insert(Mission mission, Principal principal,
			@RequestParam("missionPicture") MultipartFile missionPicture, HttpServletRequest request, Model model) {
		AjaxResponse<Mission> response = new AjaxResponse<Mission>();
		try {
			missionService.insert(mission, principal);
			response.addMessage("新增成功");
			model.addAttribute(response);
			if (missionPicture.getOriginalFilename().length() > 0) {
				// 取得應用程式根目錄中圖片之路徑
				String realPath = request.getServletContext().getRealPath("/") + "..\\resources\\static\\img\\";
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
			response.addMessage("新增失敗，" + e.getMessage());
			e.printStackTrace();
			model.addAttribute(response);
		}
		return "/basic/user/volunteerRecruitment/mission_list";
	}

}
