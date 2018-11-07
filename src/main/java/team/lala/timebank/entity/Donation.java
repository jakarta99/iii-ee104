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
	@GeneratedValue(strategy = GenerationType.AUTO) // ID生成的策略
	@Id
	private Long id;

	@Column(name = "donation_list_id")
	private Long donationListId;

	@Column(name = "member_id")
	private Long memberId;

	@Column(name = "donate_organization_id")
	private Long donateOrganizationId;

	@Column(name = "donate_value")
	private Integer donateValue;

	@Column(name = "donate_time")
	private LocalDateTime donateTime;

	public void setId(Long id) {
		this.id = id;
	}

	public Long getId() {
		return id;
	}

	public void setDonationListId(Long donationListId) {
		this.donationListId = donationListId;
	}

	public Long getDonationListId() {
		return donationListId;
	}

	public void setMemberId(Long memberId) {
		this.memberId = memberId;
	}

	public Long getMemberId() {
		return memberId;
	}

	public void setDonateOrganizationId(Long donateOrganizationId) {
		this.donateOrganizationId = donateOrganizationId;
	}

	public Long getDonateOrganizationId() {
		return donateOrganizationId;
	}

	public void setDonateValue(Integer donateValue) {
		this.donateValue = donateValue;
	}

	public Integer getDonateValue() {
		return donateValue;
	}

	public void setDonateTime(LocalDateTime donateTime) {
		this.donateTime = donateTime;
	}

	public LocalDateTime getDonateTime() {
		return donateTime;
	}

	@Override
	public String toString() {
		return "Donation [id=" + id + ", donationListId" + donationListId + ", memberId=" + memberId
				+ ", donateOrganizationId=" + donateOrganizationId + ", donateValue=" + donateValue + ", donateTime="
				+ donateTime + "]";
	}
}
