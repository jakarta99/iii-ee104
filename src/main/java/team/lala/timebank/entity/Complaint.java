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

import lombok.Getter;
import lombok.Setter;
import team.lala.timebank.enums.ComplaintType;

@Getter
@Setter
@Entity
@Table(name="COMPLAINT")
public class Complaint {

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long id;
	
	@Column(name="ORDER_ID")
	private Long orderId;
	
	@Column(name="MEMBER_ID")
	private Long memberId;
	
	@Column(name="PENALTY_ID")
	private Long penaltyId;
	
	@Column(name="COMPLAINTTIME")
	private Date complaintTime;
	
	@Enumerated(EnumType.STRING)
	@Column(name="COMPLAINTTYPE")
	private ComplaintType complaintType;
	
	@Column(name="DESCRIPTION")
	private String description;
	
}
