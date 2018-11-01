package team.lala.timebank.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
@Entity
@Table(name="Job")
public class Job {
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Id
	private Long id;// 工作ID
	
	@Column(name="requester")
	private String requester; // 刊登者

	@Column(name="jobTitle")
	private String jobTitle;// 活動名稱

	@Column(name="timeValue")
	private Integer timeValue;// 可獲得時數(工作的時間)

	
	
	
//	private LocalDateTime postedDay;// po文&徵人日期
//
//	private LocalDateTime postedEndDay;// 徵人結束文日期
//
//	private LocalDateTime jobStartDay;// 工作開始日期
//
//	private LocalDateTime jobEndDay;// 工作結束日期
//
//	private String jobLocation;// 工作地點
//
//	private String serviceType;// 服務類別
//
//	private String contactPerson;// 聯絡人
//
//	private String contactTel;// 聯絡電話
//
//	private String contactEmail;// 聯絡信箱

	

	public Long getId() {
		return id;
	}




	public void setId(Long id) {
		this.id = id;
	}




	public String getRequester() {
		return requester;
	}




	public void setRequester(String requester) {
		this.requester = requester;
	}




	public String getJobTitle() {
		return jobTitle;
	}




	public void setJobTitle(String jobTitle) {
		this.jobTitle = jobTitle;
	}




	public Integer getTimeValue() {
		return timeValue;
	}




	public void setTimeValue(Integer timeValue) {
		this.timeValue = timeValue;
	}




	@Override
	public String toString() {

		return "Job [id=" + id + ", requester=" + requester + ", jobTitle=" + jobTitle + ", timeValue="
				+ timeValue + "]";
	}

//	public LocalDateTime getPostedDay() {
//		return postedDay;
//	}
//
//	public void setPostedDay(LocalDateTime postedDay) {
//		this.postedDay = postedDay;
//	}
//
//	public LocalDateTime getPostedEndDay() {
//		return postedEndDay;
//	}
//
//	public void setPostedEndDay(LocalDateTime postedEndDay) {
//		this.postedEndDay = postedEndDay;
//	}
//
//	public LocalDateTime getJobStartDay() {
//		return jobStartDay;
//	}
//
//	public void setJobStartDay(LocalDateTime jobStartDay) {
//		this.jobStartDay = jobStartDay;
//	}
//
//	public LocalDateTime getJobEndDay() {
//		return jobEndDay;
//	}
//
//	public void setJobEndDay(LocalDateTime jobEndDay) {
//		this.jobEndDay = jobEndDay;
//	}
//
//	public String getJobLocation() {
//		return jobLocation;
//	}
//
//	public void setJobLocation(String jobLocation) {
//		this.jobLocation = jobLocation;
//	}
//
//	public String getServiceType() {
//		return serviceType;
//	}
//
//	public void setServiceType(String serviceType) {
//		this.serviceType = serviceType;
//	}
//
//	public String getContactPerson() {
//		return contactPerson;
//	}
//
//	public void setContactPerson(String contactPerson) {
//		this.contactPerson = contactPerson;
//	}
//
//	public String getContactTel() {
//		return contactTel;
//	}
//
//	public void setContactTel(String contactTel) {
//		this.contactTel = contactTel;
//	}
//
//	public String getContactEmail() {
//		return contactEmail;
//	}
//
//	public void setContactEmail(String contactEmail) {
//		this.contactEmail = contactEmail;
//	}

}
