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

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import lombok.Getter;
import lombok.Setter;
import team.lala.timebank.enums.YesNo;

@Getter
@Setter
@Entity
@Table(name = "PENALTY")
public class Penalty {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	private Long id;

	// @Column(name = "order_list_id") //檢舉的媒合案件
	// private Long orderListId;
	@ManyToOne
	@JoinColumn(name = "ORDER_LIST", referencedColumnName = "id", insertable = true, updatable = true)
	@JsonIgnoreProperties(ignoreUnknown = true)
	private Order order; // 無法用order當資料行名稱

	@ManyToOne
	@JoinColumn(name = "ACCUSER_ID", referencedColumnName = "id", insertable = true, updatable = true)
	@JsonIgnoreProperties(ignoreUnknown = true)
	private Member accuser;// 檢舉人(原告)

	@ManyToOne
	@JoinColumn(name = "DEFENDANT_ID", referencedColumnName = "id", insertable = true, updatable = true)
	@JsonIgnoreProperties(ignoreUnknown = true)
	private Member defendant;
	// 被檢舉人(被告)

	@Column(name = "UPDATE_DATE")
	@DateTimeFormat(pattern = "yyyy/MM/dd")
	private Date updateDate;

	@Column(name = "DESCRIPTION", length = 50) // 檢舉內容說明
	private String description;

	@Column(name = "STATUS") // 1~3 審核中、審核結束_需懲罰、審核結束_不需懲罰    4被告提出申訴審核中 
	private Integer status;

	@Column(name = "PENALTY_TIME_VALUE")
	private Integer penaltyTimeValue;

	@Column(name = "PROOF_PIC_NAME")
	private String proofPicName;

	@Column(name = "VERTIFY_REASON")
	private String vertifyReason;
	
	
	//***********申訴的世界***********
	//是否針對審核結果提出申訴
	@Column(name = "APPLY_RE_VERTIFY")
	private YesNo applyReVertify;
	
	//申訴內容陳述
	@Column(name = "APPLY_RE_VERTIFY_DESCRIPTION")
	private String applyReVertifyDescription;
	
	//申訴佐證資料檔名
	@Column(name = "RE_VERTIFY_PROOF_PIC_NAME")
	private String reVertifyProofPicName;
	
	//申訴審核完畢的penalty time value
	@Column(name = "RE_VERTIFY_PENALTY_TIME_VALUE")
	private Integer reVertifyPenaltyTimeValue;
	
	//申訴審核結果及相關原因
	@Column(name = "RE_VERTIFY_REASON")
	private String reVertifyReason;
	//***********申訴的世界***********
	
	
	
	
	@Transient
	@DateTimeFormat(pattern = "yyyy/MM/dd") // 不進資料庫，用於查詢時間區間
	private Date dateBefore;

	@Transient
	@DateTimeFormat(pattern = "yyyy/MM/dd") // 不進資料庫，用於查詢時間區間
	private Date dateAfter;

	@Override
	public String toString() {
		return "Penalty [id=" + id + ", order=" + order + ", accuser=" + accuser + ", defendant=" + defendant
				+ ", updateDate=" + updateDate + ", description=" + description + ", status=" + status
				+ ", penaltyTimeValue=" + penaltyTimeValue + ", proofPicName=" + proofPicName + ", vertifyReason="
				+ vertifyReason + ", applyReVertify=" + applyReVertify + ", applyReVertifyDescription="
				+ applyReVertifyDescription + ", reVertifyProofPicName=" + reVertifyProofPicName
				+ ", reVertifyPenaltyTimeValue=" + reVertifyPenaltyTimeValue + ", reVertifyReason=" + reVertifyReason
				+ ", dateBefore=" + dateBefore + ", dateAfter=" + dateAfter + "]";
	}

	


}
