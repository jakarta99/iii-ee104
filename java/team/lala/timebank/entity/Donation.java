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
@Table(name = "Donation")
public class Donation {
	@GeneratedValue(strategy = GenerationType.IDENTITY) // ID生成的策略
	@Id
	private Long id;

	@Column(name = "member_id")
	private Long memberId;

	@Column(name = "organization_id")
	private Long organizationId;

	@Column(name = "value")
	private Integer value;
	
	
	@Column(name = "donate_time")
	@DateTimeFormat(pattern = "yyyy/MM/dd")
	private Date donateTime;

	@Transient
	@DateTimeFormat(pattern = "yyyy/MM/dd")
	private Date donateTimeBegin;

	@Transient
	@DateTimeFormat(pattern = "yyyy/MM/dd")
	private Date donateTimeEnd;

	public Date getDonateTimeBegin() {
		return donateTimeBegin;
	}

	public void setDonateTimeBegin(Date donateTimeBegin) {
		this.donateTimeBegin = donateTimeBegin;
	}

	public Date getDonateTimeEnd() {
		return donateTimeEnd;
	}

	public void setDonateTimeEnd(Date donateTimeEnd) {
		this.donateTimeEnd = donateTimeEnd;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Long getMemberId() {
		return memberId;
	}

	public void setMemberId(Long memberId) {
		this.memberId = memberId;
	}

	public Long getOrganizationId() {
		return organizationId;
	}

	public void setOrganizationId(Long organizationId) {
		this.organizationId = organizationId;
	}

	public Integer getValue() {
		return value;
	}

	public void setValue(Integer value) {
		this.value = value;
	}

	public Date getDonateTime() {
		return donateTime;
	}

	public void setDonateTime(Date donateTime) {
		this.donateTime = donateTime;
	}

	@Override
	public String toString() {
		return "Donation [id=" + id + ", memberId=" + memberId + ", organizationId=" + organizationId + ", value="
				+ value + ", donateTime=" + donateTime + "]";
	}

}
