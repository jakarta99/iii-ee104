package team.lala.timebank.web.user;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.extern.slf4j.Slf4j;
import team.lala.timebank.entity.SystemMessage;
import team.lala.timebank.enums.YesNo;
import team.lala.timebank.service.SystemMessageService;

@Slf4j
@Controller
@RequestMapping("/system-message")
public class SystemMessageController {
	@Autowired
	private SystemMessageService systemMessageService;
	
	@RequestMapping("/list")
	public String listPage() {
		return "/basic/user/system_message/system_message_list"; // getRequestDispatcher("/WEB-INF/jsp/order_list.jsp").forward(request,
									// response);
	}
	
	@RequestMapping("/getSystemMessages")
	@ResponseBody
	public Page<SystemMessage> getSystemMessages(@RequestParam("readStatus") YesNo readStatus, @RequestParam(value="start",required=false) Optional<Integer> start, 
			@RequestParam(value="length",required=false) Optional<Integer> length) {
		int page = start.orElse(0)/length.orElse(10);


		log.debug("readStatus={}", readStatus);
		Page<SystemMessage> systemMessages = null;
		//Sort sort = new Sort(Sort.Direction.DESC, "releaseTime"); //傳入PageRequest.of()當第三個參數
		if(readStatus == null) {
			systemMessages = systemMessageService.findAllByPage(PageRequest.of(page, length.orElse(10)));
		} else {
			systemMessages = systemMessageService.findByReadStatus(
					readStatus, PageRequest.of(page, length.orElse(10)));
		}
		
		return systemMessages;
	}
	
}
