package team.lala.timebank.entity;

import java.util.Collection;
import java.util.Date;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.validation.constraints.Past;

import org.hibernate.annotations.BatchSize;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import com.fasterxml.jackson.annotation.JsonManagedReference;

import lombok.Getter;
import lombok.Setter;
import team.lala.timebank.enums.MemberType;
import team.lala.timebank.enums.YesNo;

@Getter
@Setter
@Entity
@Table(name = "MEMBER")
public class Member implements UserDetails {
	
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

//	@NotNull
//	@Size(min=6, max=30)
	@Column(name = "ACCOUNT")
	private String account;
	
//	@NotNull
//	@Size(min=6, max=30)
	@Column(name = "PASSWORD")
	private String password;
	
	@ManyToMany(fetch=FetchType.LAZY,
			cascade=CascadeType.ALL)
	@JsonManagedReference
	@BatchSize(size=10)
	@JoinTable(
			name="USER_ROLE",
			joinColumns=@JoinColumn(name="USER_ID"),
			inverseJoinColumns=@JoinColumn(name="ROLE_ID"))
	private Set<Role> roles;

	public Set<Role> getRoles() {
		return roles;
	}

	public void setRoles(Set<Role> roles) {
		this.roles = roles;
	}

//	@NotNull
//	@Size(min=4, max=10)
	@Column(name = "NAME")
	private String name;

//	@NotNull
	@Enumerated(EnumType.STRING)
	@Column(name = "TYPE")
	private MemberType memberType; // P: Person; O: Organization

//	@NotNull
//	@Size(min=8, max=10)//統一編號8碼，身份證字號10碼
	@Column(name="CERTIFICATE_ID_NUMBER")
	private String certificateIdNumber;
	
//	@NotNull
	@Past
	@DateTimeFormat(pattern = "yyyy/MM/dd")
	@Column(name="BIRTH_DATE")
	private Date birthDate;
	
	@Past
	@Transient
	@DateTimeFormat(pattern = "yyyy/MM/dd")
	private Date birthDateStart;
	
	@Past
	@DateTimeFormat(pattern = "yyyy/MM/dd")
	@Transient
	private Date birthDateEnd;
	
//	@NotNull
	@Column(name = "EMAIL")
	private String email;

//	@NotNull
	@Column(name = "TEL")
	private String telephone;

//	@NotNull
	@Column(name = "MOBILE")
	private String mobile;

//	@NotNull
	@Column(name = "COUNTY")
	private String county;
	
//	@NotNull
	@Column(name = "DISTRICT")
	private String district;

//	@NotNull
	@Column(name = "ADDRESS")
	private String address;

	
	@Enumerated(EnumType.STRING)
	@Column(name = "EMAIL_VERTIFICATION")
	private YesNo emailVerification;

	
	@DateTimeFormat(pattern = "yyyy/MM/dd")
	@Column(name = "SIGN_UP_DATE")
	private Date signUpDate;
	
	@Transient
	@DateTimeFormat(pattern = "yyyy/MM/dd")
	private Date signUpDateStart;
	
	@Transient
	@DateTimeFormat(pattern = "yyyy/MM/dd")
	private Date signUpDateEnd;
	
	
	@Column(name = "ORG_FOUNDER")
	private String orgFounder;

	@Column(name = "ORG_CEO")
	private String orgCeo;
	
	@Column(name="ORG_CONTACT_PERSON")
	private String orgContactPerson;
	
	@Column(name="ORG_CONTACT_PERSON_TEL")
	private String orgContactPersonTel;
	
	@Column(name="ORG_CONTACT_PERSON_MOBILE")
	private String orgContactPersonMobile;
	
	@Column(name="ORG_WEBSITE_LINK")
	private String orgWebsiteLink;
	
	@Column(name="ORG_FOUND_PURPOSE")
	private String orgFoundPurpose;
	
	@Enumerated(EnumType.STRING)
	@Column(name = "ORG_IDENTITY_CONFIRMATION")
	private YesNo orgIdConfirmation;
	
	@Column(name = "BALANCE_VALUE")
	private Integer balanceValue;
	
	@Column(name = "SUM_SCORE")
	private Integer sumScore;
	
	@Column(name = "SCORED_TIMES")
	private Integer scoredTimes;
	
	@Column(name = "AVERAGE_SCORE")
	private Integer averageScore;
	
//	 public void addRole(Role role) {
//	       if (!getRoles().contains(role)) {
//	           getRoles().add(role);
//	       }
//	       if (!role.getMembers().contains(this)) {
//	    	   role.getMembers().add(this);
//	       }
//	  }
	


	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
//		List<GrantedAuthority> authorities = new ArrayList<>();
//		Set<Role> userRoles = this.getRoles();
//		for (Role role : userRoles) {
//			authorities.add(new SimpleGrantedAuthority(rolePrefix+ role.getRoleName()));			
//		}
//
//		return authorities;
		
		return roles;
	}

	@Override
	public String getUsername() {
		return this.account;
	}

	@Override
	public boolean isAccountNonExpired() {
		// TODO Auto-generated method stub
		return true;
	}

	@Override
	public boolean isAccountNonLocked() {
		// TODO Auto-generated method stub
		return true;
	}

	@Override
	public boolean isCredentialsNonExpired() {
		// TODO 密碼過期
		return true;
	}

	@Override
	public boolean isEnabled() {
		// TODO Auto-generated method stub
		return true;
	}

	@Override
	public String toString() {
		return "Member [id=" + id + ", account=" + account + ", password=" + password + ", roles=" + roles + ", name="
				+ name + ", memberType=" + memberType + ", certificateIdNumber=" + certificateIdNumber + ", birthDate="
				+ birthDate + ", birthDateStart=" + birthDateStart + ", birthDateEnd=" + birthDateEnd + ", email="
				+ email + ", telephone=" + telephone + ", mobile=" + mobile + ", county=" + county + ", district="
				+ district + ", address=" + address + ", emailVerification=" + emailVerification + ", signUpDate="
				+ signUpDate + ", signUpDateStart=" + signUpDateStart + ", signUpDateEnd=" + signUpDateEnd
				+ ", orgFounder=" + orgFounder + ", orgCeo=" + orgCeo + ", orgContactPerson=" + orgContactPerson
				+ ", orgContactPersonTel=" + orgContactPersonTel + ", orgContactPersonMobile=" + orgContactPersonMobile
				+ ", orgWebsiteLink=" + orgWebsiteLink + ", orgFoundPurpose=" + orgFoundPurpose + ", orgIdConfirmation="
				+ orgIdConfirmation + ", balanceValue=" + balanceValue + ", sumScore=" + sumScore + ", scoredTimes="
				+ scoredTimes + ", averageScore=" + averageScore + "]";
	}

}