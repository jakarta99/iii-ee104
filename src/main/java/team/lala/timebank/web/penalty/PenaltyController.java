package team.lala.timebank.web.penalty;

import java.util.Map;
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

import lombok.extern.slf4j.Slf4j;
import team.lala.timebank.commons.ajax.AjaxResponse;
import team.lala.timebank.entity.Member;
import team.lala.timebank.entity.Penalty;
import team.lala.timebank.entity.TimeLedger;
import team.lala.timebank.service.PenaltyService;
import team.lala.timebank.service.TimeLedgerService;
import team.lala.timebank.spec.PenaltySpecification;

@Slf4j
@Controller
@RequestMapping("/penalty")
//@SessionAttributes(names= {"penalty"})
public class PenaltyController {

	@Autowired
	private PenaltyService penaltyService;
	
	@Autowired
	private TimeLedgerService timeLedgerService;

	@RequestMapping("/report")
	public String report(@RequestParam("orderId")Long orderId, @RequestParam("defendant") Long defendantId, Model model) {  
		//如果呼叫我的頁面可以直接送給我被檢舉的整個Order物件、原告被告的id與姓名，那我就不用呼叫getAccuserAndDefendant這支service了~
		//目前先假設最糟狀況--無法給我這些資訊，那麼至少要給我orderId與被告id
		
		//1.先判斷同一組order與defendant是否已被檢舉過。如已被檢舉過，則回傳無法檢舉的資訊並且導回原頁面
		
		
		//2.如果未被檢舉過，則將需要顯示在檢舉頁面的資料放入model
		Map<String, Object> reportBasicData = penaltyService.getAccuserAndDefendant(orderId, defendantId);
		if(reportBasicData != null && reportBasicData.size() != 0) {
			model.addAttribute("reportBasicData",reportBasicData);
		}
		return "/penalty/violation_report";
	}
	
	//提出檢舉時呼叫的方法
	@RequestMapping(value="/doReport", method = RequestMethod.POST)
	public String insert(Penalty penalty, Model model) {
//		log.debug("PUT BEFORE penalty={}", penalty);
		penalty = penaltyService.save(penalty);
		model.addAttribute("penalty", penalty);
//		log.debug("PUT AFTER penalty={}", penalty);
		return "redirect:/penalty/my-report-list";
	}
	
	//檢舉成功
	@RequestMapping("/my-report-list")
	public String showReportList() {
		return "/penalty/my_report_list";
	}
	
	//*************************************************
	
	//跳轉審查列表
	@RequestMapping("/showVertifyList")
	public String showVertifyList() {
		return "/penalty/vertify/vertify_report_list";
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
		return "/penalty/vertify/penalty_vertifying";
	}
	
	//呼叫審查service(扣違規會員時數)，完成審查(update成功)後跳出成功對話框(SUCCESS)，轉回所有待審查清單
	@RequestMapping("/doneVertify")
	@ResponseBody
	public AjaxResponse<Penalty> doneVertify(@RequestParam("penaltyId") Long penaltyId, 
			@RequestParam("status") Integer status, @RequestParam("penaltyTimeValue") Integer penaltyTimeValue) {
		AjaxResponse<Penalty> ajaxResponse = new AjaxResponse<Penalty>();
		
		try {
			//完成檢舉案件審核，結果存入DB
			Penalty penalty = penaltyService.vertifyPenalty(penaltyId, status, penaltyTimeValue);
			//如果審核結果為2(需懲罰)，才進行被檢舉人帳戶扣款
			if(status == 2) {
				timeLedgerService.doPenaltyDebit(penalty);
			}
			ajaxResponse.setObj(penalty);
		} catch (Exception e) {
			ajaxResponse.addMessage(e.getMessage());
			e.printStackTrace();
		}
		return ajaxResponse;
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
