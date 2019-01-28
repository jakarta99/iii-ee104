package team.lala.timebank.web.user.mission;

import java.io.File;
import java.io.FileOutputStream;
import java.security.Principal;
import java.time.LocalDate;
import java.time.ZoneId;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.extern.slf4j.Slf4j;
import team.lala.timebank.commons.ajax.AjaxResponse;
import team.lala.timebank.dao.MissionDao;
import team.lala.timebank.dao.OrderDao;
import team.lala.timebank.entity.Member;
import team.lala.timebank.entity.Mission;
import team.lala.timebank.entity.Order;
import team.lala.timebank.entity.ServiceType;
import team.lala.timebank.enums.MissionStatus;
import team.lala.timebank.enums.OrderStatus;
import team.lala.timebank.service.FacadeService;
import team.lala.timebank.service.MemberService;
import team.lala.timebank.service.MissionService;
import team.lala.timebank.service.OrderService;
import team.lala.timebank.service.ServiceTypeService;
import team.lala.timebank.service.SystemMessageService;
import team.lala.timebank.spec.MissionSpecification;
@Slf4j
@Controller
@RequestMapping("/user/missionPublish")
public class MissionPublishController {
	@Autowired
	private MissionDao missionDao;
	@Autowired
	private OrderService orderService;
	@Autowired
	private SystemMessageService systemMessageService;
	@Autowired
	private OrderDao orderDao;
	@Autowired
	private FacadeService facadeService;
	@Autowired
	private MissionService missionService;
	@Autowired
	private MemberService memberService;
	@Autowired
	private ServiceTypeService serviceTypeService;

