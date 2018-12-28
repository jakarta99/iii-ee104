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
@Table(name = "International_Volunteer_Project_Type")
public class InternationalVolunteerProjectType {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	@Column
	private String projectName;

	@Column
	private String projectLogo;

	@Column
	private String projectAgeRestriction;

	@Column
	private String projectTerm;

	@Column
	private String content;

	@Column
	private String startTime;

	@Override
	public String toString() {
		return "InternationalVolunteerProjectType [id=" + id + ", projectName=" + projectName + ", projectLogo="
				+ projectLogo + ", projectAgeRestriction=" + projectAgeRestriction + ", projectTerm=" + projectTerm
				+ ", content=" + content + ", startTime=" + startTime + "]";
	}
	
	
	

}
