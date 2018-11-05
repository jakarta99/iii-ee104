package team.lala.timebank.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Order {
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private Long id;
	
	@Column(name="REQUEST_LIST_ID")
	private Long requestListId;
	
	@Column(name="SUPPLIER_ID")
	private Long supplierId;
	
	@Column(name="REQUESTER_ID")
	private Long requesterId;
	
	@Column(name="SUPPLIER_ACCEPTION")
	private boolean supplierAcception;
	
	@Column(name="SERVICE_CONFIRMATION")
	private boolean confirmation;
	
	@Column(name="STATUS")
	private String status;


	@Override
	public String toString() {
		return "Order [id=" + id + ", requestListId=" + requestListId + ", supplierId=" + supplierId + ", requesterId="
				+ requesterId + ", supplierAcception=" + supplierAcception + ", confirmation=" + confirmation
				+ ", status=" + status + "]";
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Long getRequestListId() {
		return requestListId;
	}

	public void setRequestListId(Long requestListId) {
		this.requestListId = requestListId;
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

	public boolean isSupplierAcception() {
		return supplierAcception;
	}

	public void setSupplierAcception(boolean supplierAcception) {
		this.supplierAcception = supplierAcception;
	}

	public boolean isConfirmation() {
		return confirmation;
	}

	public void setConfirmation(boolean confirmation) {
		this.confirmation = confirmation;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

}
