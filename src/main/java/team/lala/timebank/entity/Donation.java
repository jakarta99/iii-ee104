package team.lala.timebank.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.hibernate.annotations.BatchSize;
import org.springframework.format.annotation.DateTimeFormat;

import lombok.Getter;
import lombok.Setter;
@Getter
@Setter
@Entity
@Table(name = "Donation")
public class Donation {
	@GeneratedValue(strategy = GenerationType.IDENTITY) // ID生成的策略
	@Id
	private Long id;

	@ManyToOne
	@JoinColumn(name="DONATOR_ID",    
			referencedColumnName="id") 
	private Member donator;
	
	@Transient
	private String donatorAccount;

	@ManyToOne
	@JoinColumn(name="ORG_DONEE_ID",    
			referencedColumnName="id") 
	private Member orgDonee; //被捐贈者
	
	@Transient
	private String orgDoneeAccount;


	@Column(name = "DONATE_VALUE")
	private Integer value;
	
	
	@Column(name = "DONATE_TIME")
	@DateTimeFormat(pattern = "yyyy/MM/dd")
	private Date donateTime;

	@Transient
	@DateTimeFormat(pattern = "yyyy/MM/dd")
	private Date donateTimeBegin;

	@Transient
	@DateTimeFormat(pattern = "yyyy/MM/dd")
	private Date donateTimeEnd;

	@Override
	public String toString() {
		return "Donation [id=" + id + ", donator=" + donator + ", donatorAccount=" + donatorAccount + ", orgDonee="
				+ orgDonee + ", orgDoneeAccount=" + orgDoneeAccount + ", value=" + value + ", donateTime=" + donateTime
				+ ", donateTimeBegin=" + donateTimeBegin + ", donateTimeEnd=" + donateTimeEnd + "]";
	}




}
