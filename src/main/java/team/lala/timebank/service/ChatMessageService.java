package team.lala.timebank.service;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import lombok.extern.slf4j.Slf4j;
import team.lala.timebank.dao.ChatMessageDao;
import team.lala.timebank.dao.MemberDao;
import team.lala.timebank.entity.ChatMessage;
import team.lala.timebank.entity.Member;
import team.lala.timebank.spec.ChatMessageSpecification;
@Slf4j
@Service
@Transactional
public class ChatMessageService {

	@Autowired
	private ChatMessageDao chatMessageDao;
	
	@Autowired
	private MemberDao memberDao;
	
	@Transactional(readOnly=true)
	public List<ChatMessage> findChatMessagesBetweenFromAndTo(ChatMessage chatMessage){
		ChatMessageSpecification spec = new ChatMessageSpecification(chatMessage);
		return chatMessageDao.findAll(spec);
	}
	
	public ChatMessage insert(ChatMessage chatMessage) {
//		Member toMember = memberDao.findByAccount(chatMessage.getToAccount());
//		Member fromMember =  memberDao.findByAccount(chatMessage.getFromAccount());
//		chatMessage.setToMemberPic(toMember.getPicture());
//		chatMessage.setFromMemberPic(fromMember.getPicture());
		return chatMessageDao.save(chatMessage);
	}
	
	@Transactional(readOnly=true)
	public List<ChatMessage> findAllChatMessageByAccount(String userAccount){
		ChatMessage chatMessage = new ChatMessage();
		chatMessage.setFromAccount(userAccount);
		log.debug("service:chatMessage={}",chatMessage);
		ChatMessageSpecification spec = new ChatMessageSpecification(chatMessage);
		//將訊息依對方帳戶分類
		List<ChatMessage> chatMessageList = chatMessageDao.findAll(spec);
		Set<String> accountSet = new HashSet<>();
		for (ChatMessage chatMsg:chatMessageList) {
			accountSet.add(chatMsg.getFromAccount());
			accountSet.add(chatMsg.getToAccount());
			
		}
		return chatMessageList;
	}
	

	
}
