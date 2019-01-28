package team.lala.timebank.entity;


import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

import lombok.Getter;
import lombok.Setter;
import team.lala.timebank.enums.YesNo;

@Getter
@Setter
@Entity
@Table(name="CHAT_MESSAGE")
public class ChatMessage {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long id;

	@Column(name="TEXT")
	private String text;
	
	@Column(name="TIME")
	private Date time;		
	
	@Column(name="FROM_ACCOUNT")
	private String fromAccount;
	
	@Column(name="TO_ACCOUNT")
	private String toAccount;
	
	@Column(name="READ_ALREADY")
	private String readAlready;
	
	@Transient 
	private String fromMemberPic; 

	@Transient 
	private String toMemberPic;
	
	@Transient 
	private String fromName; 
	
	@Transient 
	private String toName;
	
	@Transient 
	private Integer unreadMessageCount;
	


	public ChatMessage() {
	}

	public ChatMessage(String fromAccount, String toAccount) {
		super();
		this.fromAccount = fromAccount;
		this.toAccount = toAccount;
	}

	@Override
	public String toString() {
		return "ChatMessage [id=" + id + ", text=" + text + ", time=" + time + ", fromAccount=" + fromAccount
				+ ", toAccount=" + toAccount + ", readAlready=" + readAlready + ", fromMemberPic=" + fromMemberPic
				+ ", toMemberPic=" + toMemberPic + ", fromName=" + fromName + ", toName=" + toName
				+ ", unreadMessageCount=" + unreadMessageCount + "]";
	}

	

	

	
	



	
	
	
	

	
}
