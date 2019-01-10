package team.lala.timebank.spec;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.util.StringUtils;
import team.lala.timebank.entity.ChatMessage;
import team.lala.timebank.entity.Member;


@SuppressWarnings("serial")
public class ChatMessageSpecification implements Specification<ChatMessage> {
	private ChatMessage chatOutputMessage;
	
	public ChatMessageSpecification(ChatMessage chatOutputMessage) {
		this.chatOutputMessage = chatOutputMessage;
	}

	@Override
	public Predicate toPredicate(Root<ChatMessage> root, CriteriaQuery<?> query,
			CriteriaBuilder criteriaBuilder) {
		List<Predicate> list = new ArrayList<Predicate>();
	
		if (!StringUtils.isEmpty(chatOutputMessage.getFromAccount()) && !StringUtils.isEmpty(chatOutputMessage.getToAccount())) {
			list.add(criteriaBuilder.in(root.get("fromAccount").as(String.class)).value(chatOutputMessage.getFromAccount()).value(chatOutputMessage.getToAccount()));
			list.add(criteriaBuilder.in(root.get("toAccount").as(String.class)).value(chatOutputMessage.getFromAccount()).value(chatOutputMessage.getToAccount()));
		}
		
		Predicate[] p = new Predicate[list.size()];
		return criteriaBuilder.and(list.toArray(p));
	}

}
