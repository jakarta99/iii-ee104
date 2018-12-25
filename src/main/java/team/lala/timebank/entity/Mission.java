package team.lala.timebank.entity;

import java.util.Date;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.bind.annotation.Mapping;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonManagedReference;

import lombok.Getter;
import lombok.Setter;
import team.lala.timebank.enums.TermType;


@Getter
@Setter
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

//	@Column(name = "service_Type", nullable = false)
//	private Integer serviceType;// 服務類型
	
	@ManyToOne
	@JoinColumn(name="service_Type",    
				referencedColumnName="id") 
	private ServiceType serviceType;
	
	@JsonManagedReference
	@OneToMany(
			mappedBy ="mission",
			cascade = {CascadeType.REMOVE}
			)
	private Set<Order> orders;
	
	@DateTimeFormat(pattern = "yyyy/MM/dd")
	@Column(name = "publish_Date", nullable = false)
	private Date publishDate;

	@DateTimeFormat(pattern = "yyyy/MM/dd HH:mm" )
	@Column(name = "start_Date")
	private Date startDate;// 工作開始時間

	@DateTimeFormat(pattern = "yyyy/MM/dd HH:mm" )
	@Column(name = "end_Date")
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
	
	
	@ManyToOne
//	@JsonBackReference 
	@JoinColumn(name="status",    
				referencedColumnName="id",  
				insertable=true, updatable=true)
	@Column(name = "status", nullable = false)
	private Integer status;

	@Override
	public String toString() {
		return "Mission [id=" + id + ", memberId=" + memberId + ", title=" + title + ", timeValue=" + timeValue
				+ ", termType=" + termType + ", serviceType=" + serviceType + ", publishDate=" + publishDate
				+ ", startDate=" + startDate + ", endDate=" + endDate + ", peopleNeeded=" + peopleNeeded
				+ ", contactPerson=" + contactPerson + ", contactPhone=" + contactPhone + ", contactEmail="
				+ contactEmail + ", discription=" + discription + ", county=" + county + ", district=" + district
				+ ", address=" + address + ", status=" + status + "]";
	}

	

	
	
	
	
	
}
