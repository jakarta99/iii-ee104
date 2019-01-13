package team.lala.timebank.web.user;

import java.security.Principal;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.extern.slf4j.Slf4j;
import team.lala.timebank.entity.ChatClient;
import team.lala.timebank.entity.ChatMessage;
import team.lala.timebank.entity.Member;
import team.lala.timebank.service.ChatMessageService;
import team.lala.timebank.service.MemberService;
@Slf4j
@Controller
@RequestMapping("/user/chatMessage")
public class ChatMessageController {

	@Autowired
	private ChatMessageService chatMessageService;
	
	@Autowired
	private MemberService memberService ;
	

	@MessageMapping("/chat")
	@SendTo("/topic/messages")
	public ChatMessage send(ChatClient message, Principal principal) throws Exception {
		log.debug("message={}",message);
		ChatMessage chatMessage = null;  
		if (!StringUtils.isEmpty(message.getText()) && !StringUtils.isEmpty(message.getTo()) 
				&& !StringUtils.isEmpty(message.getFrom())) {
			chatMessage = new ChatMessage();  
			chatMessage.setFromAccount(message.getFrom());
			chatMessage.setToAccount(message.getTo());
			chatMessage.setText(message.getText());
			chatMessage.setTime(new Date());
			chatMessage = chatMessageService.insert(chatMessage);			
		}
		
		return chatMessage;
	}
	
	//搜尋與他人之前的對話
	@ResponseBody
	@RequestMapping("/oldMessages/onePerson")
	public Map<String, Object> findOldMessageWithAnotherMember(@RequestParam String to, @RequestParam String from){
		Map<String, Object> respData = new HashMap<String, Object>();
		ChatMessage chatMessage = new ChatMessage();
		chatMessage.setToAccount(to);
		chatMessage.setFromAccount(from);
		List<ChatMessage> chatList = chatMessageService.findChatMessagesBetweenFromAndTo(chatMessage);
		log.debug("chatList={}",chatList);
		Member toMember = memberService.findByAccount(to);
		Member fromMember =  memberService.findByAccount(from);
		respData.put("chatList", chatList);
		respData.put("toMemberPic", toMember.getPicture());
		respData.put("fromMemberPic", fromMember.getPicture());
		return respData;
	}
	
	//查看所有訊息的頁面
	@RequestMapping("/allMessages/list")
	public String chatPage(Principal principal, Model model) {
		List<ChatMessage> chatMessages = chatMessageService.findAllChatMessageByAccount(principal.getName());
		model.addAttribute("chatMessagesHistory", chatMessages);
		log.debug("chatMessages={}",chatMessages);
		
		return "/basic/user/chatRoom/chatMessagesPage";
	}
	
}
