package team.lala.timebank.entity;

import java.util.Date;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonManagedReference;

import lombok.Getter;
import lombok.Setter;
import team.lala.timebank.enums.MissionStatus;
import team.lala.timebank.enums.TermType;

@Getter
@Setter
@Entity
@Table(name = "MISSION")
public class Mission {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	@ManyToOne
	@JoinColumn(name = "MEMBER_ID", referencedColumnName = "id")
	private Member member; // 刊登者

	@Transient
	private String memberAccount;

	@Column(name = "TITLE", nullable = false, length = 50)
	private String title;// 活動名稱

	@Column(name = "TIME_VALUE", nullable = false)
	private Integer timeValue;// 可獲得時數(工作的時間)

	@Enumerated(EnumType.STRING)
	@Column(name = "TERM_TYPE", nullable = false)
	private TermType termType;// 長短期

	@ManyToOne
	@JoinColumn(name = "SERVICE_TYPE", referencedColumnName = "id")
	private ServiceType serviceType;

	@Transient
	private String serviceTypeDetail;

	@JsonBackReference
	@OneToMany(mappedBy = "mission", cascade = { CascadeType.REMOVE })
	private Set<Order> orders;

	@DateTimeFormat(pattern = "yyyy/MM/dd")
	@Column(name = "PUBLISH_DATE", nullable = false)
	private Date publishDate;

	@DateTimeFormat(pattern = "yyyy/MM/dd")
	@Column(name = "DEADLINE", nullable = false)
	private Date deadline;

	@DateTimeFormat(pattern = "yyyy/MM/dd HH:mm")
	@Column(name = "START_DATE")
	private Date startDate;// 工作開始時間

	@DateTimeFormat(pattern = "yyyy/MM/dd HH:mm")
	@Column(name = "END_DATE")
	private Date endDate;// 工作結束時間

	@Column(name = "PEOPLE_NEEDED", nullable = false)
	private Integer peopleNeeded;

	@Column(name = "CONTACT_PERSON", nullable = false, length = 20)
	private String contactPerson;

	@Column(name = "CONTACT_PHONE", nullable = false, length = 20)
	private String contactPhone;

	@Column(name = "CONTACT_EMAIL", nullable = false, length = 20)
	private String contactEmail;

	@Column(name = "DISCRIPTION", nullable = false, length = 300)
	private String discription;

	@Column(name = "COUNTY", nullable = false)
	private String county;

	@Column(name = "DISTRICT", nullable = false)
	private String district;

	@Column(name = "ADDRESS", nullable = false)
	private String address;

	@Enumerated(EnumType.STRING)
	@Column(name = "MISSION_STATUS", nullable = false)
	private MissionStatus missionstatus;

	@Column(name = "APPROVED_QUANTITY", nullable = false)
	private Integer approvedQuantity;
	
	@Column(name = "UPDATE_DATE")
	@DateTimeFormat(pattern = "yyyy/MM/dd")
	private Date updateDate;
	
	@Column(name = "FINISH_DATE")
	@DateTimeFormat(pattern = "yyyy/MM/dd")
	private Date finishDate;// 結案時間
	
	@Column(name = "MISSION_PIC_NAME")
	private String missionPicName;// 工作宣傳圖片名字

	@Override
	public String toString() {
		return "Mission [id=" + id + ", member=" + member + ", memberAccount=" + memberAccount + ", title=" + title
				+ ", timeValue=" + timeValue + ", termType=" + termType + ", serviceType=" + serviceType
				+ ", serviceTypeDetail=" + serviceTypeDetail + ", orders=" + orders + ", publishDate=" + publishDate
				+ ", deadline=" + deadline + ", startDate=" + startDate + ", endDate=" + endDate + ", peopleNeeded="
				+ peopleNeeded + ", contactPerson=" + contactPerson + ", contactPhone=" + contactPhone
				+ ", contactEmail=" + contactEmail + ", discription=" + discription + ", county=" + county
				+ ", district=" + district + ", address=" + address + ", missionstatus=" + missionstatus
				+ ", approvedQuantity=" + approvedQuantity + "]";
	}

}
