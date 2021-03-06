package team.lala.timebank.web.admin;

import java.security.Principal;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import javax.servlet.http.HttpServletResponse;

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
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.itextpdf.text.pdf.PdfStamper;

import lombok.extern.slf4j.Slf4j;
import team.lala.timebank.commons.ajax.AjaxResponse;
import team.lala.timebank.commons.view.ExcelView;
import team.lala.timebank.commons.view.PdfView;
import team.lala.timebank.entity.Member;
import team.lala.timebank.entity.Order;
import team.lala.timebank.entity.Penalty;
import team.lala.timebank.service.OrderService;
import team.lala.timebank.service.PenaltyService;
import team.lala.timebank.service.TimeLedgerService;
import team.lala.timebank.spec.OrderSpecification;
import team.lala.timebank.spec.PenaltySpecification;

@Slf4j
@Controller
@RequestMapping("/admin/penaltyVertify")
@SessionAttributes(names = { "reportOnePenalty" })
public class PenaltyVertifyController {

	@Autowired
	private PenaltyService penaltyService;

	@Autowired
	private TimeLedgerService timeLedgerService;

	@Autowired
	private OrderService orderService;

	// Jasmine
	// 模擬檢視會員媒合清單(開發debug用，之後要刪)
	@RequestMapping("/tempPenaltyEntrance")
	public String listPage() {
		return "/basic/user/penalty/temp_order_list"; // getRequestDispatcher("/WEB-INF/jsp/order_list.jsp").forward(request,
		// response);
	}

	// Jasmine
	// 模擬檢視會員媒合清單(開發debug用，之後要刪)
	@RequestMapping("/tempOrders")
	@ResponseBody
	public Page<Order> queryOrder(Order inputOrder,
			@RequestParam(value = "start", required = false) Optional<Integer> start,
			@RequestParam(value = "length", required = false) Optional<Integer> length) {
		int page = start.orElse(0) / length.orElse(10);
		OrderSpecification orderSpec = new OrderSpecification(inputOrder);
		Page<Order> orders = orderService.findBySpecification(orderSpec, PageRequest.of(page, length.orElse(10)));
		System.out.println("orders={}" + orders);
		log.debug("orders={}", orders);
		return orders;
	}

	// Jasmine
	// 針對order按檢舉按鍵後，呼叫這支
	@RequestMapping("/report")
	public String report(@RequestParam("orderId") Long orderId, Model model, Principal principal) {

		// 1.判斷是否已被檢舉過。如已被檢舉過，則回傳無法檢舉的資訊並且導回原頁面
		Penalty penalty = penaltyService.checkRecordandProvidePenalty(orderId, principal);

		if (penalty == null) {
			model.addAttribute("penaltyExist", orderId + "號媒合案件已有您的檢舉紀錄，不得重複提出檢舉");
			return "/basic/user/penalty/temp_order_list";
		}

		// 2.如果未被檢舉過，則將需要顯示在檢舉頁面的資料放入model(session scope)
		model.addAttribute("reportBasicData", penalty);
		return "/basic/user/penalty/violation_report";
	}

	// Jasmine
	// 提出檢舉時呼叫的方法
	// 前端用ajax無法同時送檔案和表單，故此處暫不用@ResponseBody，待處理。
	@RequestMapping(value = "/doReport", method = RequestMethod.POST)
	public String doReport(Penalty penalty, @RequestParam("proofPic") MultipartFile proofPic,
			MultipartHttpServletRequest request, Model model) {

		AjaxResponse<Penalty> ajaxResponse = new AjaxResponse<Penalty>();

		try {
			Penalty penaltyResult = penaltyService.savePenaltyAndStoreProofPic(proofPic, penalty, request);
			ajaxResponse.setObj(penaltyResult);
			model.addAttribute("reportOnePenalty", ajaxResponse);

		} catch (Exception e) {
			e.printStackTrace();
			ajaxResponse.addMessage(e.getMessage());
			model.addAttribute("reportOnePenalty", ajaxResponse);
			return "/basic/user/penalty/temp_order_list";
		}
		// return "redirect:/penalty/my-report-list";
		// return ajaxResponse;
		return "/basic/user/penalty/temp_order_list";
	}

	// 檢舉成功
	@RequestMapping("/my-report-list")
	public String showReportList() {
		return "/basic/user/penalty/my_report_list";
	}

