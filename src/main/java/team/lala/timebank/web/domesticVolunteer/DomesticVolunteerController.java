package team.lala.timebank.web.domesticVolunteer;

import java.security.Principal;
import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import lombok.extern.slf4j.Slf4j;
import team.lala.timebank.commons.ajax.AjaxResponse;
import team.lala.timebank.entity.Mission;
import team.lala.timebank.entity.Order;
import team.lala.timebank.entity.ServiceType;
import team.lala.timebank.entity.SystemMessage;
import team.lala.timebank.enums.MissionStatus;
import team.lala.timebank.enums.SystemMessageType;
import team.lala.timebank.service.MissionService;
import team.lala.timebank.service.OrderService;
import team.lala.timebank.service.ServiceTypeService;
import team.lala.timebank.service.SystemMessageService;
import team.lala.timebank.spec.MissionSpecification;

@Slf4j
@RequestMapping("/commons/domesticVolunteer")
@Controller
public class DomesticVolunteerController {

	@Autowired
	private ServiceTypeService serviceTypeService;
	@Autowired
	private MissionService missionService;
	@Autowired
	private OrderService orderService;
	@Autowired
	private SystemMessageService systemMessageService;

	@RequestMapping("/list")
	public String listPage(Model model) {

		return "/basic/commons/domesticVolunteer/volunteer_list";
	}

	@RequestMapping("/query")
	@ResponseBody
	public Page<Mission> query(Mission inputMission,
			@RequestParam(value = "start", required = false) Optional<Integer> start,
			@RequestParam(value = "length", required = false) Optional<Integer> length) {

		log.debug("inputMission={}", inputMission);
		int page = start.orElse(0) / length.orElse(10);

		Page<Mission> missions = missionService.findByStatusAndSpecification(inputMission,
				PageRequest.of(page, length.orElse(10)));

		return missions;
	}

}
