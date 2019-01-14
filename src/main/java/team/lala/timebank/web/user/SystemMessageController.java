package team.lala.timebank.web.user;

import java.security.Principal;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import lombok.extern.slf4j.Slf4j;
import team.lala.timebank.entity.SystemMessage;
import team.lala.timebank.enums.YesNo;
import team.lala.timebank.service.SystemMessageService;

@Slf4j
@Controller
@RequestMapping("/system-message")
@SessionAttributes(names= {"notReadMsgSize"})
public class SystemMessageController {
	@Autowired
	private SystemMessageService systemMessageService;
	
	//Jasmine
	//系統訊息頁面
	@RequestMapping("/list")
	public String listPage() {
		return "/basic/user/system_message/system_message_list"; 
	}
	
	//Jasmine
	//ajax回傳每頁資料，並將所有系統訊息標為已讀
	@RequestMapping("/getSystemMessages")
	@ResponseBody
	public Page<SystemMessage> getSystemMessages(@RequestParam("readStatus") YesNo readStatus, Principal principal,
			@RequestParam(value="start",required=false) Optional<Integer> start, 
			@RequestParam(value="length",required=false) Optional<Integer> length) {
		int page = start.orElse(0)/length.orElse(10);

		Page<SystemMessage> systemMessages = null;
		Sort sort = new Sort(Sort.Direction.DESC, "releaseTime"); //傳入PageRequest.of()當第三個參數，從最近的訊息開始列
		if(readStatus == null) {
			systemMessages = systemMessageService.findAllByPageAndMemberAccount(principal, PageRequest.of(page, length.orElse(10), sort));
			systemMessageService.readAllMessage(principal);//1/6進入系統信箱直接預設讀取所有系統訊息
		} else {
			systemMessages = systemMessageService.findByReadStatusAndMemberAccount(
					readStatus, principal, PageRequest.of(page, length.orElse(10), sort));
		}
		return systemMessages;
	}
	
	
	
	//Jasmine
	//讀取單筆訊息，並將系統訊息狀態改為已讀
	@RequestMapping("/readMessage")
	@ResponseBody
	public SystemMessage readMessage( @RequestParam("id") Long id) {
		SystemMessage systemMessage = systemMessageService.changeReadStatusAndGetSystemMessage(id);
		
		return systemMessage; 
	}
	
	//Jasmine
	//查詢未讀訊息筆數
	@RequestMapping("/countNotReadMessage")
	@ResponseBody
	public Integer countNotReadMessage(Model model, Principal principal) {
		Integer notReadMsgSize = systemMessageService.countNotReadMessages(principal);
		model.addAttribute("notReadMsgSize", notReadMsgSize);
		return notReadMsgSize; 
	}
	
	//Jasmine
	@RequestMapping("/selectMsgsAsRead")
	public String selectMsgsAsRead(Principal principal, @RequestParam("msgChecked[]") Long[] msgChecked) {
		if(msgChecked.length > 0) {
			for(Long id : msgChecked) {
				log.debug("checkBoxId={}", id);
				systemMessageService.changeReadStatusAndGetSystemMessage(id);
			}
		}
		
		return listPage();
	}
	
	
}
