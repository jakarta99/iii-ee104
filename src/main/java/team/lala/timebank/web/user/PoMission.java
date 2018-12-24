package team.lala.timebank.web.user;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import team.lala.timebank.commons.ajax.AjaxResponse;
import team.lala.timebank.entity.Mission;
import team.lala.timebank.entity.ServiceType;
import team.lala.timebank.service.MemberService;
import team.lala.timebank.service.MissionService;
import team.lala.timebank.service.ServiceTypeService;

@Controller
@RequestMapping("/member/volunteerRecruitment")
public class PoMission {
	@Autowired
	private MissionService missionService;

	@Autowired
	private ServiceTypeService serviceTypeService;
	
	@Autowired
	private MemberService  memberService;

	@RequestMapping("/add")
	public String addPage(Model model,Principal principal) {
		
		
		
		
		
		List<ServiceType> serviceType = serviceTypeService.findAll();
		model.addAttribute("serviceType", serviceType);
		
		return "/admin/mission/mission_add";
	}

	@RequestMapping("/insert")
	@ResponseBody
	public AjaxResponse<Mission> insert(Mission mission) {
		AjaxResponse<Mission> response = new AjaxResponse<Mission>();

		try {
			missionService.insert(mission);
			response.setObj(mission);
		} catch (Exception e) {
			response.addMessage("新增失敗，" + e.getMessage());
			e.printStackTrace();
		}
		return response;
	}

}
