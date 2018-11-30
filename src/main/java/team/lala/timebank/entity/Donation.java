package team.lala.timebank.entity;

import java.time.LocalDateTime;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

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
	private LocalDateTime donateTime;

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

	public LocalDateTime getDonateTime() {
		return donateTime;
	}

	public void setDonateTime(LocalDateTime donateTime) {
		this.donateTime = donateTime;
	}

	@Override
	public String toString() {
		return "Donation [id=" + id + ", memberId=" + memberId + ", organizationId=" + organizationId + ", value="
				+ value + ", donateTime=" + donateTime + "]";
	}


}
