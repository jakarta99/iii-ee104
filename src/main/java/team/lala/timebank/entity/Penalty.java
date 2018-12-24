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

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
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


}
