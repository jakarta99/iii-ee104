package team.lala.timebank.web.user;

import java.security.Principal;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import team.lala.timebank.entity.ChatClient;
import team.lala.timebank.entity.ChatOutputMessage;

@Controller
public class ChatMessageHandlerController {

	@MessageMapping("/chat")
	@SendTo("/topic/messages")
	public ChatOutputMessage send(ChatClient message, Principal principal) throws Exception {
	    String time = new SimpleDateFormat("HH:mm").format(new Date());
	    return new ChatOutputMessage(principal.getName(),message.getTo(), message.getText(), time);
	}
	
	@RequestMapping("/chatpage")
	public String chatPage() {
		return "/basic/user/chatRoom/chattingExample";
	}
	
}
