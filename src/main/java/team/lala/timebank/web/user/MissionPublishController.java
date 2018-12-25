package team.lala.timebank.web.user;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.extern.slf4j.Slf4j;
import team.lala.timebank.commons.ajax.AjaxResponse;
import team.lala.timebank.entity.Mission;
import team.lala.timebank.entity.ServiceType;
import team.lala.timebank.service.MemberService;
import team.lala.timebank.service.MissionService;
import team.lala.timebank.service.ServiceTypeService;
import team.lala.timebank.web.admin.AdminOrderController;
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

	@RequestMapping("/insert")
	@ResponseBody
	public AjaxResponse<Mission> insert(Mission mission, Principal principal) {
		AjaxResponse<Mission> response = new AjaxResponse<Mission>();

		try {
			mission=missionService.insert(mission, principal);
			log.debug("mission={}",mission);
			response.setObj(mission);
		} catch (Exception e) {
			response.addMessage("新增失敗，" + e.getMessage());
			e.printStackTrace();
		}
		return response;
	}

}
