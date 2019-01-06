package team.lala.timebank.web.user;

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
import team.lala.timebank.enums.SystemMessageType;
import team.lala.timebank.service.MissionService;
import team.lala.timebank.service.OrderService;
import team.lala.timebank.service.ServiceTypeService;
import team.lala.timebank.service.SystemMessageService;
import team.lala.timebank.spec.MissionSpecification;

@Slf4j
@RequestMapping("/user/volunteerRecruitment")
@Controller
public class RecruitController {

	@Autowired
	private ServiceTypeService serviceTypeService;
	@Autowired
	private MissionService missionService;
	@Autowired
	private OrderService orderService;
	@Autowired
	private SystemMessageService systemMessageService;

	@RequestMapping("/list")
	public String listPage() {

		return "/basic/user/volunteerRecruitment/mission_list";
	}

	@RequestMapping("/query")
	@ResponseBody
	public Page<Mission> getMemberMission(Mission inputMission, Principal principal,
			@RequestParam(value = "page", required = false) Optional<Integer> page,
			@RequestParam(value = "length", required = false) Optional<Integer> length) {

		Page<Mission> missions = missionService.findByMemberAndSpecification(principal, inputMission,
				PageRequest.of(page.orElse(0), length.orElse(10)));
		return missions;
	}

	// 編輯mission並發送系統訊息
	@RequestMapping("/edit")
	public String editRecruit(@RequestParam("id") Long id, Model model) {
		Mission mission = missionService.getOne(id);
		List<ServiceType> serviceType = serviceTypeService.findAll();
		model.addAttribute("mission", mission);
		model.addAttribute("serviceType", serviceType);
		return "/basic/user/volunteerRecruitment/mission_edit";
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

	// 取消mission並拒絕所有apply的order
	@RequestMapping("/cancel")
	@ResponseBody
	public AjaxResponse<Mission> cancel(@RequestParam("id") Long id) {
		AjaxResponse<Mission> response = new AjaxResponse<Mission>();
		try {

			response.setObj(missionService.getOne(id));
			// 取消訂單  更改mission狀態為5
			missionService.cancelMission(id);
			

		} catch (Exception e) {
			response.addMessage("取消失敗，" + e.getMessage());

			e.printStackTrace();
		}
		return response;
	}

	@RequestMapping("/recruiting")
	@ResponseBody
	public Page<Mission> recruiting(Mission inputMission, Principal principal,
			@RequestParam(value = "start", required = false) Optional<Integer> start,
			@RequestParam(value = "length", required = false) Optional<Integer> length) {
		int page = start.orElse(0) / length.orElse(10);

		Page<Mission> missions = missionService.findByMember(principal, inputMission,
				PageRequest.of(page, length.orElse(10)));
		return missions;
	}

	// 編輯mission並發送系統訊息
	@RequestMapping("/update")

	public String update(Mission mission, @RequestParam("missionPicture") MultipartFile missionPicture,
			HttpServletRequest request, Model model) {
		AjaxResponse<Mission> response = new AjaxResponse<Mission>();

		log.debug("mission.getMember()={}", mission.getMember());

		try {
			missionService.update(mission, missionPicture, request);
			List<Order> orders = orderService.findByMission(mission);
			systemMessageService.missionEdit(orders);
			response.addMessage("修改成功");
			
		} catch (Exception e) {
			response.addMessage("修改失敗，" + e.getMessage());
			e.printStackTrace();
		}

		return "/basic/user/volunteerRecruitment/mission_list";
	}

}
