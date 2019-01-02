package team.lala.timebank.entity;

import java.time.LocalDateTime;
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
@Getter
@Setter
@Entity
@Table(name="TIME_LEDGER")
public class TimeLedger {
	@GeneratedValue(strategy=GenerationType.IDENTITY) //ID生成的策略
	@Id
	private Long id;
	
	@ManyToOne
//	@BatchSize(size=30)
	@JoinColumn(name="MEMBER_ID",    
			referencedColumnName="id") 
	private Member memberId;
	
	@Column(name="TRANSACTION_TIME")
	@DateTimeFormat(pattern = "yyyy/MM/dd")
	private Date transactionTime;
	
	@Transient
	@DateTimeFormat(pattern = "yyyy/MM/dd")
	private Date transactionTimeBegin;

	@Transient
	@DateTimeFormat(pattern = "yyyy/MM/dd")
	private Date transactionTimeEnd;
	
	@Column(name="DEPOSIT_VALUE")
	private Integer depositValue;
	
	@Column(name="WITHDRAWAL_VALUE")
	private Integer withdrawalValue;
	
	@Column(name="BALANCE_VALUE")
	private Integer balanceValue;
	
	@Column(name="DESCRIPTION")
	private String description;

	

	@Override
	public String toString() {
		return "TimeLedger [id=" + id + ", memberId=" + memberId + ", transactionTime=" + transactionTime
				+ ", transactionTimeBegin=" + transactionTimeBegin + ", transactionTimeEnd=" + transactionTimeEnd
				+ ", depositValue=" + depositValue + ", withdrawalValue=" + withdrawalValue + ", balanceValue="
				+ balanceValue + ", description=" + description + "]";
	}

}
