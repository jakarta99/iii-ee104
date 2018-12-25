package team.lala.timebank.web.user;

import java.security.Principal;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.extern.slf4j.Slf4j;
import team.lala.timebank.entity.Mission;
import team.lala.timebank.entity.ServiceType;
import team.lala.timebank.service.MissionService;
import team.lala.timebank.service.ServiceTypeService;
import team.lala.timebank.spec.MissionSpecification;

@Slf4j
@RequestMapping("/user/volunteerRecruitment")
@Controller
public class RecruitFinishController {

	@Autowired
	private ServiceTypeService serviceTypeService;
	@Autowired
	private MissionService missionService;

	@RequestMapping("/list")
	public String listPage() {

		return "/basic/user/volunteerRecruitment/mission_list";
	}

	@RequestMapping("/query")
	@ResponseBody
	public Page<Mission> getMemberMission(Mission inputMission, Principal principal,
			@RequestParam(value = "start", required = false) Optional<Integer> start,
			@RequestParam(value = "length", required = false) Optional<Integer> length) {
		int page = start.orElse(0) / length.orElse(10);

		MissionSpecification missionSpec = new MissionSpecification(
				missionService.setMemberId(principal, inputMission));
		Page<Mission> missions = missionService.findBySpecification(missionSpec,
				PageRequest.of(page, length.orElse(10)));
		return missions;
	}

	@RequestMapping("/edit")
	public String editRecruit(@RequestParam("id") Long id, Model model) {
		Mission mission = missionService.getOne(id);
		List<ServiceType> serviceType = serviceTypeService.findAll();
		model.addAttribute("mission", mission);
		model.addAttribute("serviceType", serviceType);
		return "/basic/user/volunteerRecruitment/mission_edit";
	}



}
