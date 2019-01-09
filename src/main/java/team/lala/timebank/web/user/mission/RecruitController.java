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

import lombok.extern.slf4j.Slf4j;
import team.lala.timebank.commons.ajax.AjaxResponse;
import team.lala.timebank.entity.Member;
import team.lala.timebank.entity.Mission;
import team.lala.timebank.entity.Order;
import team.lala.timebank.entity.ServiceType;
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
	public String listPage() {

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
	public String editRecruit(@RequestParam("id") Long id, Model model, HttpServletRequest request) {
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


	// 編輯mission並發送系統訊息
	@RequestMapping("/update")

	public String update(Mission mission, @RequestParam("missionPicture") MultipartFile missionPicture,
			HttpServletRequest request, Principal principal, Model model) {
		AjaxResponse<Mission> response = new AjaxResponse<Mission>();

		try {
			missionService.update(mission);
			List<Order> orders = orderService.findByMission(mission);
			systemMessageService.missionEdit(orders);
			if (missionPicture.getOriginalFilename().length() > 0) {
				// 取得應用程式根目錄中圖片之路徑
				String realPath = request.getServletContext().getRealPath("/") + "WEB-INF\\image\\user\\mission\\";
				System.out.println(realPath + "***************************");
				// 確認是否有此資料夾，如無則建資料夾
				File dir = new File(realPath);
				if (!dir.exists()) {
					dir.mkdirs();
				}
				// 檔名
				String location = realPath + "missionPicture_" + mission.getId() + ".jpg";

				// 寫出檔案到Server
				FileOutputStream fos = new FileOutputStream(location);
				fos.write(missionPicture.getBytes());
				fos.close();

				// 將檔名存入DB
				mission.setMissionPicName("missionPicture_" + mission.getId() + ".jpg");
				missionService.insert(mission, principal);
			}
			response.addMessage("修改成功");
		} catch (Exception e) {
			response.addMessage("修改失敗，" + e.getMessage());
			e.printStackTrace();
		}

		return "/basic/user/volunteerRecruitment/mission_list";
	}
	
	@RequestMapping("/insert")
	@ResponseBody
	public AjaxResponse<Mission> insertOrder (Principal principal, @RequestParam("missionId") Long missionId) {
		AjaxResponse<Mission> response = new AjaxResponse<Mission>();
		try {
			Mission mission = missionService.getOne(missionId);
			//刊登者與申請者相同時 申請失敗
			
			if(!principal.getName().equals(mission.getMember().getAccount())) {
				Member member = memberService.findByAccount(principal.getName());
				orderService.insert(mission, member);
				response.addMessage("申請成功");
			}else {
				response.addMessage("申請者不得與刊登者為相同帳戶");
			}
		}catch(Exception e) {
			response.addMessage("申請失敗");
		}
		return response;
	}
}
