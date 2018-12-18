package team.lala.timebank.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name = "PENALTY")
public class Penalty {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	private Long id;

	@Column(name = "order_list_id")
	private Long orderListId;

	@Column(name = "member_id")
	private Long memberId;

	@Column(name = "update_date")
	@DateTimeFormat(pattern = "yyyy/MM/dd")
	private Date updateDate;

	@Column(name = "description", length = 50)
	private String description;

	@Column(name = "status")
	private Integer status;

	@Column(name = "penalty_time_value")
	private Integer penaltyTimeValue;
	
	@Transient
	@DateTimeFormat(pattern = "yyyy/MM/dd")
	private Date dateBefore;

	@Transient
	@DateTimeFormat(pattern = "yyyy/MM/dd")
	private Date dateAfter;

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

	public Date getUpdateDate() {
		return updateDate;
	}

	public void setUpdateDate(Date updateDate) {
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

	public Date getDateBefore() {
		return dateBefore;
	}

	public void setDateBefore(Date dateBefore) {
		this.dateBefore = dateBefore;
	}

	public Date getDateAfter() {
		return dateAfter;
	}

	public void setDateAfter(Date dateAfter) {
		this.dateAfter = dateAfter;
	}



	

}