	// *************************************************

	// Jasmine
	// 印Excel報表
	@RequestMapping(value = "/penaltyExcel", method = RequestMethod.GET)
	public ModelAndView downloadExcel(Penalty inputPenalty, HttpServletResponse response) throws SQLException {

		Map<String, Object> excelModel = new HashMap<String, Object>();

		// 設定EXCEL的Sheet名稱
		excelModel.put("sheetname", "PenaltiesSheet");

		// 設定表頭欄位名稱
		List<String> headers = penaltyService.getPenaltyExcelAndPdfHeaders();
		excelModel.put("headers", headers);

		// 在欄位中填入資料
		PenaltySpecification penaltySpec = new PenaltySpecification(inputPenalty);
		List<List<String>> results = penaltyService.findAllBySpecificationForExcelAndPdf(penaltySpec);
		excelModel.put("results", results);

		response.setContentType("application/ms-excel");
		response.setHeader("Content-disposition", "attachment; filename=penaltiesFile.xlsx");//設定下載檔名，如不設則直接在網頁上顯示

		return new ModelAndView(new ExcelView(), excelModel);
	}

	// 印PDF報表
	@RequestMapping(value = "/penaltyPDF", method = RequestMethod.GET)
	public ModelAndView downloadPDF(Penalty inputPenalty, HttpServletResponse response) {
		Map<String, Object> pdfModel = new HashMap<String, Object>();

		// 設定標題名稱
		pdfModel.put("title", "Penalties-Sheet");

		// 設定表頭欄位名稱
		List<String> headers = penaltyService.getPenaltyExcelAndPdfHeaders();
		pdfModel.put("headers", headers);

		// 在欄位中填入資料
		PenaltySpecification penaltySpec = new PenaltySpecification(inputPenalty);
		List<List<String>> results = penaltyService.findAllBySpecificationForExcelAndPdf(penaltySpec);
		pdfModel.put("results", results);
		
		response.setHeader("Content-disposition", "attachment; filename=penaltiesFile.pdf");//設定下載檔名，如不設則直接在網頁上顯示
		
		PdfView pdfView = new PdfView();
		
		
		return new ModelAndView(pdfView, pdfModel);
	}

	// Jasmine
	// 跳轉審查列表
	@RequestMapping("/showVertifyList")
	public String showVertifyList() {
		return "/basic/user/penalty/vertify/vertify_report_list";
	}

	// Jasmine
	// 查出所有待審查列表
	@RequestMapping("/getVertifyList")
	@ResponseBody
	public Page<Penalty> getVertifyList(Penalty inputPenalty,
			@RequestParam(value = "start", required = false) Optional<Integer> start,
			@RequestParam(value = "length", required = false) Optional<Integer> length) {
		int page = start.orElse(0) / length.orElse(10);
		log.debug("inputPenalty={}", inputPenalty);
		PenaltySpecification penaltySpec = new PenaltySpecification(inputPenalty);

		// Sort sort = new Sort(Sort.Direction.DESC, "id"); //傳入PageRequest.of()當第三個參數

		Page<Penalty> penalties = penaltyService.findBySpecification(penaltySpec,
				PageRequest.of(page, length.orElse(10)));
		log.debug("PenaltiesSize={}", penalties.getSize());
		return penalties;
	}

	// Jasmine
	// 點選個案後呼叫此controller，進入個案審查畫面
	@RequestMapping("/vertify")
	public String vertify(@RequestParam("id") Long orderId, Model model) {
		Penalty penalty = penaltyService.getOne(orderId);
		model.addAttribute("penalty", penalty);
		return "/basic/user/penalty/vertify/penalty_vertifying";
	}

