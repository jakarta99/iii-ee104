package team.lala.timebank.web.domesticVolunteer;

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
import team.lala.timebank.entity.Member;
import team.lala.timebank.entity.Mission;
import team.lala.timebank.service.MemberService;
import team.lala.timebank.service.MissionService;
import team.lala.timebank.service.ServiceTypeService;
import team.lala.timebank.service.SystemMessageService;

@Slf4j
@RequestMapping("/commons/domesticVolunteer")
@Controller
public class DomesticVolunteerController {

	@Autowired
	private ServiceTypeService serviceTypeService;
	@Autowired
	private MissionService missionService;
	@Autowired
	private MemberService memberService;
	@Autowired
	private SystemMessageService systemMessageService;

	@RequestMapping("/list")
	public String listPage(Model model) {

		return "/basic/commons/domesticVolunteer/volunteer_list";
	}

	@RequestMapping("/query")
	@ResponseBody
	public Page<Mission> query(Mission inputMission,
			@RequestParam(value = "page", required = false) Optional<Integer> page,
			@RequestParam(value = "length", required = false) Optional<Integer> length) {
	
		log.debug("inputMission={}", inputMission);

		log.debug("page={}", page);

		Page<Mission> missions = missionService.findByStatusAndSpecification(inputMission,
				PageRequest.of(page.orElse(0), length.orElse(10)));

		return missions;
	}
	
	@RequestMapping("/apply")
	public String missionDetail (@RequestParam Long missionId, Model model) {

		log.debug("inputMission={}", missionId);
		Mission mission = missionService.getOne(missionId);
		Member member = memberService.findByAccount(mission.getMember().getAccount());
		model.addAttribute("mission", mission);
		model.addAttribute("member", member);
		
		return "/basic/commons/domesticVolunteer/applyPage";
	}

}
