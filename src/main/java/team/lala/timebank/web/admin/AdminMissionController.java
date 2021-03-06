package team.lala.timebank.web.admin;

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
import team.lala.timebank.commons.ajax.AjaxResponse;
import team.lala.timebank.entity.Mission;
import team.lala.timebank.entity.ServiceType;
import team.lala.timebank.service.MissionService;
import team.lala.timebank.service.ServiceTypeService;
import team.lala.timebank.spec.MissionSpecification;

@Slf4j
@Controller
@RequestMapping("/admin/mission")
public class AdminMissionController {

	@Autowired
	private MissionService missionService;

	@Autowired
	private ServiceTypeService serviceTypeService;

	@RequestMapping("/list")
	public String listPage(Model model) {

		return "/admin/mission/mission_list";
	}

	@RequestMapping("/add")
	public String addPage(Model model) {
		List<ServiceType> serviceType = serviceTypeService.findAll();
		model.addAttribute("serviceType", serviceType);
		return "/admin/mission/mission_add";
	}

	@RequestMapping("/edit")
	public String editPage(@RequestParam("id") Long id, Model model) {
		Mission mission = missionService.getOne(id);
		List<ServiceType> serviceType = serviceTypeService.findAll();
		model.addAttribute("mission", mission);
		model.addAttribute("serviceType", serviceType);

		return "/admin/mission/mission_edit";
	}

	@RequestMapping("/delete")
	@ResponseBody
	public AjaxResponse<Mission> deletePage(@RequestParam("id") Long id) {
		AjaxResponse<Mission> response = new AjaxResponse<Mission>();

		try {
			response.setObj(missionService.getOne(id));
			missionService.delete(id);

		} catch (Exception e) {
			response.addMessage("刪除失敗，" + e.getMessage());

			e.printStackTrace();
		}
		return response;
	}

	@RequestMapping("/update")
	@ResponseBody
	public AjaxResponse<Mission> update(Mission mission) {
		AjaxResponse<Mission> response = new AjaxResponse<Mission>();

		try {
			missionService.update(mission);
			response.setObj(mission);
		} catch (Exception e) {
			response.addMessage("修改失敗，" + e.getMessage());
			e.printStackTrace();
		}

		return response;
	}

	@RequestMapping("/insert")
	@ResponseBody
	public AjaxResponse<Mission> insert(Mission mission, Principal principal) {
		AjaxResponse<Mission> response = new AjaxResponse<Mission>();

		try {
			missionService.insert(mission, principal);
			response.setObj(mission);
		} catch (Exception e) {
			response.addMessage("新增失敗，" + e.getMessage());
			e.printStackTrace();
		}
		return response;
	}

//	@RequestMapping("/query")
//	@ResponseBody
//	public List<Mission> query(Mission inputMission) {
//		System.out.println("inputMission=" + inputMission);
//		MissionSpecification missionSpecification = new MissionSpecification(inputMission);
//		List<Mission> mission = missionService.findBySpecification(missionSpecification);
//		System.out.println(mission);
//		return mission;
//	}

	@RequestMapping("/querypage")
	@ResponseBody
	public Page<Mission> query(Mission inputMission,
			@RequestParam(value = "start", required = false) Optional<Integer> start,
			@RequestParam(value = "length", required = false) Optional<Integer> length) {
		
		log.debug("inputMission={}",inputMission);
		int page = start.orElse(0) / length.orElse(10);
		MissionSpecification missionSpec = new MissionSpecification(inputMission);
		Page<Mission> missions = missionService.findBySpecification(missionSpec,
				PageRequest.of(page, length.orElse(10)));

		return missions;
	}

}
