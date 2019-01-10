package team.lala.timebank.web.user;

import java.security.Principal;
import java.util.Date;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.extern.slf4j.Slf4j;
import team.lala.timebank.commons.ajax.AjaxResponse;
import team.lala.timebank.entity.ChatClient;
import team.lala.timebank.entity.ChatMessage;
import team.lala.timebank.service.ChatMessageService;
@Slf4j
@Controller
public class ChatMessageController {

	@Autowired
	private ChatMessageService chatMessageService;
	

	@MessageMapping("/chat")
	@SendTo("/topic/messages")
	public ChatMessage send(ChatClient message, Principal principal) throws Exception {
		ChatMessage chatMessage = new ChatMessage(principal.getName(),message.getTo(),
				message.getText(), new Date());	   
		if (!StringUtils.isEmpty(message.getText())) {
			chatMessageService.insert(chatMessage);			
		}
		
		return chatMessage;
	}
	
	@ResponseBody
	@RequestMapping("/user/chatMessage/list")
	public List<ChatMessage> listMessages(@RequestParam String to, Principal principal){
		log.debug("to={}",to);
//		AjaxResponse<List<ChatMessage>> resp = new AjaxResponse<List<ChatMessage>>();
		ChatMessage chatMessage = new ChatMessage();
		chatMessage.setToAccount(to);
		chatMessage.setFromAccount(principal.getName());
		List<ChatMessage> chatMessageList = chatMessageService.findChatMessagesBetweenFromAndTo(chatMessage);
		log.debug("chatMessageList={}",chatMessageList);
		return chatMessageList;
	}
	

	
	@RequestMapping("/chatpage")
	public String chatPage() {
		return "/basic/user/chatRoom/chattingExample";
	}
	
}
