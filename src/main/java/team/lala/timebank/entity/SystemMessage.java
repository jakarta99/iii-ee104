package team.lala.timebank.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import lombok.Getter;
import lombok.Setter;
import team.lala.timebank.enums.SystemMessageType;
import team.lala.timebank.enums.YesNo;

@Getter
@Setter
@Entity
@Table(name="SYSTEM_MESSAGE")
public class SystemMessage {

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long id;
	
	@ManyToOne
	@JoinColumn(name="MEMBER_ID",
				referencedColumnName="id",  
				insertable=true, updatable=true) 
	private Member member;
	
	@ManyToOne
	@JoinColumn(name="SENDER_ID",
				referencedColumnName="id",  
				insertable=true, updatable=true) 
	private Member sender;
	
	@ManyToOne
	@JoinColumn(name="ORDER_ID",
				referencedColumnName="id",  
				insertable=true, updatable=true) 
	private Order order;
	
	
	@Column(name="RELEASE_TIME")
	private Date releaseTime;
	
	@Enumerated(EnumType.STRING)
	@Column(name="MESSAGE_TYPE")
	private SystemMessageType messageType;//之後改ENUM，還沒完全確定訊息類型種類(懲罰、核發時數通知、申訴結果)
	
	@Column(name="MESSAGE")
	private String message;
	
	@Enumerated(EnumType.STRING)
	@Column(name="READ_STATUS")
	private YesNo readStatus;
	
	@Override
	public String toString() {
		return "SystemMessage [id=" + id + ", member=" + member + ", Sender=" + sender + ", ReleaseTime=" + releaseTime
				+ ", MessageType=" + messageType + ", message=" + message + ", readStatus=" + readStatus + "]";
	}

}
