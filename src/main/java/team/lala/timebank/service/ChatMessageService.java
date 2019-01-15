package team.lala.timebank.service;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import lombok.extern.slf4j.Slf4j;
import team.lala.timebank.dao.ChatMessageDao;
import team.lala.timebank.dao.MemberDao;
import team.lala.timebank.entity.ChatMessage;
import team.lala.timebank.entity.Member;

@Slf4j
@Service
@Transactional
public class ChatMessageService {

	@Autowired
	private ChatMessageDao chatMessageDao;
	
	@Autowired
	private MemberDao memberDao;
	
	@Autowired
	protected EntityManager em;
	
	@Transactional(readOnly=true)
	public List<ChatMessage> findChatMessagesBetweenFromAndTo(ChatMessage chatMessage){
		return chatMessageDao.findChatMessagesBetweenTwoAccounts
				(chatMessage.getFromAccount(), chatMessage.getToAccount());
	}
	
	public ChatMessage insert(ChatMessage chatMessage) {
//		Member toMember = memberDao.findByAccount(chatMessage.getToAccount());
//		Member fromMember =  memberDao.findByAccount(chatMessage.getFromAccount());
//		chatMessage.setToMemberPic(toMember.getPicture());
//		chatMessage.setFromMemberPic(fromMember.getPicture());
		return chatMessageDao.save(chatMessage);
	}
	
	//找出此使用者的所有聊天紀錄
	@Transactional(readOnly=true)
	public List<ChatMessage> findAllChatMessageByAccount(String account){
		//找出此使用者的所有聊天紀錄
		List<ChatMessage> chatHistory = chatMessageDao.findAllChatMessagesByAccount(account);
		log.debug("chatHistory={}",chatHistory);
		return chatHistory;
	}
	
	//找出此使用者所有的聊天對象以及彼此間最後的對話
	@Transactional(readOnly=true)
	public List<ChatMessage> findLastMessageWithChatObjectsByAccount(String account){	
		//此清單將存放與聊天對象最後的對話
		List<ChatMessage> lastMessageWithChatObjectList = new ArrayList<>();
		//查詢此帳號的所有聊天對象(Object[]裝有使用者帳號、聊天對象帳號、最後對話時間)
		List<Object[]> objectList = chatMessageDao.findChatObjectsByUserAccountOrderByLastChatTime(account);
		//將聊天對象帳號放進chatObjectList內，以便後面利用此list進行Member查詢
		List<String> chatObjectList = new ArrayList<>();
				
		for(Object[] object : objectList) {
			//object[0]:使用者帳號、object[1]:聊天對象帳號、object[2]:最後對話時間
			chatObjectList.add((String)object[1]);			
			lastMessageWithChatObjectList.add(null);//增加這個list的size
		}
		log.debug("chatObjectList={}",chatObjectList);
		//利用chatObjectList內的帳號資料尋找所有對應的Member entity
		List<Member> memberList = memberDao.findMembersByListOfAccounts(chatObjectList, em);
		log.debug("memberList={}",memberList);	
		
		//根據兩人帳號搜尋兩人間的最後對話(lastChatMessage)，並設定聊天對象的name及picture
		//將lastChatMessage依照最後對話的時間順序將對話加入lastMessageWithChatObjectList內
		for (Member m :memberList) {
			ChatMessage lastChatMessage = chatMessageDao.findLastChatMessageBetweenTwoAccounts(account, m.getAccount());
			lastChatMessage.setToMemberPic(m.getPicture());
			lastChatMessage.setToName(m.getName());
			lastChatMessage.setToAccount(m.getAccount());
			int idx = chatObjectList.indexOf(m.getAccount());
			lastMessageWithChatObjectList.set(idx, lastChatMessage);
		}
		log.debug("lastMessageWithChatObjectList={}",lastMessageWithChatObjectList);	
		return lastMessageWithChatObjectList;
	}
	
	

	
}
