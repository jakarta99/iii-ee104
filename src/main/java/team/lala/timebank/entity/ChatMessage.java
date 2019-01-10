package team.lala.timebank.entity;


import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Entity
@Table(name="CHAT_CLIENT")
public class ChatMessage {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long id;

	@Column(name="TEXT")
	private String text;
	
	@DateTimeFormat(pattern = "yyyy/MM/dd")
	@Column(name="TIME")
	private Date time;	
	
	@Column(name="FROM_ACCOUNT")
	private String fromAccount;
	
	@Column(name="TO_ACCOUNT")
	private String toAccount;

	@Override
	public String toString() {
		return "ChatMessage [id=" + id + ", text=" + text + ", time=" + time + ", fromAccount=" + fromAccount
				+ ", toAccount=" + toAccount + "]";
	}

	public ChatMessage(String fromAccount, String toAccount,String text, Date time) {
		this.text = text;
		this.time = time;
		this.fromAccount = fromAccount;
		this.toAccount = toAccount;
	}

	public ChatMessage() {

	}
	
	

	



	
	
	
	

	
}