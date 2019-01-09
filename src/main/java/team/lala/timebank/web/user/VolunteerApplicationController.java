package team.lala.timebank.web.user;

import java.io.File;
import java.io.FileOutputStream;
import java.security.Principal;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import lombok.extern.slf4j.Slf4j;
import team.lala.timebank.commons.ajax.AjaxResponse;
import team.lala.timebank.entity.Order;
import team.lala.timebank.entity.Penalty;
import team.lala.timebank.service.OrderService;
import team.lala.timebank.service.PenaltyService;
import team.lala.timebank.spec.OrderSpecification;

@Slf4j
@Controller
@RequestMapping("/user")
public class VolunteerApplicationController {
	
	@Autowired
	private OrderService orderService;
	@Autowired
	private PenaltyService penaltyService;

	@RequestMapping("/volunteerApplication/applicationPage")	//進入志工申請中網頁
	public String applicationPage() {
		return "/basic/user/volunteerApplication/volunteerApplication";
	}
	
	@RequestMapping("/volunteerRecord/RecordPage")	//進入志工媒合結果網頁
	public String recordPage() {
		return "/basic/user/volunteerApplication/volunteerServiceRecordInquire";
	}

	@ResponseBody
	@RequestMapping("/volunteerApplication/queryApplication")	//查詢申請中網頁的資料
	public Page<Order> queryApplication(Principal principal, @RequestParam(value="orderStatusDetail") String orderStatusDetail,
			@RequestParam(value="page",required=false) Integer page, 
			@RequestParam(value="length",required=false) Optional<Integer> length) {
		Order order = new Order();
		order.setOrderStatusDetail(orderStatusDetail);
		order.setVolunteerAccount(principal.getName());
		OrderSpecification orderSpecification = new OrderSpecification(order);
		return orderService.findBySpecification(orderSpecification, PageRequest.of(page, length.orElse(10)));
	}
	
	@ResponseBody
	@RequestMapping("/volunteerRecord/queryRecord")		//查詢媒合紀錄資料
	public Page<Order> queryRecord(Principal principal, Order order,
			@RequestParam(value="orderStatusDetail") String orderStatusDetail,
			@RequestParam(value="page",required=false) Integer page,
			@RequestParam(value="length",required=false) Optional<Integer> length) {
		log.debug("order={}", order);
		order.setVolunteerAccount(principal.getName());
		OrderSpecification orderSpecification = new OrderSpecification(order);
		return orderService.findBySpecification(orderSpecification, PageRequest.of(page, length.orElse(10)));
	}
	
//	@ResponseBody
//	@RequestMapping("/volunteerRecord/score")		//志工幫雇主評分
//	public AjaxResponse<Order> score(@RequestParam(value="orderId") Long orderId, @RequestParam(value="score") int score) {
//		AjaxResponse<Order> response = new AjaxResponse<Order>();
//		try {
//			orderService.score(orderId, score);
//		} catch (NumberFormatException e) {
//			response.addMessage("評分失敗，" + e.getMessage());
//			e.printStackTrace();
//		}
//		return response;	
//	}
	@ResponseBody
	@RequestMapping("/volunteerRecord/report")		//志工檢舉雇主
	public AjaxResponse<Order> report(@RequestParam(value="orderId") Long orderId,
			@RequestParam(value="description") String description,
			@RequestParam("proofPic") MultipartFile proofPic
			, MultipartHttpServletRequest request){
		AjaxResponse<Order> response = new AjaxResponse<Order>();
		Penalty penalty = orderService.report(orderId, description);
		try {
			if (proofPic.getOriginalFilename().length() > 0) {
				// 取得應用程式根目錄中圖片之路徑
				String realPath = request.getServletContext().getRealPath("/") + "WEB-INF\\image\\admin\\penalty\\";
				// 確認是否有此資料夾，如無則建資料夾
				File dir = new File(realPath);
				if (!dir.exists()) {
					dir.mkdirs();
				}
				//路徑
				String location = realPath + "penaltyPicture_" + penalty.getId() + ".jpg";
				//寫出檔案到Server
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
	@RequestMapping("/volunteerApplication/delete")		//志工取消申請
	public AjaxResponse<Order> cancelApplication(@RequestParam("id") Long id){
		AjaxResponse<Order> response = new AjaxResponse<Order>();
		try {
			orderService.cancle(id);
		} catch (Exception e) {
			e.printStackTrace();
			response.addMessage("刪除失敗");
		}
		return response;
	}

}