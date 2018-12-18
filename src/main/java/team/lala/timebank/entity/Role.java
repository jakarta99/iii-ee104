package team.lala.timebank.entity;

import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonBackReference;


@Entity
@Table(name="ROLE")
public class Role {
	@Id
	@Column(name="ROLE_ID")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	@Column(name="ROLE_NAME")
	private String roleName;
	
	@ManyToMany(cascade=CascadeType.ALL)
	@JsonBackReference 
	@JoinTable(
			name="USER_ROLE",
			joinColumns=@JoinColumn(name="ROLE_ID"),
			inverseJoinColumns=@JoinColumn(name="USER_ID"))
	private Set<Member> members;

	public Set<Member> getMembers() {
		return members;
	}
	
	public void setMembers(Set<Member> members) {
		this.members = members;
	}
	
	
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getRoleName() {
		return roleName;
	}

	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}
	
	 public void addMember(Member member) {
	       if (!getMembers().contains(member)) {
	    	   getMembers().add(member);
	       }
	       if (!member.getRoles().contains(this)) {
	    	   member.getRoles().add(this);
	       }
	  }

	@Override
	public String toString() {
		return "Role [id=" + id + ", roleName=" + roleName+ "]";
	}
	    



	
}
