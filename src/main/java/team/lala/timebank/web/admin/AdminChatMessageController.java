package team.lala.timebank.web.admin;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.extern.slf4j.Slf4j;
import team.lala.timebank.entity.ChatMessage;
import team.lala.timebank.service.ChatMessageService;

@Controller
@RequestMapping("/admin/chatMessage")
@Slf4j
public class AdminChatMessageController {

	
	@Autowired
	private ChatMessageService chatMessageService;

	
	//我的訊息頁面(查看所有我的訊息紀錄)
	@RequestMapping("/messages/all/list")
	public String listAllChatHistoryPage(Principal principal, Model model) {
		List<ChatMessage> chatObjectsList = chatMessageService.findLastMessageWithChatObjectsByAccount(principal.getName());		
		model.addAttribute("chatObjectsList",chatObjectsList);
		log.debug("chatObjectsList={}",chatObjectsList);
		return "/admin/chatMessage/chatMessagesPage";
	}
	@ResponseBody
	@RequestMapping("/messages/all/chatObject")
	public List<ChatMessage> findLastMessageWithChatObjectsByAccount(Principal principal){
		return  chatMessageService.findLastMessageWithChatObjectsByAccount(principal.getName());		
		
	}
	
	
}
