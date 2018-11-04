package team.lala.timebank.entity;

public class penalty {
	Integer penaltyListId ;
	Integer orderListId ;
	Integer memberId ;
	String description ;
	Integer status ;
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
