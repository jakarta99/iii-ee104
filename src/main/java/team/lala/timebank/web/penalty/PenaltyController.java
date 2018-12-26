package team.lala.timebank.web.penalty;

import java.io.IOException;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import lombok.extern.slf4j.Slf4j;
import team.lala.timebank.commons.ajax.AjaxResponse;
import team.lala.timebank.entity.Member;
import team.lala.timebank.entity.Order;
import team.lala.timebank.entity.Penalty;
import team.lala.timebank.service.OrderService;
import team.lala.timebank.service.PenaltyService;
import team.lala.timebank.service.SystemMessageService;
import team.lala.timebank.service.TimeLedgerService;
import team.lala.timebank.spec.OrderSpecification;
import team.lala.timebank.spec.PenaltySpecification;

@Slf4j
@Controller
@RequestMapping("/penalty")
@SessionAttributes(names= {"reportOnePenalty"})
public class PenaltyController {

	@Autowired
	private PenaltyService penaltyService;
	
	@Autowired
	private TimeLedgerService timeLedgerService;
	
	@Autowired
	private OrderService orderService;

	@Autowired
	private SystemMessageService systemMessageService;
	//basic/user
	//模擬檢視會員媒合清單(開發debug用，之後要刪)
	@RequestMapping("/tempPenaltyEntrance")
	public String listPage() {
		return "/basic/user/penalty/temp_order_list"; // getRequestDispatcher("/WEB-INF/jsp/order_list.jsp").forward(request,
									// response);
	}
	
	//模擬檢視會員媒合清單(開發debug用，之後要刪)
	@RequestMapping("/tempOrders")
	@ResponseBody
	public Page<Order> queryOrder(Order inputOrder, @RequestParam(value="start",required=false) Optional<Integer> start, 
			@RequestParam(value="length",required=false) Optional<Integer> length) {
		int page = start.orElse(0)/length.orElse(10);
		OrderSpecification orderSpec = new OrderSpecification(inputOrder);
		Page<Order> orders = orderService.findBySpecification(
				orderSpec, PageRequest.of(page, length.orElse(10)));
		System.out.println("orders={}"+orders );
		log.debug("orders={}", orders );
		return orders;
	}
	
	
	
	//針對order按檢舉按鍵後，呼叫這支(放文件提醒)
	@RequestMapping("/report")
	public String report(@RequestParam("orderId")Long orderId, Model model) {  

		//1.取出目前登入之會員id，做為檢舉者id
		Member userDetails = (Member) SecurityContextHolder.getContext()  
					.getAuthentication()  
					.getPrincipal();
		Long accuserId = userDetails.getId();
		
		//2.判斷是否已被檢舉過。如已被檢舉過，則回傳無法檢舉的資訊並且導回原頁面
		Penalty penalty = penaltyService.checkRecordandProvidePenalty(orderId, accuserId);
		
		if(penalty == null) {
			model.addAttribute("penaltyExist", orderId + "號媒合案件已有您的檢舉紀錄，不得重複提出檢舉");
			return "/basic/user/penalty/temp_order_list";
		}
		
		//3.如果未被檢舉過，則將需要顯示在檢舉頁面的資料放入model
		model.addAttribute("reportBasicData",penalty);
//		Map<String, Object> reportBasicData = penaltyService.getAccuserAndDefendant(orderId, accuserId);
//		if(reportBasicData != null && reportBasicData.size() != 0) {
//			
//		}
		return "/basic/user/penalty/violation_report";
	}
	
	//提出檢舉時呼叫的方法
	@RequestMapping(value="/doReport", method = RequestMethod.POST)
	public String doReport(Penalty penalty, Model model) {

		penalty = penaltyService.save(penalty);
		model.addAttribute("reportOnePenalty", penalty);

		return "redirect:/penalty/my-report-list";
	}
	
	//檢舉成功
	@RequestMapping("/my-report-list")
	public String showReportList() {
		return "/basic/user/penalty/my_report_list";
	}
	
	//*************************************************
	
	//跳轉審查列表
	@RequestMapping("/showVertifyList")
	public String showVertifyList() {
		return "/basic/user/penalty/vertify/vertify_report_list";
	}
	
	//查出所有待審查列表
	@RequestMapping("/getVertifyList")
	@ResponseBody
	public Page<Penalty> getVertifyList(Penalty inputPenalty, @RequestParam(value="start",required=false) Optional<Integer> start, 
			@RequestParam(value="length",required=false) Optional<Integer> length) {
		int page = start.orElse(0)/length.orElse(10);
		log.debug("inputPenalty={}", inputPenalty);
		PenaltySpecification penaltySpec = new PenaltySpecification(inputPenalty);
		Page<Penalty> penalties = penaltyService.findBySpecification(
				penaltySpec, PageRequest.of(page, length.orElse(10)));
		log.debug("PenaltiesSize={}", penalties.getSize());
		return penalties;
	}
	
