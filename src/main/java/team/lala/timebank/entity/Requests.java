package team.lala.timebank.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "requests")
public class Requests {
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Id
	private Long requestListId;// 工作ID

	@Column(name = "memberID", nullable = false)
	private String memberID; // 刊登者

	@Column(name = "jobTitle", nullable = false, length = 50)
	private String jobTitle;// 活動名稱

	@Column(name = "timeValue", nullable = false)
	private Integer timeValue;// 可獲得時數(工作的時間)

	@Column(name = "jobArea", nullable = false)
	private Integer jobArea;// 工作地點

	@Column(name = "termType", nullable = false)
	private Integer termType;// 長短期

	@Column(name = "serviceType", nullable = false)
	private Integer serviceType;// 服務類型

	@Column(name = "jobStartDateTime", nullable = false)
	private java.util.Date jobStartDateTime;// 工作開始時間

	@Column(name = "jobEndDateTime", nullable = false)
	private java.util.Date jobEndDateTime;// 工作開始時間

	
	
	public Long getRequestListId() {
		return requestListId;
	}



	public void setRequestListId(Long requestListId) {
		this.requestListId = requestListId;
	}



	public String getMemberID() {
		return memberID;
	}



	public void setMemberID(String memberID) {
		this.memberID = memberID;
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



	public Integer getJobArea() {
		return jobArea;
	}



	public void setJobArea(Integer jobArea) {
		this.jobArea = jobArea;
	}



	public Integer getTermType() {
		return termType;
	}



	public void setTermType(Integer termType) {
		this.termType = termType;
	}



	public Integer getServiceType() {
		return serviceType;
	}



	public void setServiceType(Integer serviceType) {
		this.serviceType = serviceType;
	}



	public java.util.Date getJobStartDateTime() {
		return jobStartDateTime;
	}



	public void setJobStartDateTime(java.util.Date jobStartDateTime) {
		this.jobStartDateTime = jobStartDateTime;
	}



	public java.util.Date getJobEndDateTime() {
		return jobEndDateTime;
	}



	public void setJobEndDateTime(java.util.Date jobEndDateTime) {
		this.jobEndDateTime = jobEndDateTime;
	}



	@Override
	public String toString() {

		return "Requests [requestListId=" + requestListId + ", memberID=" + memberID + ", jobTitle=" + jobTitle
				+ ", timeValue=" + timeValue + ", termType" + termType + ", serviceType" + serviceType
				+ ", jobStartDateTime" + jobStartDateTime + ", jobEndDateTime" + jobEndDateTime + "]";
	}

}
