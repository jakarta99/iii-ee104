package team.lala.timebank.web.commons;

import java.security.Principal;
import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.microsoft.sqlserver.jdbc.StringUtils;

import lombok.extern.slf4j.Slf4j;
import team.lala.timebank.entity.Member;
import team.lala.timebank.entity.Mission;
import team.lala.timebank.entity.MyCollection;
import team.lala.timebank.enums.MyCollectionType;
import team.lala.timebank.enums.YesNo;
import team.lala.timebank.service.MemberService;
import team.lala.timebank.service.MissionService;
import team.lala.timebank.service.MyCollectionService;
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
	@Autowired
	private MyCollectionService myCollectionService;

	@RequestMapping("/list")
	public String listPage(Model model, @RequestParam(required = false) String missionId) {
		if (!StringUtils.isEmpty(missionId)) {
			model.addAttribute("missionId", missionId);
		}

		return "/basic/commons/domesticVolunteer/volunteer_list";
	}

	@RequestMapping("/query")
	@ResponseBody
	public Page<Mission> query(Mission inputMission,
			@RequestParam(value = "page", required = false) Optional<Integer> page,
			@RequestParam(value = "length", required = false) Optional<Integer> length, Principal principal) {

		log.debug("inputMission={}", inputMission);

		log.debug("page={}", page);
		List<Mission> missionList = missionService.findByStatusAndSpecification(inputMission);
		if (principal != null) {
			List<MyCollection> myCollections = myCollectionService
					.findByMyCollectionTypeAndMemberAccount(MyCollectionType.MISSION, principal.getName());
			// log.debug("myCollections={}",myCollections);

			for (Mission mission : missionList) {
				for (MyCollection myCollect : myCollections) {
					if (myCollect.getFavoriteObjectId() == mission.getId()) {
						mission.setIsCollected(YesNo.Y);
						log.debug("mission={}", mission);
					}
				}

			}
		}

		// List<User> users = userService.findAllByProgramId(programId);
		//
		Sort sort = new Sort(Sort.Direction.DESC, "publishDate");
		Page<Mission> missionPage = missionService.findByStatusAndSpecification(inputMission,
				PageRequest.of(page.orElse(0), length.orElse(10),sort));

		return missionPage;
	}

	@RequestMapping("/apply")
	public String missionDetail(@RequestParam(required = false) String apply, @RequestParam Long missionId, Model model,
			HttpServletRequest request) {

		Mission mission = missionService.getOne(missionId);
		Member member = memberService.findByAccount(mission.getMember().getAccount());
		model.addAttribute("mission", mission);
		model.addAttribute("member", member);
		if (!StringUtils.isEmpty(apply)) {
			model.addAttribute("applying", apply);
		}

		return "/basic/commons/domesticVolunteer/applyPage";
	}

}
