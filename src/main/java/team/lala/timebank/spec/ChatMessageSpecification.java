package team.lala.timebank.spec;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import org.springframework.data.jpa.domain.Specification;
import org.springframework.util.StringUtils;

import lombok.extern.slf4j.Slf4j;
import team.lala.timebank.entity.ChatMessage;

@Slf4j
@SuppressWarnings("serial")
public class ChatMessageSpecification implements Specification<ChatMessage> {
	private ChatMessage chatMessage;
	
	public ChatMessageSpecification(ChatMessage chatMessage) {
		this.chatMessage = chatMessage;
	}

	@Override
	public Predicate toPredicate(Root<ChatMessage> root, CriteriaQuery<?> query,
			CriteriaBuilder criteriaBuilder) {
		List<Predicate> list = new ArrayList<Predicate>();
		
		//透過兩人的帳號，找出兩人間的所有聊天訊息
		if (!StringUtils.isEmpty(chatMessage.getFromAccount()) && !StringUtils.isEmpty(chatMessage.getToAccount())) {
			list.add(criteriaBuilder.in(root.get("fromAccount").as(String.class)).value(chatMessage.getFromAccount()).value(chatMessage.getToAccount()));
			list.add(criteriaBuilder.in(root.get("toAccount").as(String.class)).value(chatMessage.getFromAccount()).value(chatMessage.getToAccount()));
			log.debug("找出兩人間的");
			Predicate[] p = new Predicate[list.size()];
			return criteriaBuilder.and(list.toArray(p));
		} 		
		//透過使用者帳號找出此使用者的所有聊天訊息
		else if (!StringUtils.isEmpty(chatMessage.getFromAccount()) && chatMessage.getToAccount() == null ) {
			list.add(criteriaBuilder.equal(root.get("fromAccount").as(String.class),  chatMessage.getFromAccount()));
			list.add(criteriaBuilder.equal(root.get("toAccount").as(String.class),  chatMessage.getFromAccount()));
			log.debug("找出此使用者的所有聊天訊息");
			Predicate[] p = new Predicate[list.size()];
			return criteriaBuilder.or(list.toArray(p));
		}
		else {
			log.debug("兩種情況皆非");
			Predicate[] p = new Predicate[list.size()];
			return criteriaBuilder.and(list.toArray(p));
		}
		
		
	}

}
