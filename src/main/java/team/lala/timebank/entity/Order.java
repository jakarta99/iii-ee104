package team.lala.timebank.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import team.lala.timebank.enums.YesNo;

@Entity
@Table(name="ORDER_LIST")
public class Order{
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long id;
	
	@ManyToOne
	@JoinColumn(name="REQUESTS_ID"   //代表本entity欄位名稱
				, referencedColumnName="id",  //代表合併的目標entity，其對應的欄位名稱
				insertable=false, updatable=false) //子表一定要設false，否則insert時會被視為一個欄位，導致語法錯誤
	private Requests requests;
	
	public Requests getRequests() {
		return requests;
	}

	public void setRequests(Requests requests) {
		this.requests = requests;
	}

	@Column(name="SUPPLIER_ID")
	private Long supplierId;
	
	@Column(name="REQUESTER_ID")
	private Long requesterId;
	
	@Enumerated(EnumType.STRING)
	@Column(name="SUPPLIER_ACCEPTION")
	private YesNo supplierAcception;
	
	@Enumerated(EnumType.STRING)
	@Column(name="SERVICE_CONFIRMATION")
	private YesNo confirmation;
	
	@Column(name="STATUS")
	private String status;

	@Override
	public String toString() {
		return "Order [id=" + id + ", requests=" + requests + ", supplierId=" + supplierId + ", requesterId="
				+ requesterId + ", supplierAcception=" + supplierAcception + ", confirmation=" + confirmation
				+ ", status=" + status + "]";
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}



	public Long getSupplierId() {
		return supplierId;
	}

	public void setSupplierId(Long supplierId) {
		this.supplierId = supplierId;
	}

	public Long getRequesterId() {
		return requesterId;
	}

	public void setRequesterId(Long requesterId) {
		this.requesterId = requesterId;
	}

	
	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public YesNo getSupplierAcception() {
		return supplierAcception;
	}

	public void setSupplierAcception(YesNo supplierAcception) {
		this.supplierAcception = supplierAcception;
	}

	public YesNo getConfirmation() {
		return confirmation;
	}

	public void setConfirmation(YesNo confirmation) {
		this.confirmation = confirmation;
	}

}
