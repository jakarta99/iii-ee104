package team.lala.timebank.internationalVolunteer.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.Getter;
import lombok.Setter;

@Entity
@Getter
@Setter
@Table(name = "InternationalVolunteer")
public class InternationalVolunteer {


	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long id;
	
	@Column(name="TITLE")
	private String title;
	
	@Column(name="PLACE")
	private String place; //項目地點
	
//	@Column(name="projectType")
//	private String projectType;

	@Column(name="ROLE_DISCRIPTION")
	private String roleDiscription;
	
	@Column(name="REQUIREMENT")
	private String requirement; //經驗要求
	
	@Column(name="WORK_UNIT")
	private String workUnit; //工作單位
	
	@Column(name="PROJECT_LENGTH")
	private String projectLength; //項目長度
	
	@Column(name="START_DATE")
	private String startDate; //開始日期
	
	
	@Column(name="WEBSITEURL")
	private String websiteUrl;
	
	@Column(name="PICTURE")
	private String picture;
	
	@Column(name="ORG_LOGO")
	private String orgLogo;
	
	@Column(name="ORGANIZATION")
	private String organization;
	
	@Column(name="ORGANIZATION_URL")
	private String orgUrl;

	@Override
	public String toString() {
		return "InternationalVolunteer [id=" + id + ", title=" + title + ", place=" + place + ", roleDiscription="
				+ roleDiscription + ", requirement=" + requirement + ", workUnit=" + workUnit + ", projectLength="
				+ projectLength + ", startDate=" + startDate + ", websiteUrl=" + websiteUrl + ", picture=" + picture
				+ ", orgLogo=" + orgLogo + ", organization=" + organization + ", orgUrl=" + orgUrl + "]";
	}

	
	
	
	
	
	

	

}
