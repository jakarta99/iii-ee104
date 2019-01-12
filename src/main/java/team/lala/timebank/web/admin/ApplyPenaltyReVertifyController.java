package team.lala.timebank.web.admin;

import java.io.File;
import java.io.FileOutputStream;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import lombok.extern.slf4j.Slf4j;
import team.lala.timebank.commons.ajax.AjaxResponse;
import team.lala.timebank.entity.Order;
import team.lala.timebank.entity.Penalty;
import team.lala.timebank.enums.YesNo;
import team.lala.timebank.service.PenaltyService;

@Slf4j
@Controller
@RequestMapping("/user")
public class ApplyPenaltyReVertifyController {
	@Autowired
	private PenaltyService penaltyService;
	
	//Jasmine 提出申訴
		//則更改Penalty狀態為申訴中
	@ResponseBody
	@RequestMapping(value = "/applyReVertify", method = RequestMethod.POST)
	public AjaxResponse<Penalty> applyReVertify(@RequestParam("penaltyId") Long penaltyId, 
			@RequestParam("applyReVertifyDescription") String applyReVertifyDescription,
			@RequestParam("reVertifyProofPicName") MultipartFile reVertifyProofPicName,
			MultipartHttpServletRequest request, Model model) {
		
		Penalty penalty = penaltyService.getOne(penaltyId);
		penalty.setUpdateDate(new java.util.Date());
		penalty.setApplyReVertifyDescription(applyReVertifyDescription);
		penalty.setApplyReVertify(YesNo.Y);
		penalty.setStatus(4);
		penalty = penaltyService.save(penalty);
		AjaxResponse<Penalty> ajaxResponse = new AjaxResponse<Penalty>();
		
		try {
			if (reVertifyProofPicName.getOriginalFilename().length() > 0) {
				// 取得應用程式根目錄中圖片之路徑
				String realPath = request.getServletContext().getRealPath("/") + "WEB-INF\\image\\user\\reVertify\\";
				// 確認是否有此資料夾，如無則建資料夾
				File dir = new File(realPath);
				if (!dir.exists()) {
					dir.mkdirs();
				}
				// 儲存位置
				String location = realPath + "reVertifyPicture_" + penalty.getId() + ".jpg";
				// 寫出檔案到Server
				FileOutputStream fos = new FileOutputStream(location);
				fos.write(reVertifyProofPicName.getBytes());
				fos.close();
				// 將檔名、申訴資訊存入DB
				penalty.setReVertifyProofPicName("reVertifyPicture_" + penalty.getId() + ".jpg");
				penaltyService.save(penalty);
			}
		} catch (Exception e) {
			ajaxResponse.addMessage("修改失敗，" + e.getMessage());
			e.printStackTrace();
		}
		

		return ajaxResponse;
	}
	
	
	@ResponseBody
	@RequestMapping(value = "/checkReVertifyContent", method = RequestMethod.POST)
	public Penalty checkReVertifyContent(@RequestParam("penaltyId") Long penaltyId) {
		
		Penalty penalty = penaltyService.getOne(penaltyId);
		return penalty;
	}
	

	
	
}
