package team.lala.timebank.web.user.mission;

import java.io.File;
import java.io.FileOutputStream;
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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.extern.slf4j.Slf4j;
import team.lala.timebank.commons.ajax.AjaxResponse;
import team.lala.timebank.entity.Member;
import team.lala.timebank.entity.Mission;
import team.lala.timebank.entity.Order;
import team.lala.timebank.entity.ServiceType;
import team.lala.timebank.enums.OrderStatus;
import team.lala.timebank.service.MemberService;
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
	private MemberService memberService;
	@Autowired
	private ServiceTypeService serviceTypeService;
	@Autowired
	private MissionService missionService;
	@Autowired
	private OrderService orderService;
	@Autowired
	private SystemMessageService systemMessageService;

	@RequestMapping("/list")
	public String listPage(Model model, @RequestParam(value = "box", required = false) Integer box) {
		if (box != null) {
			if (box == 1) {
				model.addAttribute("box", "1");
			} else if (box == 2) {
				model.addAttribute("box", "2");
			} else if (box == 3) {
				model.addAttribute("box", "3");
			}
		}else {
			model.addAttribute("box", "4");
		}
		return "/basic/user/volunteerRecruitment/mission_list";
	}

	@RequestMapping("/detail")
	public String missionDetail(@RequestParam("id") Long missionId, Model model) {
		Mission mission = missionService.getOne(missionId);
		Member member = memberService.findByAccount(mission.getMember().getAccount());
		model.addAttribute("mission", mission);
		model.addAttribute("member", member);
		return "/basic/user/volunteerRecruitment/mission_detail";
	}

	@RequestMapping("/query")
	@ResponseBody
	public Page<Mission> getMemberMission(Mission inputMission, Principal principal,
			@RequestParam(value = "page", required = false) Optional<Integer> page,
			@RequestParam(value = "length", required = false) Optional<Integer> length) {

		inputMission.setMemberAccount(principal.getName());
		MissionSpecification missionSpec = new MissionSpecification(inputMission);

		Page<Mission> missions = missionService.findBySpecification(missionSpec,
				PageRequest.of(page.orElse(0), length.orElse(10)));
		return missions;
	}

	// 編輯mission並發送系統訊息
	@RequestMapping("/edit")
	public String editRecruit(@RequestParam("id") Long missionId, Model model, HttpServletRequest request, @RequestParam(required=false) String res) {
		Mission mission = missionService.getOne(missionId);
		List<ServiceType> serviceType = serviceTypeService.findAll();
		model.addAttribute("mission", mission);
		model.addAttribute("serviceType", serviceType);
		if(res != null) {
			if(res.equals("errorBalance")) {
				model.addAttribute("response", "額度有誤 更新失敗");
			}else {
				model.addAttribute("response", res);
			}
		}
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
			// 取消訂單 更改mission狀態為5
			missionService.cancelMission(id);

		} catch (Exception e) {
			response.addMessage("取消失敗，" + e.getMessage());

			e.printStackTrace();
		}
		return response;
	}

	// 編輯mission並發送系統訊息
	@RequestMapping("/update")

	public String update(Mission inputMission, @RequestParam("missionPicture") MultipartFile missionPicture,
			HttpServletRequest request, Principal principal, RedirectAttributes attr) {
		Member member = memberService.findByAccount(principal.getName());
		attr.addAttribute("id", inputMission.getId());
		Mission mission = missionService.getOne(inputMission.getId());
		if(member.getBalanceValue() == null || inputMission.getTimeValue() == null) {
			member.setBalanceValue(0);
			inputMission.setTimeValue(0);
		}
		//先加回刊登時扣除的額度
		member.setBalanceValue(member.getBalanceValue().intValue() + mission.getTimeValue().intValue() * mission.getPeopleNeeded());
		//使用額度超過member餘額 無法刊登
		if(member.getBalanceValue().intValue() >= inputMission.getTimeValue().intValue() * inputMission.getPeopleNeeded()) {
			//member可使用額度減少
			member.setBalanceValue(member.getBalanceValue().intValue() - inputMission.getTimeValue().intValue() * inputMission.getPeopleNeeded());
			missionService.insert(inputMission, principal);
		}else {
			//扣回原本的可使用額度
			member.setBalanceValue(member.getBalanceValue().intValue() - mission.getTimeValue().intValue() * mission.getPeopleNeeded());
			attr.addAttribute("res", "errorBalance");
			return "redirect:/user/volunteerRecruitment/edit";
		}
		try {
			missionService.update(inputMission);
			List<Order> orders = orderService.findByMission(inputMission);
			systemMessageService.missionEdit(orders);
			if (missionPicture.getOriginalFilename().length() > 0) {
				// 取得應用程式根目錄中圖片之路徑
				String realPath = request.getServletContext().getRealPath("/") + "WEB-INF\\image\\user\\mission\\";
				// 確認是否有此資料夾，如無則建資料夾
				File dir = new File(realPath);
				if (!dir.exists()) {
					dir.mkdirs();
				}
				// 檔名
				String location = realPath + "missionPicture_" + inputMission.getId() + ".jpg";

				// 寫出檔案到Server
				FileOutputStream fos = new FileOutputStream(location);
				fos.write(missionPicture.getBytes());
				fos.close();

				// 將檔名存入DB
				inputMission.setMissionPicName("missionPicture_" + inputMission.getId() + ".jpg");
				missionService.update(inputMission);
			}
		} catch (Exception e) {
			attr.addAttribute("res","errorException");
			e.printStackTrace();
		}
		attr.addAttribute("res", "SUCCESS");
		return "redirect:/user/volunteerRecruitment/edit";
		
	}

	@RequestMapping("/insert")
	@ResponseBody
	public AjaxResponse<Mission> insertOrder(Principal principal, @RequestParam("missionId") Long missionId) {

		AjaxResponse<Mission> response = new AjaxResponse<Mission>();
		try {
			Mission mission = missionService.getOne(missionId);
			
			//刊登者與申請者相同 申請失敗
			if(!mission.getMember().getAccount().equals(principal.getName())) {
				//已存在相同申請者 申請失敗
				for(Order order : mission.getOrders()) {
					if(order.getVolunteer().getAccount().equals(principal.getName())) {
						response.addMessage("不得重複申請");
						return response;
					}
				}
				//已接受的申請數量等於需求數量
				List<Order> acceptOrders = orderService.findByMissionAndOrderStatus(mission, OrderStatus.RequesterAcceptService);
				if(mission.getPeopleNeeded().equals(acceptOrders.size())) {
					response.addMessage("需求人數已滿");
					return response;
				}else {

				Member member = memberService.findByAccount(principal.getName());
				orderService.insert(mission, member);
			}
			}else {
				response.addMessage("不得申請自己的活動");
				return response;

			}
		}

		catch(Exception e) {
			e.printStackTrace();

			response.addMessage("申請失敗");
		}
		return response;
	}
}
