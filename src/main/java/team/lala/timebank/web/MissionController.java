package team.lala.timebank.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import team.lala.timebank.commons.ajax.AjaxResponse;
import team.lala.timebank.commons.ajax.PageResponse;
import team.lala.timebank.entity.Member;
import team.lala.timebank.entity.Mission;
import team.lala.timebank.entity.Order;
import team.lala.timebank.entity.Requests;
import team.lala.timebank.service.MissionService;
import team.lala.timebank.service.RequestsService;
import team.lala.timebank.spec.MemberSpecification;
import team.lala.timebank.spec.MissionSpecification;
import team.lala.timebank.spec.OrderSpecification;
import team.lala.timebank.spec.RequestSpecification;

@Controller
@RequestMapping("/mission")
public class MissionController {

	@Autowired
	private MissionService missionService;

	@RequestMapping("/list")
	public String listPage(Model model) {

		return "/mission/mission_list";
	}

	@RequestMapping("/add")
	public String addPage() {

		return "/mission/mission_add";
	}

	@RequestMapping("/edit")
	public String editPage(@RequestParam("id") Long id, Model model) {
		Mission mission = missionService.getOne(id);
		model.addAttribute("mission", mission);
		return "/mission/mission_edit";
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
		// Requests r =requestsService.getOne(requests.getId());
		// r.setJobArea(requests.getJobArea());
		// r.setJobTitle(requests.getJobTitle());
		// r.setServiceType(requests.getServiceType());
		// r.setTermType(requests.getTermType());
		// r.setTimeValue(requests.getTimeValue());
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

	@RequestMapping("/query")
	@ResponseBody
	public List<Mission> query(Mission inputMission) {
		System.out.println("inputMission=" + inputMission);
		MissionSpecification missionSpecification = new MissionSpecification(inputMission);
		List<Mission> mission = missionService.findBySpecification(missionSpecification);
		System.out.println(mission);
		return mission;
	}
//	public PageResponse<Requests> query(Requests requests, @RequestParam("pageNumber") Integer pageNumber,
//			@RequestParam("pageSize") Integer pageSize) {
//		PageResponse<Requests> response = new PageResponse<Requests>();
//
//		try {
//			RequestSpecification requestSpecification = new RequestSpecification(requests);
//			PageRequest thisPage = PageRequest.of(pageNumber, pageSize);
//			Page<Requests> requestPage = requestsService.findBySpecification(requestSpecification, thisPage);
//			response.setPage(requestPage);
//		} catch (Exception e) {
//			response.addMessage("查詢失敗，" + e.getMessage());
//			e.printStackTrace();
//		}
//
//		return response;
//	}

}