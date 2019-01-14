package team.lala.timebank.entity;


import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
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
	private YesNo readAlready;
	
//	@Column(name="FROM_MEMBER_PIC")
//	private String fromMemberPic; 
//	
//	@Column(name="TO_MEMBER_PIC")
//	private String toMemberPic;
	
//	@Column(name="FROM_NAME")
	@Transient 
	private String fromName; 
	
//	@Column(name="TO_NAME")
	@Transient 
	private String toName;
	


	@Override
	public String toString() {
		return "ChatMessage [id=" + id + ", text=" + text + ", time=" + time + ", fromAccount=" + fromAccount
				+ ", toAccount=" + toAccount + ", readAlready=" + readAlready +
				 ", fromName=" + fromName + ", toName=" + toName + 
				 "]";
	}

	public ChatMessage() {
	}

	public ChatMessage(String fromAccount, String toAccount) {
		super();
		this.fromAccount = fromAccount;
		this.toAccount = toAccount;
	}



	

	
	



	
	
	
	

	
}