	//點選個案後呼叫此controller，進入個案審查畫面
	@RequestMapping("/vertify")
	public String vertify(@RequestParam("id") Long id, Model model) {
		Penalty penalty = penaltyService.getOne(id);
		model.addAttribute("penalty", penalty);
		return "/basic/user/penalty/vertify/penalty_vertifying";
	}
	
	//呼叫審查service(扣違規會員時數)，完成審查(update成功)後跳出成功對話框(SUCCESS)，轉回所有待審查清單
	@RequestMapping("/doneVertify")
	@ResponseBody
	public AjaxResponse<Penalty> doneVertify(@RequestParam("penaltyId") Long penaltyId, 
			@RequestParam("status") Integer status, @RequestParam("penaltyTimeValue") Integer penaltyTimeValue, 
			@RequestParam("vertifyReason") String vertifyReason) {
		AjaxResponse<Penalty> ajaxResponse = new AjaxResponse<Penalty>();
		
		try {
			//完成檢舉案件審核，結果存入DB
			Penalty penalty = penaltyService.vertifyPenalty(penaltyId, status, penaltyTimeValue, vertifyReason);
			
			//寄站內信通知原告
			
			//如果審核結果為2(需懲罰)，才進行被檢舉人帳戶扣款
			if(status==2) {
				timeLedgerService.doPenaltyDebit(penalty);
			}
			
			//寄站內信通知被告
			
			ajaxResponse.setObj(penalty);
		} catch (Exception e) {
			ajaxResponse.addMessage(e.getMessage());
			e.printStackTrace();
		}
		return ajaxResponse;
	}
	

	
	//將佐證圖片存至Server
	@RequestMapping("/storeProofPic")
	public String storeProofPic(@RequestParam("proofPic") MultipartFile proofPic, @RequestParam("penaltyId") Long penaltyId) throws IOException {
		
		log.debug("pictureName={}", proofPic.getOriginalFilename());
		
		//如果有上傳圖片，才存檔案到Server，及存路徑到DB
		if(proofPic.getOriginalFilename().length() > 0) {
			Boolean result = penaltyService.storeProofPic(proofPic, penaltyId);
		}
		
		//待處理:上傳檔案類型，判斷副檔名。
		
		return "redirect:/penalty/tempPenaltyEntrance";//回傳上傳成功與否之資訊
	}

	
	
	
	
	
	
	
	
	
	//測試直接從登入資訊中取得會員id
	@RequestMapping("/test")
	public void showMember() {
		Member userDetails = (Member) SecurityContextHolder.getContext()  
			    					.getAuthentication()  
			    					.getPrincipal();  
			  
		log.debug("USERNAME={}", userDetails.getUsername());
		log.debug("USERID={}", userDetails.getId());
	}
	
	
	@RequestMapping("/add")
	public String add() {
		return "/admin/penalty/penalty_add";

	}

	@RequestMapping("/edit")
	public String edit(@RequestParam("id") Long id, Model model) {
		Penalty penalty = penaltyService.getOne(id);
		model.addAttribute("penalty", penalty);
		return "/admin/penalty/penalty_edit";

	}

	@RequestMapping("/update")
	@ResponseBody
	public AjaxResponse<Penalty> update(Penalty penalty, Model model) {
		AjaxResponse<Penalty> ajaxResponse = new AjaxResponse<Penalty>();
		try {
			ajaxResponse.setObj(penaltyService.update(penalty));
		} catch (Exception e) {
			ajaxResponse.addMessage(e.getMessage());
			e.printStackTrace();
		}
		return ajaxResponse;
	}

	@RequestMapping(value="/insert", method = RequestMethod.POST)
	@ResponseBody
	public AjaxResponse<Penalty> adminInsert(Penalty penalty) {
		log.debug("penalty={}", penalty);
		AjaxResponse<Penalty> ajaxResponse = new AjaxResponse<Penalty>();
		try {
			ajaxResponse.setObj(penaltyService.save(penalty));
		} catch (Exception e) {
			ajaxResponse.addMessage(e.getMessage());
			e.printStackTrace();
		}
		return ajaxResponse;
	}
	

	@ResponseBody
	@RequestMapping("/query")
	public Page<Penalty> queryPenalty(Penalty inputPenalty, @RequestParam(value="start",required=false) Optional<Integer> start, 
			@RequestParam(value="length",required=false) Optional<Integer> length) {
		int page = start.orElse(0)/length.orElse(10);
		PenaltySpecification penaltySpec = new PenaltySpecification(inputPenalty);
		Page<Penalty> penalties = penaltyService.findBySpecification(
				penaltySpec, PageRequest.of(page, length.orElse(10)));
		return penalties;

	}

}
