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
import javax.persistence.Transient;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonManagedReference;

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
	@JoinColumn(name="VOLUNTEER_ID",    
			referencedColumnName="id") 
	private Member volunteer;
	
	@Transient
	private String volunteerId;
	
	@ManyToOne
	@JsonIgnoreProperties
	@JoinColumn(name="ORDER_STATUS",    
				referencedColumnName="id",  
				insertable=true, updatable=true)
	private OrderStatus orderStatus;
	
	@Transient
	private String orderStatusDetail;
	
	@DateTimeFormat(pattern = "yyyy/MM/dd" )
	@Column(name="VOLUNTEER_APPLY_TIME")
	private Date volunteerApplyTime;
	
	@DateTimeFormat(pattern = "yyyy/MM/dd" )
	@Column(name="ORDER_ACCEPT_TIME")
	private Date orderAcceptTime;
	
	@ManyToOne
	@JsonManagedReference
	@JoinColumn(name="mission",    
				referencedColumnName="id",  
				insertable=true, updatable=true) 
	private Mission mission;
	
	@Column(name="MEMBER_SCORE")
	private Long memberScore;
	
	@Column(name="FEEDBACK_SCORE")
	private Long feedBackScore;
	
	@Transient
	private String missionTitle;
	
	@Transient
	private String county;
	
	@Transient
	private String district;
	
	@Transient
	private String address;
	
	@Transient
	@DateTimeFormat(pattern = "yyyy/MM/dd")
	private Date startDate;// 工作開始時間
	
	@Transient
	@DateTimeFormat(pattern = "yyyy/MM/dd")
	private Date endDate;// 工作結束時間
	
	@Transient
	private Integer timeValue;// 可獲得時數(工作的時間)
	
	@Transient
	private Long status;
	
	@Transient
	private Long statusBegin;
	
	@Transient
	private Long statusEnd;

	@Override
	public String toString() {
		return "Order [id=" + id + ", volunteer=" + volunteer + ", volunteerId=" + volunteerId + ", orderStatus="
				+ orderStatus + ", orderStatusDetail=" + orderStatusDetail + ", volunteerApplyTime="
				+ volunteerApplyTime + ", orderAcceptTime=" + orderAcceptTime + ", mission=" + mission
				+ ", memberScore=" + memberScore + ", feedBackScore=" + feedBackScore + ", missionTitle=" + missionTitle
				+ ", county=" + county + ", district=" + district + ", address=" + address + ", startDate=" + startDate
				+ ", endDate=" + endDate + ", timeValue=" + timeValue + ", status=" + status + ", statusBegin="
				+ statusBegin + ", statusEnd=" + statusEnd + "]";
	}

}
