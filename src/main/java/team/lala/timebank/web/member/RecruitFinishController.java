package team.lala.timebank.web.member;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import team.lala.timebank.entity.Mission;
import team.lala.timebank.service.MissionService;

@RequestMapping("/user/RecruitFinish")
@Controller
public class RecruitFinishController {

	@Autowired
	private MissionService missionService;

	@RequestMapping("/list")
	@ResponseBody
	public void getAllRecruit(Principal principal, Model model) {
		List<Mission> missions = missionService.findByMemberAccount(principal);
		model.addAttribute(missions);
	}
	
	@RequestMapping("/edit")
	public void editRecruit(Mission inputMission) {
		Mission mission = missionService.findByMissionId(inputMission.getId());
		missionService.update(mission);
		
	}
	
	
	
}
