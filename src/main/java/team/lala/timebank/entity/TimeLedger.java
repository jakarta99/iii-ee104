package team.lala.timebank.entity;

import java.time.LocalDateTime;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.format.annotation.DateTimeFormat;

/**
 * DATETIME    MEMBER_ID   DEPOSIT         WITHDRAWAL           BALANCE          DESCRIPTION 
 * -----------------------------------------------------------------------------   
 * 2018-10-01   1            2                                      2                         
 * 2018-10-02   1            4                                      6
 * 2040-11-01   1                                1                  5
 * 
 * @author Gary Lee
 *
 */
@Entity
@Table(name="Time_Ledger")
public class TimeLedger {
	@GeneratedValue(strategy=GenerationType.IDENTITY) //ID生成的策略
	@Id
	private Long id;
	
	@Column(name="member_Id")
	private Long memberId;
	
	@Column(name="transaction_Time")
	@DateTimeFormat(pattern = "yyyy/MM/dd")
	private Date transactionTime;
	
	@Transient
	@DateTimeFormat(pattern = "yyyy/MM/dd")
	private Date transactionTimeBegin;

	@Transient
	@DateTimeFormat(pattern = "yyyy/MM/dd")
	private Date transactionTimeEnd;
	
	@Column(name="deposit_Value")
	private Integer depositValue;
	
	@Column(name="withdrawal_Value")
	private Integer withdrawalValue;
	
	@Column(name="balance_Value")
	private Integer balanceValue;
	
	@Column(name="description")
	private String description;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Long getMemberId() {
		return memberId;
	}

	public void setMemberId(Long memberId) {
		this.memberId = memberId;
	}

	public Date getTransactionTime() {
		return transactionTime;
	}

	public void setTransactionTime(Date transactionTime) {
		this.transactionTime = transactionTime;
	}

	public Date getTransactionTimeBegin() {
		return transactionTimeBegin;
	}

	public void setTransactionTimeBegin(Date transactionTimeBegin) {
		this.transactionTimeBegin = transactionTimeBegin;
	}

	public Date getTransactionTimeEnd() {
		return transactionTimeEnd;
	}

	public void setTransactionTimeEnd(Date transactionTimeEnd) {
		this.transactionTimeEnd = transactionTimeEnd;
	}

	public Integer getDepositValue() {
		return depositValue;
	}

	public void setDepositValue(Integer depositValue) {
		this.depositValue = depositValue;
	}

	public Integer getWithdrawalValue() {
		return withdrawalValue;
	}

	public void setWithdrawalValue(Integer withdrawalValue) {
		this.withdrawalValue = withdrawalValue;
	}

	public Integer getBalanceValue() {
		return balanceValue;
	}

	public void setBalanceValue(Integer balanceValue) {
		this.balanceValue = balanceValue;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	@Override
	public String toString() {
		return "TimeLedger [id=" + id + ", memberId=" + memberId + ", transactionTime=" + transactionTime
				+ ", transactionTimeBegin=" + transactionTimeBegin + ", transactionTimeEnd=" + transactionTimeEnd
				+ ", depositValue=" + depositValue + ", withdrawalValue=" + withdrawalValue + ", balanceValue="
				+ balanceValue + ", description=" + description + "]";
	}

}
