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
import team.lala.timebank.enums.YesNo;

@Entity
@Getter
@Setter
@Table(name = "InternationalVolunteer")
public class InternationalVolunteer {


	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long id;
	
	@Transient
	private YesNo isCollected;
	
	@Column(name="TITLE")
	private String title;
	
	@Column(name="PLACE")
	private String place; //項目地點
	
	@Column(name="COUNTRY")
	private String country; //國家
	
	@Column(name="CONTINENT")
	private String continent; //位於哪個洲(東南亞、南非...)

	@Column(name="ROLE_DISCRIPTION")
	private String roleDiscription;
	
	@Column(name="REQUIREMENT")
	private String requirement; //經驗要求	
	
	@Column(name="PROJECT_LENGTH")
	private String projectLength; //項目長度
	
	@Column(name="START_DATE")
	@DateTimeFormat(pattern = "yyyy/MM/dd")
	private Date startDate; //開始日期
	
	@Column(name="END_DATE")
	@DateTimeFormat(pattern = "yyyy/MM/dd")
	private Date endDate; //開始日期
	
	@Transient
	@DateTimeFormat(pattern = "yyyy/MM/dd")
	private Date dateChosenStart; //查詢起始日期
	@Transient
	@DateTimeFormat(pattern = "yyyy/MM/dd")
	private Date dateChosenEnd;   //查詢截止日期
	
	
	@Column(name="WEBSITEURL")
	private String websiteUrl;
	
	@Column(name="PICTURE")
	private String picture;
	

	@Column(name="ORGANIZATION")
	private String organization;


	@Override
	public String toString() {
		return "InternationalVolunteer [id=" + id + ", title=" + title + ", place=" + place + ", country=" + country
				+ ", continent=" + continent + ", roleDiscription=" + roleDiscription + ", requirement=" + requirement
				+ ", projectLength=" + projectLength + ", startDate=" + startDate + ", endDate=" + endDate
				+ ", dateChosenStart=" + dateChosenStart + ", dateChosenEnd=" + dateChosenEnd + ", websiteUrl="
				+ websiteUrl + ", picture=" + picture + ", organization=" + organization + "]";
	}

	

}
