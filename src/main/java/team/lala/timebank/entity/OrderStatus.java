package team.lala.timebank.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
@Entity
@Table(name="ORDER_STATUS")
public class OrderStatus {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long id;
	
	@Column(name="ORDER_STATUS")
	private String orderStatus;

	@Override
	public String toString() {
		return "OrderStatus [id=" + id + ", orderStatus=" + orderStatus + "]";
	}

	
	
	

}
