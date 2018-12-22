package team.lala.timebank.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import lombok.Getter;
import lombok.Setter;
import team.lala.timebank.enums.YesNo;

@Getter
@Setter
@Entity
@Table(name="ORDER_LIST")
public class Order{
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long id;

	@Column(name="VOLUNTEER_ID")
	private Long volunteerId;
	
	@Column(name="SERVICE_REQUESTER_ID")
	private Long serviceRequesterId;
	
	@Enumerated(EnumType.STRING)
	@Column(name="ORDER_ACCEPTION")
	private YesNo orderAcception;
	
	@Enumerated(EnumType.STRING)
	@Column(name="ORDER_CONFIRMATION")
	private YesNo orderConfirmation;
	
	@Column(name="STATUS")
	private String status;
	
	@ManyToOne
	@JoinColumn(name="mission",    
				referencedColumnName="id",  
				insertable=true, updatable=true) 
	private Mission mission;

	@Override
	public String toString() {
		return "Order [id=" + id + ", volunteerId=" + volunteerId + ", serviceRequesterId=" + serviceRequesterId
				+ ", orderAcception=" + orderAcception + ", orderConfirmation=" + orderConfirmation + ", status="
				+ status + ", mission=" + mission + "]";
	}  
	
	

	

}
