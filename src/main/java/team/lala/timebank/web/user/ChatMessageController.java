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
public class ChatMessageController {

	@Autowired
	private ChatMessageService chatMessageService;
	
	@Autowired
	private MemberService memberService ;
	

	@MessageMapping("/chat")
	@SendTo("/topic/messages")
	public ChatMessage send(ChatClient message, Principal principal) throws Exception {
		ChatMessage chatMessage = new ChatMessage(principal.getName(),message.getTo(),
				message.getText(), new Date());	   
		if (!StringUtils.isEmpty(message.getText())) {
			chatMessage = chatMessageService.insert(chatMessage);			
		}
		
		return chatMessage;
	}
	
	@ResponseBody
	@RequestMapping("/user/chatMessage/list")
	public Map<String, Object> listMessages(@RequestParam String to, Principal principal){
		Map<String, Object> respData = new HashMap<String, Object>();
		ChatMessage chatMessage = new ChatMessage();
		chatMessage.setToAccount(to);
		chatMessage.setFromAccount(principal.getName());
		List<ChatMessage> chatList = chatMessageService.findChatMessagesBetweenFromAndTo(chatMessage);
		log.debug("chatList={}",chatList);
		Member toMember = memberService.findByAccount(to);
		Member fromMember =  memberService.findByAccount(principal.getName());
		respData.put("chatList", chatList);
		respData.put("toMemberPic", toMember.getPicture());
		respData.put("fromMemberPic", fromMember.getPicture());
		return respData;
	}
	

	
	@RequestMapping("/chatpage")
	public String chatPage() {
		return "/basic/user/chatRoom/chattingExample";
	}
	
}
