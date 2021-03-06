package team.lala.timebank.dao;


import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import team.lala.timebank.entity.ChatMessage;
import team.lala.timebank.enums.YesNo;

public interface ChatMessageDao extends JpaRepository<ChatMessage, Long>, JpaSpecificationExecutor<ChatMessage> {

		//查詢此帳號的所有聊天對象(回傳的Object[]內容為使用者帳號、聊天對象帳號、最後對話時間)
		@Query(value="select cm.from_account, cm.to_account, max(cm.time) as maxtime "+
		"from ((SELECT cmsg.id, cmsg.from_Account, cmsg.to_Account, cmsg.read_Already, cmsg.text, cmsg.time "+
	    "FROM Chat_Message cmsg  WHERE from_Account=?1 ) union "+
		"(SELECT  cmsg.id ,cmsg.to_Account,cmsg.from_Account,cmsg.read_Already, cmsg.text , cmsg.time "+
	    "FROM Chat_Message cmsg WHERE to_Account=?1 )) as cm "+    
	    "GROUP BY cm.from_Account, cm.to_Account "  +
	    "ORDER BY maxtime DESC" , nativeQuery=true)
		public List<Object[]> findChatObjectsByUserAccountOrderByLastChatTime(String account); 
	
		//查詢此帳號的所有聊天訊息
		@Query("SELECT cmsg FROM ChatMessage cmsg WHERE cmsg.fromAccount=?1 OR cmsg.toAccount=?1")
		public List<ChatMessage> findAllChatMessagesByAccount(String account); 
		
		//查詢此帳號的所有聊天訊息
		@Query("SELECT count(id) FROM ChatMessage cmsg WHERE (cmsg.fromAccount=?1 OR cmsg.toAccount=?1) AND cmsg.readAlready=?2")
		public Integer findAllChatMessagesByAccountAndReadAlreadyStatus(String account,String readAlready); 
		
		//查詢兩個帳號間的聊天訊息
		@Query(value ="SELECT * FROM CHAT_MESSAGE cmsg " +
				"WHERE cmsg.FROM_ACCOUNT in ( ?1 , ?2 ) AND cmsg.TO_ACCOUNT in (?1 , ?2)", nativeQuery= true)
		public List<ChatMessage> findChatMessagesBetweenTwoAccounts(String account1, String account2);

		//更新兩個帳號間聊天訊息的已讀狀態(需判斷點擊窗口的人為誰)
		@Modifying
		@Query(value ="Update CHAT_MESSAGE SET READ_ALREADY=?3 " +
				"WHERE TO_ACCOUNT=?1 AND FROM_ACCOUNT=?2 ", nativeQuery= true)
		public void updateChatMessagesReadAlreadyStatusBetweenTwoAccounts(String formAccount, String toAccount,String yesno );
		
		@Query(value ="SELECT Top(1) * FROM CHAT_MESSAGE cmsg " +
				"WHERE cmsg.FROM_ACCOUNT in ( ?1 , ?2 ) AND cmsg.TO_ACCOUNT in (?1 , ?2)"+
				"ORDER BY cmsg.TIME DESC", nativeQuery= true)
		public ChatMessage findLastChatMessageBetweenTwoAccounts(String account1, String account2);
		
	
}
