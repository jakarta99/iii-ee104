package team.lala.timebank.entity;

import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "requests")
public class Requests {
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Id
	@Column(name = "request_List_Id") //Jasmine:作為PK的id，需要join table時，則Column的Annotation(對應資料表的欄位名稱)必加。
	private Long id;// 工作ID

	@OneToMany(mappedBy="request")
	private Set<Order> orders;
	

	@Column(name = "member_Id", nullable = false)
	private String memberId; // 刊登者

	@Column(name = "job_Title", nullable = false, length = 50)
	private String jobTitle;// 活動名稱

	@Column(name = "time_Value", nullable = false)
	private Integer timeValue;// 可獲得時數(工作的時間)

	@Column(name = "job_Area", nullable = false)
	private Integer jobArea;// 工作地點

	@Column(name = "term_Type", nullable = false)
	private Integer termType;// 長短期

	@Column(name = "service_Type", nullable = false)
	private Integer serviceType;// 服務類型

//	@Column(name = "jobStartDateTime", nullable = false)
//	private java.util.Date jobStartDateTime;// 工作開始時間
//
//	@Column(name = "jobEndDateTime", nullable = false)
//	private java.util.Date jobEndDateTime;// 工作開始時間


	
	public Long id() {
		return id;
	}



	public void setRequestListId(Long id) {
		this.id = id;
	}



	public String getMemberId() {
		return memberId;
	}



	public void setMemberId(String memberId) {
		this.memberId = memberId;
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



	@Override
	public String toString() {

		return "Requests [id=" + id + ", memberId=" + memberId + ", jobTitle=" + jobTitle
				+ ", timeValue=" + timeValue + ", termType=" + termType + ", serviceType=" + serviceType
				+  "]";
	}

}
