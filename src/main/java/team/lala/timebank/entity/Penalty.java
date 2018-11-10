package team.lala.timebank.entity;

import java.time.LocalDateTime;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "PENALTY")
public class Penalty {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;

	@Column(name = "order_list_id")
	private Long orderListId;

	@Column(name = "member_id")
	private Long memberId;

	@Column(name = "update_date")
	private LocalDateTime updateDate;

	@Column(name = "description")
	String description;

	@Column(name = "status")
	Integer status;

	@Column(name = "penalty_time_value")
	Integer penaltyTimeValue;

	public String toString() {
		return "Penalty [id=" + id + ", orderListId=" + orderListId + ", memberId=" + memberId + ", updateDate="
				+ updateDate + ", description=" + description + ", status=" + status + ", penaltyTimeValue="
				+ penaltyTimeValue + "]";
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Long getOrderListId() {
		return orderListId;
	}

	public void setOrderListId(Long orderListId) {
		this.orderListId = orderListId;
	}

	public Long getMemberId() {
		return memberId;
	}

	public void setMemberId(Long memberId) {
		this.memberId = memberId;
	}

	public LocalDateTime getUpdateDate() {
		return updateDate;
	}

	public void setUpdateDate(LocalDateTime updateDate) {
		this.updateDate = updateDate;
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
