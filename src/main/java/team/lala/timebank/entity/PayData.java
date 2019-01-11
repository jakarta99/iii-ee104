package team.lala.timebank.entity;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class PayData {
	
	private Long orderId;
	
	private Integer hours;
	
	private Integer score;

	@Override
	public String toString() {
		return "PayData [orderId=" + orderId + ", hours=" + hours + ", score=" + score + "]";
	}

}
