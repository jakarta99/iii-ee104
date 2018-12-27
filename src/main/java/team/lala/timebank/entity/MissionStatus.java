package team.lala.timebank.entity;

import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonBackReference;

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

	@OneToMany(mappedBy ="status")
	@JsonBackReference
	private Set<Mission> missions;
	
	@Override
	public String toString() {
		return "MissionStatus [id=" + id + ", missionStatus=" + missionStatus + "]";
	}
	
	

}
