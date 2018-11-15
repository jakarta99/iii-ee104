package team.lala.timebank.entity;

import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="AREA")
public class Area {
	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private Long id;
	
	@Column(name="CITY")
	private String city;
	
//	@OneToMany(mappedBy = "area", fetch = FetchType.LAZY)
//	private Set<Member> members;
//
//	public Set<Member> getMembers() {
//		return members;
//	}
//
//	public void setMembers(Set<Member> members) {
//		this.members = members;
//	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	@Override
	public String toString() {
		return "Area [id=" + id + ", city=" + city + "]";
	}
	
	

}
