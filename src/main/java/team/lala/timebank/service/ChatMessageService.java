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
	
	//找出此使用者所有的聊天對象
	@Transactional(readOnly=true)
	public List<Member> findChatObjectsByAccount(String account){	
		List<ChatMessage> chatObjectList = chatMessageDao.findChatObjectsByAccount(account);
		log.debug("chatObjectList={}",chatObjectList);
		List<String> chatObjectsSet = new ArrayList<>();
		for (ChatMessage chatObject:chatObjectList) {
			System.out.println("chatObject="+chatObject);
			if (chatObjectsSet.contains(chatObject.getFromAccount()) ) {
				chatObjectsSet.remove(chatObject.getFromAccount());
			} else if (chatObjectsSet.contains(chatObject.getToAccount())) {
				chatObjectsSet.remove(chatObject.getToAccount());
			}
			
			if (!chatObject.getFromAccount().equals(account)) {
				chatObjectsSet.add(chatObject.getFromAccount());				
			} else if (!chatObject.getToAccount().equals(account)) {
				chatObjectsSet.add(chatObject.getToAccount());
			}
			
			System.out.println("set="+chatObjectsSet);
		}
		log.debug("chatObjectsSet={}",chatObjectsSet);
		List<Member> list = memberDao.findMembersByListOfAccounts(chatObjectsSet, em);
		List<Member> memberList = new ArrayList<>();
		for (Member m :list) {
			int idx = chatObjectsSet.indexOf(m.getAccount());
			memberList.set(idx, m);
		}
		log.debug("memberList={}",memberList);	
		return memberList;
	}
	
	

	
}
