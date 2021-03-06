package team.lala.timebank.web.user;

import java.security.Principal;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.MessageMapping;
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
@Slf4j
@Controller
@RequestMapping("/user/chatMessage") 
public class ChatMessageController {

	@Autowired
	private ChatMessageService chatMessageService;
	
	@Autowired
	private MemberService memberService ;
	

	@MessageMapping("/chat")
	public void sendSingle(ChatMessage chatMessage, Principal principal) throws Exception {
		log.debug("chatMessage={}",chatMessage);
		//若readAlready為"Y"，此chatMessage代表有人點擊聊天窗口(text中並無實質訊息)
		if ("Y".equals(chatMessage.getReadAlready())){	
			//根據雙方帳號更新已讀狀態，但這不代表所有雙方間的對話都更新為已讀
			chatMessageService.updateChatMessagesReadAlreadyStatusBetweenTwoAccounts(chatMessage,"Y");
			List<ChatMessage> chatList = chatMessageService.findChatMessagesBetweenFromAndTo(chatMessage);
			if (chatList.size() >0) {
				 ChatMessage lastChatMessage = chatList.get(chatList.size() -1);	
				if ("Y".equals(lastChatMessage.getReadAlready())) {
					log.debug("chatMessage return={}",chatMessage);	
					chatMessage.setTime(new Date());
					chatMessageService.sendChatMessageToSingleUser(chatMessage);
				}					
			}			
		}else if (!StringUtils.isEmpty(chatMessage.getText())) {
			System.out.println("insert msg");	
			chatMessage.setTime(new Date());
			chatMessage.setReadAlready("N");
			chatMessage = chatMessageService.insert(chatMessage);			
			log.debug("chatMessage return={}",chatMessage);
			chatMessageService.sendChatMessageToSingleUser(chatMessage);
		} 
	}
	
	//搜尋與他人之前的對話，並將資料存放session
	@ResponseBody
	@RequestMapping("/oldMessages/onePerson/query")
	public Map<String, Object> findChatMessagesWithAnotherMember(@RequestParam String toAccount, @RequestParam String fromAccount,Model model,HttpSession session){
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
		
		//將聊天對象資料存放在session scope內，一旦連線完成，整個網站都能進行對話
		List<Member> chatMemberList;
		try {
			if (session.getAttribute("stompClientConnection") != null) {
				System.out.println("session toMember != null");
				chatMemberList = (List<Member>) session.getAttribute("chatMemberList");
			} else {
				chatMemberList = new ArrayList<>();
				session.setAttribute("stompClientConnection", "Y");
			}
			if (!chatMemberList.contains(toMember)) {
				chatMemberList.add(toMember);				
			}
			session.removeAttribute("chatMemberList");
			session.setAttribute("chatMemberList", chatMemberList);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return respData;
	}
	
	@ResponseBody
	@RequestMapping("/messages/all/chatObject")
	public List<ChatMessage> findLastMessageWithChatObjectsByAccount(Principal principal){
		//查詢所有聊天對象以及與其的最後對話(部分更新畫面)
		return  chatMessageService.findLastMessageWithChatObjectsByAccount(principal.getName());		
		
	}
	

	@ResponseBody
	@RequestMapping("/stompClientConnection/session/clear")
	public void clearStompClientConnectionSession(@RequestParam String toAccount,HttpSession session ) {

		try {
			Collection<Member> chatMemberList = (List<Member>)session.getAttribute("chatMemberList");
//			Iterator<Member>  it = chatMemberList.iterator();
//			Member member;
//			while (it.hasNext()) {
//				member= it.next();
//				if (member.getAccount().equals(toAccount)) {
//					System.out.println("remove toAccount");
//					it.remove();
//					break;
//				}
//			}
//			session.removeAttribute("chatMemberList");
//			session.setAttribute("chatMemberList", chatMemberList);
			session.removeAttribute("stompClientConnection");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
}
