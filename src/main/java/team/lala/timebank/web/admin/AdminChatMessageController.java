package team.lala.timebank.web.admin;

import java.security.Principal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.extern.slf4j.Slf4j;
import team.lala.timebank.entity.ChatMessage;
import team.lala.timebank.entity.Member;
import team.lala.timebank.service.ChatMessageService;
import team.lala.timebank.service.MemberService;

@Controller
@RequestMapping("/admin/chatMessage")
@Slf4j
public class AdminChatMessageController {

	
	@Autowired
	private ChatMessageService chatMessageService;
	
	@Autowired
	private MemberService memberService;

	
	//我的訊息頁面(查看所有我的訊息紀錄)
	@RequestMapping("/messages/all/list")
	public String listAllChatHistoryPage(Principal principal, Model model) {
		//查詢所有聊天對象以及與其的最後對話
		List<ChatMessage> chatObjectsList = chatMessageService.findLastMessageWithChatObjectsByAccount(principal.getName());		
		model.addAttribute("chatObjectsList",chatObjectsList);
		log.debug("chatObjectsList={}",chatObjectsList);
		return "/admin/chatMessage/chatMessagesPage";
	}
	@ResponseBody
	@RequestMapping("/messages/all/chatObject")
	public List<ChatMessage> findLastMessageWithChatObjectsByAccount(Principal principal){
		//查詢所有聊天對象以及與其的最後對話(部分更新畫面)
		return  chatMessageService.findLastMessageWithChatObjectsByAccount(principal.getName());		
		
	}
	
	//搜尋與他人之前的對話，並將資料存放session
		@ResponseBody
		@RequestMapping("/oldMessages/onePerson/query")
		public Map<String, Object> findChatMessagesWithAnotherMember(@RequestParam String toAccount, @RequestParam String fromAccount,Model model){
			Map<String, Object> respData = new HashMap<String, Object>();
			ChatMessage chatMessage = new ChatMessage();
			log.debug("to={}",toAccount);
			chatMessage.setToAccount(toAccount);
			chatMessage.setFromAccount(fromAccount);
			chatMessageService.updateChatMessagesReadAlreadyStatusBetweenTwoAccounts(chatMessage,"Y");
			List<ChatMessage> chatList = chatMessageService.findChatMessagesBetweenFromAndTo(chatMessage);
			log.debug("chatList={}",chatList);
			
			Member toMember = memberService.findByAccount(toAccount);
			Member fromMember =  memberService.findByAccount(fromAccount);
			//將所有需要的資訊放進Map中回傳給Browser
			respData.put("chatList", chatList);
			respData.put("toMemberPic", toMember.getPicture());
			respData.put("fromMemberPic", fromMember.getPicture());
			respData.put("toMemberName", toMember.getName());
			
			

			return respData;
		}
}
