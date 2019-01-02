package team.lala.timebank.web.user;

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
		log.debug("missionPicture={}",missionPicture);
		try {
			mission = missionService.insertMissionAndPicture(missionPicture, mission, request);
			response.addMessage("新增成功");
			model.addAttribute(response);
		} catch (Exception e) {
			response.addMessage("新增失敗，" + e.getMessage());
			e.printStackTrace();
			model.addAttribute(response);
		}
		return "/basic/user/volunteerRecruitment/mission_list";
	}

}
