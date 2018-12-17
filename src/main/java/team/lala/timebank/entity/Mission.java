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
import javax.validation.constraints.Past;

import org.springframework.format.annotation.DateTimeFormat;

import team.lala.timebank.enums.TermType;

@Entity
@Table(name = "mission")
public class Mission {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	@Column(name = "member_Id", nullable = false)
	private Long memberId; // 刊登者

	@Column(name = "title", nullable = false, length = 50)
	private String title;// 活動名稱

	@Column(name = "time_Value", nullable = false)
	private Integer timeValue;// 可獲得時數(工作的時間)

	@Enumerated(EnumType.STRING)
	@Column(name = "term_Type", nullable = false)
	private TermType termType;// 長短期

	@Column(name = "service_Type", nullable = false)
	private Integer serviceType;// 服務類型

	@Column(name = "publish_Date", nullable = false)
	@Past
	@DateTimeFormat(pattern = "yyyy/MM/dd")
	private Date publishDate;

	@Column(name = "start_Date", nullable = false)
	@Past
	@DateTimeFormat(pattern = "yyyy/MM/dd HH:mm")
	private Date startDate;// 工作開始時間

	@Column(name = "end_Date", nullable = false)
	@Past
	@DateTimeFormat(pattern = "yyyy/MM/dd HH:mm")
	private Date endDate;// 工作開始時間

	@Column(name = "people_Needed", nullable = false)
	private Integer peopleNeeded;

	@Column(name = "contact_Person", nullable = false, length = 20)
	private String contactPerson;

	@Column(name = "contact_Phone", nullable = false, length = 20)
	private String contactPhone;

	@Column(name = "contact_Email", nullable = false, length = 20)
	private String contactEmail;

	@Column(name = "discription", nullable = false, length = 300)
	private String discription;

	@Column(name = "county", nullable = false)
	private String county;

	@Column(name = "district", nullable = false)
	private String district;

	@Column(name = "address", nullable = false)
	private String address;

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

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public Integer getTimeValue() {
		return timeValue;
	}

	public void setTimeValue(Integer timeValue) {
		this.timeValue = timeValue;
	}

	public TermType getTermType() {
		return termType;
	}

	public void setTermType(TermType termType) {
		this.termType = termType;
	}

	public Integer getServiceType() {
		return serviceType;
	}

	public void setServiceType(Integer serviceType) {
		this.serviceType = serviceType;
	}

	public Date getPublishDate() {
		return publishDate;
	}

	public void setPublishDate(Date publishDate) {
		this.publishDate = publishDate;
	}

	public Date getStartDate() {
		return startDate;
	}

	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}

	public Date getEndDate() {
		return endDate;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}

	public Integer getPeopleNeeded() {
		return peopleNeeded;
	}

	public void setPeopleNeeded(Integer peopleNeeded) {
		this.peopleNeeded = peopleNeeded;
	}

	public String getContactPerson() {
		return contactPerson;
	}

	public void setContactPerson(String contactPerson) {
		this.contactPerson = contactPerson;
	}

	public String getContactPhone() {
		return contactPhone;
	}

	public void setContactPhone(String contactPhone) {
		this.contactPhone = contactPhone;
	}

	public String getContactEmail() {
		return contactEmail;
	}

	public void setContactEmail(String contactEmail) {
		this.contactEmail = contactEmail;
	}

	public String getDiscription() {
		return discription;
	}

	public void setDiscription(String discription) {
		this.discription = discription;
	}

	public String getCounty() {
		return county;
	}

	public void setCounty(String county) {
		this.county = county;
	}

	public String getDistrict() {
		return district;
	}

	public void setDistrict(String district) {
		this.district = district;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	@Override
	public String toString() {
		return "Mission [id=" + id + ", memberId=" + memberId + ", title=" + title + ", timeValue=" + timeValue
				+ ", termType=" + termType + ", serviceType=" + serviceType + ", publishDate=" + publishDate
				+ ", startDate=" + startDate + ", endDate=" + endDate + ", peopleNeeded=" + peopleNeeded
				+ ", contactPerson=" + contactPerson + ", contactPhone=" + contactPhone + ", contactEmail="
				+ contactEmail + ", discription=" + discription + ", county=" + county + ", district=" + district
				+ ", address=" + address + "]";
	}

	
	
	
	
}
