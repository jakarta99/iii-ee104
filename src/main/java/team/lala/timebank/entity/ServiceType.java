package team.lala.timebank.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
@Entity
@Table(name="ServiceType")
public class ServiceType {

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long id;
	
	@Column(name="service_Type")
	private String serviceType;
	
//	@OneToMany(
//			mappedBy="mission"
//			) 
//	private Mission mission;

	@Override
	public String toString() {
		return "ServiceType [id=" + id + ", ServiceType=" + serviceType + "]";
	}

	
	
	
}
