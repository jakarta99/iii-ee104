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

import org.springframework.security.core.GrantedAuthority;

import com.fasterxml.jackson.annotation.JsonBackReference;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Entity
@Table(name="ROLE")
public class Role implements GrantedAuthority{
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
	
	

	 public void addMember(Member member) {
	       if (!getMembers().contains(member)) {
	    	   getMembers().add(member);
	       }
	       if (!member.getRoles().contains(this)) {
	    	   member.getRoles().add(this);
	       }
	  }
	 
	 
	 
	 public void deleteMember(Member member) {
		 Set<Member> members = this.getMembers();
		 Set<Role> roles = member.getRoles();
		 if (roles.contains(this)) {
			 System.out.println("member.getRoles().contains(this");
			 roles.remove(this);
			 member.setRoles(roles);
		 }	       
	       if (members.contains(member)) {
	    	   System.out.println("getMembers().contains(member)");
	    	   members.remove(member);
	    	   this.setMembers(members);
	       }
	  }

	@Override
	public String toString() {
		return "Role [id=" + id + ", roleName=" + roleName+ "]";
	}

	@Override
	public String getAuthority() {
		return "ROLE_"+ roleName;
	}
	    



	
}
