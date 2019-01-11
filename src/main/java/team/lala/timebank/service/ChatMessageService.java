package team.lala.timebank.service;

import java.util.List;

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
		Member toMember = memberDao.findByAccount(chatMessage.getToAccount());
		Member fromMember =  memberDao.findByAccount(chatMessage.getFromAccount());
		//為了解決hibernate懶加載問題，此System.out不可刪除
//		System.out.println(toMember);
//		System.out.println(fromMember);
		chatMessage.setToMemberPic(toMember.getPicture());
		chatMessage.setFromMemberPic(fromMember.getPicture());
		return chatMessageDao.save(chatMessage);
	}
	
}
