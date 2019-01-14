package team.lala.timebank.dao;


import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;

import team.lala.timebank.entity.ChatMessage;

public interface ChatMessageDao extends JpaRepository<ChatMessage, Long>, JpaSpecificationExecutor<ChatMessage> {

	

		//查詢此帳號的所有聊天對象
		@Query(value="(SELECT cmsg.id ,cmsg.from_Account ,cmsg.to_Account,cmsg.read_Already,cmsg.text,cmsg.time "+  
				"FROM Chat_Message cmsg  WHERE  from_Account=?1) "+
				"union (SELECT cmsg.id ,cmsg.to_Account, cmsg.from_Account, cmsg.read_Already,cmsg.text ,cmsg.time "+  
				"FROM Chat_Message cmsg  WHERE to_Account=?1 )"+
				"order by to_Account, time" , nativeQuery = true)
		public List<ChatMessage> findChatObjectsByAccount(String account); 
	
	
		//查詢此帳號的所有聊天對象
//		@Query("SELECT new team.lala.timebank.entity.ChatMessage(cmsg.fromAccount, cmsg.toAccount)" +
//	           "FROM ChatMessage cmsg " + 
//	           "WHERE cmsg.fromAccount= ?1 or cmsg.toAccount=?1 " +
//	           "GROUP BY cmsg.fromAccount, cmsg.toAccount")
//		public List<ChatMessage> findChatObjectsByAccount(String account); 
	
		//查詢此帳號的所有聊天訊息
		@Query("SELECT cmsg FROM ChatMessage cmsg WHERE cmsg.fromAccount=?1 OR cmsg.toAccount=?1")
		public List<ChatMessage> findAllChatMessagesByAccount(String account); 
		
		//查詢兩個帳號間的聊天訊息
		@Query(value ="SELECT * FROM CHAT_MESSAGE cmsg " +
				"WHERE cmsg.FROM_ACCOUNT in ( ?1 , ?2 ) AND cmsg.TO_ACCOUNT in (?1 , ?2)", nativeQuery= true)
		public List<ChatMessage> findChatMessagesBetweenTwoAccounts(String account1, String account2);
	
		
	
}
