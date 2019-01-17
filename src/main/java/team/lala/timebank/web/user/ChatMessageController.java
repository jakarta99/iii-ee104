package team.lala.timebank.web.user;

import java.security.Principal;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import lombok.extern.slf4j.Slf4j;
import team.lala.timebank.entity.ChatClient;
import team.lala.timebank.entity.ChatMessage;
import team.lala.timebank.entity.Member;
import team.lala.timebank.enums.YesNo;
import team.lala.timebank.service.ChatMessageService;
import team.lala.timebank.service.MemberService;
@Slf4j
@Controller
@RequestMapping("/user/chatMessage")
@SessionAttributes(value={"stompClientConnection","toMember","fromMember"})
public class ChatMessageController {

	@Autowired
	private ChatMessageService chatMessageService;
	
	@Autowired
	private MemberService memberService ;
	

	@MessageMapping("/chat")
	@SendTo("/topic/messages")
	public ChatMessage send(ChatMessage chatMessage, Principal principal) throws Exception {
		log.debug("chatMessage={}",chatMessage);
		if ("Y".equals(chatMessage.getReadAlready())){
			System.out.println("update msg");	
			chatMessageService.updateChatMessagesReadAlreadyStatusBetweenTwoAccounts(chatMessage,"Y");
			List<ChatMessage> chatList = chatMessageService.findChatMessagesBetweenFromAndTo(chatMessage);
			if (chatList.size() >0) {
				chatMessage = chatList.get(chatList.size() -1);	
				if (chatMessage.getReadAlready() == "Y") {
					log.debug("chatMessage return={}",chatMessage);
					
				}
					
			}
			
		}else if (!StringUtils.isEmpty(chatMessage.getText())) {
			System.out.println("insert msg");	
			chatMessage.setTime(new Date());
			chatMessage.setReadAlready("N");
			chatMessage = chatMessageService.insert(chatMessage);			
			log.debug("chatMessage return={}",chatMessage);
		} 
		return chatMessage;
	}
	
	//搜尋與他人之前的對話
	@ResponseBody
	@RequestMapping("/oldMessages/onePerson/query")
	public Map<String, Object> findChatMessagesWithAnotherMember(@RequestParam String to, @RequestParam String from,Model model){
		Map<String, Object> respData = new HashMap<String, Object>();
		ChatMessage chatMessage = new ChatMessage();
		log.debug("to={}",to);
		chatMessage.setToAccount(to);
		chatMessage.setFromAccount(from);
		chatMessageService.updateChatMessagesReadAlreadyStatusBetweenTwoAccounts(chatMessage,"Y");
		List<ChatMessage> chatList = chatMessageService.findChatMessagesBetweenFromAndTo(chatMessage);
		log.debug("chatList={}",chatList);
		
		Member toMember = memberService.findByAccount(to);
		Member fromMember =  memberService.findByAccount(from);
		//將所有需要的資訊放進Map中回傳給Browser
		respData.put("chatList", chatList);
		respData.put("toMemberPic", toMember.getPicture());
		respData.put("fromMemberPic", fromMember.getPicture());
		respData.put("toMemberName", toMember.getName());
		//將聊天對象資料存放在session scope內，一旦連線完成，整個網站都能進行對話
//		model.addAttribute("stompClientConnection", "Y");
//		model.addAttribute("toMember", toMember);
//		model.addAttribute("fromMember", fromMember);
		return respData;
	}
	
	//我的訊息頁面(查看所有我的訊息紀錄)
	@RequestMapping("/oldMessages/all/list")
	public String listAllChatHistoryPage(Principal principal, Model model) {
		List<ChatMessage> chatObjectsList = chatMessageService.findLastMessageWithChatObjectsByAccount(principal.getName());		
		model.addAttribute("chatObjectsList",chatObjectsList);
		log.debug("chatObjectsList={}",chatObjectsList);
		return "/basic/user/chatRoom/chatMessagesPage";
	}
	
}
