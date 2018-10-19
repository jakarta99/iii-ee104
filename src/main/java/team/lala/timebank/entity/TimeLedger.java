package team.lala.timebank.entity;

import java.time.LocalDateTime;

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
public class TimeLedger {
	
	private Long id;

	private Long memberId;
	
	private LocalDateTime transactionTime;
	
	private int depositValue;
	
	private int withdrawalValue;
	
	private int balanceValue;
	
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

	public LocalDateTime getTransactionTime() {
		return transactionTime;
	}

	public void setTransactionTime(LocalDateTime transactionTime) {
		this.transactionTime = transactionTime;
	}

	public int getDepositValue() {
		return depositValue;
	}

	public void setDepositValue(int depositValue) {
		this.depositValue = depositValue;
	}

	public int getWithdrawlValue() {
		return withdrawalValue;
	}

	public void setWithdrawlValue(int withdrawlValue) {
		this.withdrawalValue = withdrawlValue;
	}

	public int getBalanceValue() {
		return balanceValue;
	}

	public void setBalanceValue(int balanceValue) {
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
				+ ", depositValue=" + depositValue + ", withdrawlValue=" + withdrawalValue + ", balanceValue="
				+ balanceValue + ", description=" + description + "]";
	}
	
	
	
	
	
	
}