	@RequestMapping("/add")
	public String addPage(Model model, Principal principal, @RequestParam(required = false) String response, @RequestParam(required = false) Long missionId) {
		
		List<ServiceType> serviceType = serviceTypeService.findAll();
		model.addAttribute("serviceType", serviceType);
		if(response != null) {
			model.addAttribute("res", response);
		}
		model.addAttribute("missionId", missionId);
		return "/basic/user/volunteerRecruitment/mission_add";
	}
	//刊登mission
	@RequestMapping(value = "/insert", method = RequestMethod.POST)
	public String insert(Mission mission, Principal principal,
			@RequestParam("missionPicture") MultipartFile missionPicture, HttpServletRequest request, Model model,
			RedirectAttributes attr, HttpSession session) {
		AjaxResponse<Mission> response = new AjaxResponse<Mission>();
		Member member = memberService.findByAccount(principal.getName());
		List<ServiceType> serviceType = serviceTypeService.findAll();
		model.addAttribute("serviceType", serviceType);
		model.addAttribute("mission", mission);
		model.addAttribute("response", response);
		Mission newMission = null;
		
		if(member.getBalanceValue() == null || mission.getTimeValue() == null) {
			member.setBalanceValue(0);
			mission.setTimeValue(0);
		}
		if(member.getBalanceValue().intValue() == 0 || mission.getTimeValue().intValue() == 0 || mission.getPeopleNeeded().intValue() == 0) {
			response.addMessage("資料有誤 無法刊登");
			log.debug("response={}", response.getMessages().toString());
			return "/basic/user/volunteerRecruitment/mission_add";
		}
		//使用額度超過member餘額 無法刊登
		if(member.getBalanceValue().intValue() >= mission.getTimeValue().intValue() * mission.getPeopleNeeded()) {
			//member可使用額度減少
			member.setBalanceValue(member.getBalanceValue().intValue() - mission.getTimeValue().intValue() * mission.getPeopleNeeded());
			missionService.insert(mission, principal);
		}else {
			response.addMessage("餘額不足 無法刊登");
			return "/basic/user/volunteerRecruitment/mission_add";
		}
		try {	
			if (missionPicture.getOriginalFilename().length() > 0) {
				// 取得應用程式根目錄中圖片之路徑
				String realPath = "C:proj\\" + "WEB-INF\\image\\user\\mission\\";
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
				newMission = missionService.insert(mission, principal);
			}
		} catch (Exception e) {
			response.addMessage("刊登失敗，" + e.getMessage());
			e.printStackTrace();
		}
		attr.addAttribute("response", "SUCCESS");
		session.setAttribute("missionId", newMission.getId());
		return "redirect:/user/missionPublish/add";
	}
	@RequestMapping("/test2")
	public void test() {
		//獲得到期的所有mission
		Mission inputMission = new Mission();
		inputMission.setMissionstatus(MissionStatus.B_AccountsPayable);
		inputMission.setAutoPayDate(new Date(new Date().getTime() + 1 * 24 * 60 * 60 * 1000));
		MissionSpecification missionSpec = new MissionSpecification(inputMission);
		List<Mission> missions = missionService.findBySpecification(missionSpec);
		//設定mission狀態
		for(Mission mission : missions) {
			//回復刊登任務時預扣值
			mission.getMember().setBalanceValue(mission.getMember().getBalanceValue() + (mission.getTimeValue() * mission.getPeopleNeeded()));
			//每個mission的order自動付款評分
			for(Order order : mission.getOrders()) {
				//付款評分 自動評5分
				facadeService.transaction(mission.getTimeValue(), order.getId(), 5);
			}
		}
	}
	@RequestMapping("/test1")
	public void test1() {
		Mission inputMission = new Mission();
		inputMission.setMissionstatus(MissionStatus.A_New);
		inputMission.setEndDate(new Date(new Date().getTime() + 1 * 24 * 60 * 60 * 1000));
		//搜尋A狀態以及活動到期的Mission
		MissionSpecification missionSpec = new MissionSpecification(inputMission);
		List<Mission> missions = missionService.findBySpecification(missionSpec);
		for(Mission mission : missions) {
			if(mission.getMember().getBalanceValue() == null) {
				mission.getMember().setBalanceValue(0);
			}
			//沒有人申請即取消
			if(mission.getOrders().size() == 0) {
				//加回原先MemberValue
				mission.getMember().setBalanceValue(mission.getMember().getBalanceValue() + mission.getTimeValue() * mission.getPeopleNeeded());
				mission.setMissionstatus(MissionStatus.C_Cancel);
				systemMessageService.missionCancel(mission);
			}else {
				//申請狀態為apply 即取消
				List<Order> cancelOrders = orderDao.findByMissionAndOrderStatus(mission, OrderStatus.VolunteerApply);
				//申請狀態為accept 即轉為FinishNotPay
				List<Order> acceptOrders = orderDao.findByMissionAndOrderStatus(mission, OrderStatus.RequesterAcceptService);
				if(acceptOrders.size() == 0 ){
					mission.setMissionstatus(MissionStatus.C_Cancel);
					mission.getMember().setBalanceValue(mission.getMember().getBalanceValue() + (mission.getTimeValue() * mission.getPeopleNeeded()));
					systemMessageService.missionCancel(acceptOrders);
					systemMessageService.missionCancel(mission);
				} else {
					for(Order order : acceptOrders) {
						order.setOrderStatus(OrderStatus.ServiceFinishNotPay);
					}
					orderDao.saveAll(acceptOrders);
					log.debug("setValue={}",mission.getMember().getBalanceValue() + (mission.getTimeValue() * mission.getPeopleNeeded()));
					mission.getMember().setBalanceValue(mission.getMember().getBalanceValue() + (mission.getTimeValue() * mission.getPeopleNeeded()));
					mission.setMissionstatus(MissionStatus.B_AccountsPayable);
				}
				if(cancelOrders.size() != 0) {
					systemMessageService.missionCancel(cancelOrders);
					orderService.rejectOrders(cancelOrders);
				}
				
			}
		}
		missionDao.saveAll(missions);
		
	}
}
