package team.lala.timebank.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import team.lala.timebank.entity.ChatMessage;

public interface ChatMessageDao extends JpaRepository<ChatMessage, Long>, JpaSpecificationExecutor<ChatMessage> {

}
