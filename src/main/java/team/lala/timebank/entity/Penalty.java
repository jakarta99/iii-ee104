package team.lala.timebank.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Entity
@Table(name = "PENALTY")
public class Penalty {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	private Long id;

//	@Column(name = "order_list_id") //檢舉的媒合案件
//	private Long orderListId;
	@OneToOne
	@JoinColumn(name="ORDER_LIST",    
				referencedColumnName="id",  
				insertable=true, updatable=true) 
	private Order order; //無法用order當資料行名稱

	@OneToOne
	@JoinColumn(name="ACCUSER_ID",    
				referencedColumnName="id",  
				insertable=true, updatable=true) 
	private Member accuser;//檢舉人(原告)
	
	
	@OneToOne
	@JoinColumn(name="DEFENDANT_ID",    
				referencedColumnName="id",  
				insertable=true, updatable=true) 
	private Member defendant;
	//被檢舉人(被告)

	@Column(name = "UPDATE_DATE")
	@DateTimeFormat(pattern = "yyyy/MM/dd")
	private Date updateDate;

	@Column(name = "DESCRIPTION", length = 50) //檢舉內容說明
	private String description;

	@Column(name = "STATUS")  //1~3 提出申訴、審核中、審核結束_需懲罰、審核結束_不需懲罰
	private Integer status;

	@Column(name = "PENALTY_TIME_VALUE")
	private Integer penaltyTimeValue;
	
//	@Lob
//	@Column(name = "proof_Pic")
//	private byte[] proofPic;
	@Column(name = "PROOF_PIC_NAME")
	private String proofPicName;
	
	@Column(name = "VERTIFY_REASON")
	private String vertifyReason;
	
	@Transient
	@DateTimeFormat(pattern = "yyyy/MM/dd") //不進資料庫，用於查詢時間區間
	private Date dateBefore;

	@Transient
	@DateTimeFormat(pattern = "yyyy/MM/dd")//不進資料庫，用於查詢時間區間
	private Date dateAfter;

	@Override
	public String toString() {
		return "Penalty [id=" + id + ", order=" + order + ", accuser=" + accuser + ", defendant=" + defendant
				+ ", updateDate=" + updateDate + ", description=" + description + ", status=" + status
				+ ", penaltyTimeValue=" + penaltyTimeValue + ", proofPicName=" + proofPicName + ", vertifyReason="
				+ vertifyReason + ", dateBefore=" + dateBefore + ", dateAfter=" + dateAfter + "]";
	}

	
	
	//待處理:
	//檢舉之佐證資料圖檔上傳功能(可能需要上傳多張圖檔)(儲存型別)(前端如何顯示)
	//流程:檢舉(畫面，需要說明檢舉規則，須配合提供證物)>>>進資料庫>>>審核畫面>>>是否需補證物(逾期未補則作廢)
	//(1)需補證物通知
	//(2)無須補證物>>>完成第一階段審核
	//被檢舉人申覆，未於期限內申覆視同到期(須配合提供證物)
	
	//管理者可自行編輯各種申請所需配合之條款與合約(用AOP做??)
	



}
