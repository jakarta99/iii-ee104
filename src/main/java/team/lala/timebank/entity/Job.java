package team.lala.timebank.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "Job")
public class Job {
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Id
	private Long id;// 工作ID

	@Column(name = "requester")
	private String requester; // 刊登者

	@Column(name = "jobTitle")
	private String jobTitle;// 活動名稱

	@Column(name = "timeValue")
	private Integer timeValue;// 可獲得時數(工作的時間)

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

		return "Job [id=" + id + ", requester=" + requester + ", jobTitle=" + jobTitle + ", timeValue=" + timeValue
				+ "]";
	}

}
