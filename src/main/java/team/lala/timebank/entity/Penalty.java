package team.lala.timebank.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Table(name="penalty")
public class Penalty {
	@Column(name="penalty_list_id")
	Integer penaltyListId ;
	
	@Column(name="order_list_id")
	Integer orderListId ;
	
	@Column(name="member_id")
	Integer memberId ;
	
	@Column(name="description")
	String description ;
	
	@Column(name="status")
	Integer status ;
	
	@Column(name="penalty_time_value")
	Integer penaltyTimeValue ;
	
	
	public Integer getPenaltyListId() {
		return penaltyListId;
	}
	public void setPenaltyListId(Integer penaltyListId) {
		this.penaltyListId = penaltyListId;
	}
	public Integer getOrderListId() {
		return orderListId;
	}
	public void setOrderListId(Integer orderListId) {
		this.orderListId = orderListId;
	}
	public Integer getMemberId() {
		return memberId;
	}
	public void setMemberId(Integer memberId) {
		this.memberId = memberId;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	public Integer getPenaltyTimeValue() {
		return penaltyTimeValue;
	}
	public void setPenaltyTimeValue(Integer penaltyTimeValue) {
		this.penaltyTimeValue = penaltyTimeValue;
	}
	

}
