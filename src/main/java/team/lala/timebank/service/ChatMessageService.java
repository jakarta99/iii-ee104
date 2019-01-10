package team.lala.timebank.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import team.lala.timebank.dao.ChatMessageDao;
import team.lala.timebank.entity.ChatMessage;
import team.lala.timebank.spec.ChatMessageSpecification;

@Service
public class ChatMessageService {

	@Autowired
	private ChatMessageDao chatMessageDao;
	
	public List<ChatMessage> findChatMessagesBetweenFromAndTo(ChatMessage chatMessage){
		ChatMessageSpecification spec = new ChatMessageSpecification(chatMessage);
		return chatMessageDao.findAll(spec);
	}
	
	
	public ChatMessage insert(ChatMessage chatMessage) {
		return chatMessageDao.save(chatMessage);
	}
	
}
