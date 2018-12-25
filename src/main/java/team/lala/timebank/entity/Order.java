package team.lala.timebank.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonBackReference;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Entity
@Table(name="ORDER_LIST")
public class Order{
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long id;
	
	@ManyToOne
	@JoinColumn(name="VOLUNTEER",    
			referencedColumnName="id") 
	private Member volunteer;
	
	@ManyToOne
//	@JsonBackReference 
	@JoinColumn(name="ORDER_STATUS",    
				referencedColumnName="id",  
				insertable=true, updatable=true)
	private OrderStatus orderStatus;
	
	@DateTimeFormat(pattern = "yyyy/MM/dd HH:mm" )
	@Column(name="VOLUNTEER_APPLY_TIME")
	private Date volunteerApplyTime;
	
	@DateTimeFormat(pattern = "yyyy/MM/dd HH:mm" )
	@Column(name="ORDER_ACCEPT_TIME")
	private Date orderAcceptTime;
	
	@ManyToOne
	@JsonBackReference 
	@JoinColumn(name="mission",    
				referencedColumnName="id",  
				insertable=true, updatable=true) 
	private Mission mission;
	
	@Column(name="MEMBER_SCORE")
	private Long memberScore;
	
	@Column(name="FEEDBACK_SCORE")
	private Long feedBackScore;

	@Override
	public String toString() {
		return "Order [id=" + id + ", volunteer=" + volunteer + ", orderStatus=" + orderStatus + ", volunteerApplyTime="
				+ volunteerApplyTime + ", orderAcceptTime=" + orderAcceptTime + ", mission=" + mission
				+ ", memberScore=" + memberScore + ", feedBackScore=" + feedBackScore + "]";
	}
	


}
