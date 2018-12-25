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
	@JoinColumn(name="member_id",    
			referencedColumnName="id") 
	private Member memberId;

	@ManyToOne
	@JoinColumn(name="organization_id",    
			referencedColumnName="id") 
	private Member organizationId;

	@Column(name = "value")
	private Integer value;
	
	
	@Column(name = "donate_time")
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
		return "Donation [id=" + id + ", memberId=" + memberId + ", organizationId=" + organizationId + ", value="
				+ value + ", donateTime=" + donateTime + ", donateTimeBegin=" + donateTimeBegin + ", donateTimeEnd="
				+ donateTimeEnd + "]";
	}


}
