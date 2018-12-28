package team.lala.timebank.webMagic;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.Getter;
import lombok.Setter;

@Entity
@Getter
@Setter
@Table(name = "InternationalVolunteer")
public class InternationalVolunteer {

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long id;
	@Column
	private String title;
	
	@Column
	private String place;
	
	@Column
	private String projectType;

	@Column
	private String roleDiscription;
	
	@Column
	private String experienceRequirement;
	
	@Column
	private String websiteUrl;
	
	
	
	

	

}