	// Jasmine
	// 呼叫審查service(扣違規會員時數)，完成審查(update成功)後跳出成功對話框(SUCCESS)，轉回所有待審查清單
	@RequestMapping("/doneVertify")
	@ResponseBody
	public AjaxResponse<Penalty> doneVertify(@RequestParam("penaltyId") Long penaltyId,
			@RequestParam("status") Integer status, @RequestParam("penaltyTimeValue") Integer penaltyTimeValue,
			@RequestParam("vertifyReason") String vertifyReason) {

		AjaxResponse<Penalty> ajaxResponse = new AjaxResponse<Penalty>();
		// 測完看能否再包些東西進Service
		try {
			// 進行檢舉案件審核，結果存入DB (但可能是暫存審核意見，還沒完成審核)
			Penalty penalty = penaltyService.vertifyPenalty(penaltyId, status, penaltyTimeValue, vertifyReason);

			// 完成審核，寄站內信通知原告
			if (status == 2 || status == 3) {
				penaltyService.sendSystemMessageToAccuser(penalty); // 寄信
				ajaxResponse.setStatusDescription("1.已寄站內信給檢舉人。");
			}
			// 如果審核結果為2(需懲罰)，才進行被檢舉人帳戶扣款，並且寄站內信給被告
			if (status == 2) {
				timeLedgerService.doPenaltyDebit(penalty); // 扣款
				penaltyService.sendSystemMessageToDefendant(penalty); // 寄信
				ajaxResponse.setStatusDescription(ajaxResponse.getStatusDescription() + " 2.已寄站內信給被檢舉人。");
			}
			// ajaxResponse.setObj(penalty);
		} catch (Exception e) {
			ajaxResponse.addMessage(e.getMessage());
			e.printStackTrace();
		}

		return ajaxResponse;
	}
	
	
	// Jasmine
	// 申訴審核
	@RequestMapping("/doReVertify")
	@ResponseBody
	public AjaxResponse<Penalty> doReVertify(@RequestParam("penaltyId") Long penaltyId,
			@RequestParam("reVertifystatus") Integer reVertifystatus, 
			@RequestParam("reVertifyPenaltyTimeValue") Integer reVertifyPenaltyTimeValue,
			@RequestParam("reVertifyReason") String reVertifyReason) {

		AjaxResponse<Penalty> ajaxResponse = new AjaxResponse<Penalty>();
		try {
			// 進行申訴案件審核，結果存入DB (暫存申訴審核意見，還沒完成審核)
			Penalty penalty = penaltyService.reVertifyPenalty(penaltyId, reVertifystatus, reVertifyPenaltyTimeValue, reVertifyReason);

			// 完成申訴審核結果，補時數並寄站內信通知申訴人
			if (reVertifystatus == 3 || reVertifystatus == 2) {
				timeLedgerService.sendTimeValueAfterReVertify(penalty);
				penaltyService.sendSystemMessageToDefendantAfterReVertify(penalty); 
				ajaxResponse.setStatusDescription("已寄站內信給申訴人。");
			}

		} catch (Exception e) {
			ajaxResponse.addMessage(e.getMessage());
			e.printStackTrace();
		}

		return ajaxResponse;
	}
	

	// 將佐證圖片存至Server
	// @RequestMapping("/storeProofPic")
	// public String storeProofPic(@RequestParam("proofPic") MultipartFile proofPic,
	// @RequestParam("penaltyId") Long penaltyId, HttpServletRequest request) throws
	// IOException {
	//
	// log.debug("pictureName={}", proofPic.getOriginalFilename());
	// System.out.println("pictureName={}"+proofPic.getOriginalFilename());
	//
	// //如果有上傳圖片，才存檔案到Server，及存路徑到DB
	// if(proofPic.getOriginalFilename().length() > 0) {
	// Boolean result = penaltyService.storeProofPic(proofPic, penaltyId, request);
	// log.debug("storePictureResult={}", result);
	// System.out.println("storePictureResult={}"+ result);
	// }
	//
	// //待處理:上傳檔案類型，判斷副檔名。
	// return "redirect:/penalty/tempPenaltyEntrance";//回傳上傳成功與否之資訊
	// }

	// 測試直接從登入資訊中取得會員id
	@RequestMapping("/test")
	public void showMember() {
		Member userDetails = (Member) SecurityContextHolder.getContext().getAuthentication().getPrincipal();

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

	@RequestMapping(value = "/insert", method = RequestMethod.POST)
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
	public Page<Penalty> queryPenalty(Penalty inputPenalty,
			@RequestParam(value = "start", required = false) Optional<Integer> start,
			@RequestParam(value = "length", required = false) Optional<Integer> length) {
		int page = start.orElse(0) / length.orElse(10);
		PenaltySpecification penaltySpec = new PenaltySpecification(inputPenalty);
		Page<Penalty> penalties = penaltyService.findBySpecification(penaltySpec,
				PageRequest.of(page, length.orElse(10)));
		return penalties;

	}

}
