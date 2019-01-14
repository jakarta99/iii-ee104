package team.lala.timebank.web.user.mission;

import java.io.File;
import java.io.FileOutputStream;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import lombok.extern.slf4j.Slf4j;
import team.lala.timebank.commons.ajax.AjaxResponse;
import team.lala.timebank.entity.Mission;
import team.lala.timebank.entity.Order;
import team.lala.timebank.entity.PayData;
import team.lala.timebank.entity.Penalty;
import team.lala.timebank.service.FacadeService;
import team.lala.timebank.service.MissionService;
import team.lala.timebank.service.OrderService;
import team.lala.timebank.service.PenaltyService;

@Slf4j
@Controller
@RequestMapping("/user/payTime")
public class PayTimeController {
	@Autowired
	private OrderService orderService;
	@Autowired
	private MissionService missionService;
	@Autowired
	private FacadeService facadeService;
	@Autowired
	private PenaltyService penaltyService;

	@RequestMapping("/list")
	public String listPage(@RequestParam(value = "id") Long missionId, Model model) {

		// Mission mission = missionService.getOne(id);
		// model.addAttribute("mission", mission);
		model.addAttribute("missionId", missionId);
		return "/basic/user/volunteerRecruitment/payTime";
	}

	@RequestMapping("/query")
	@ResponseBody
	public Page<Order> getOrderByMissionAndStatus(@RequestParam(value = "page", required = false) int page,
			@RequestParam(value = "length", required = false) Optional<Integer> length,
			@RequestParam(value = "missionId") Long id) {
		Mission mission = missionService.getOne(id);
		// Page<Mission> missions = missionService.findByAccount(principal,
		// inputMission, PageRequest.of(page, length.orElse(10)));
		Page<Order> orders = orderService.findByMission(mission, page, length);
		return orders;
	}

	// 會員付款
	@RequestMapping("/pay")
	@ResponseBody
	public AjaxResponse<Order> pay(@RequestParam("orderId") Long orderId, @RequestParam("hours") Integer hours,
			@RequestParam("score") Integer score) {
		log.debug("orderId={}", orderId);
		AjaxResponse<Order> response = new AjaxResponse<Order>();
		try {
			response.setObj(orderService.getById(orderId));

			facadeService.transaction(hours, orderId, score);

		} catch (Exception e) {
			response.addMessage("付款失敗，" + e.getMessage());

			e.printStackTrace();
		}
		return response;
	}

	@ResponseBody
	@RequestMapping("/report") // 雇主檢舉志工
	public AjaxResponse<Order> Report(@RequestParam(value = "orderId") Long orderId,
			@RequestParam(value = "description") String description, @RequestParam("proofPic") MultipartFile proofPic,
			MultipartHttpServletRequest request) {
		AjaxResponse<Order> response = new AjaxResponse<Order>();

		Penalty penalty = orderService.requesterReportVolunteer(orderId, description);

		try {
			if (proofPic.getOriginalFilename().length() > 0) {
				// 取得應用程式根目錄中圖片之路徑
				String realPath = request.getServletContext().getRealPath("/") + "WEB-INF\\image\\admin\\penalty\\";
				// 確認是否有此資料夾，如無則建資料夾
				File dir = new File(realPath);
				if (!dir.exists()) {
					dir.mkdirs();
				}
				// 檔名
				String location = realPath + "missionPicture_" + penalty.getId() + ".jpg";
				// 寫出檔案到Server
				FileOutputStream fos = new FileOutputStream(location);
				fos.write(proofPic.getBytes());
				fos.close();
				// 將檔名存入DB
				penalty.setProofPicName("penaltyPicture_" + penalty.getId() + ".jpg");
				penaltyService.save(penalty);
			}
		} catch (Exception e) {
			response.addMessage("修改失敗，" + e.getMessage());
			e.printStackTrace();
		}
		return response;
	}

	@ResponseBody
	@RequestMapping("/payAll")
	public AjaxResponse<Order> payAll(@RequestBody List<PayData> payDatas) {
		log.debug("payData={}",payDatas);
		AjaxResponse<Order> response = new AjaxResponse<Order>();
		try {	
			for (PayData payData : payDatas) {
				if (payData.getHours() != null && payData.getScore() != null) {
					log.debug("payData={}",payData);
					response.setObj(orderService.getById(payData.getOrderId()));
					facadeService.transaction(payData.getHours(), payData.getOrderId(), payData.getScore());					
				}
			}
		} catch (Exception e) {
			response.addMessage("付款失敗，" + e.getMessage());
			e.printStackTrace();
		}

		return response;
	}

}
