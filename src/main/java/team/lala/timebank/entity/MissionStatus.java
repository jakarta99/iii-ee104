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
@Table(name="MISSION_STATUS")
public class MissionStatus {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long id;
	
	@Column(name="MISSION_STATUS")
	private String missionStatus;

	@Override
	public String toString() {
		return "MissionStatus [id=" + id + ", missionStatus=" + missionStatus + "]";
	}
	
	

}
