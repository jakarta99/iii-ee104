package team.lala.timebank.entity;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.List;
import java.util.Set;

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

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import com.fasterxml.jackson.annotation.JsonManagedReference;

import team.lala.timebank.enums.MemberType;
import team.lala.timebank.enums.YesNo;

@Entity
@Table(name = "MEMBER")
public class Member implements UserDetails {
	
	private static final String rolePrefix = "ROLE_";
	
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
	
	@ManyToMany
//	(fetch=FetchType.EAGER)
	@JsonManagedReference
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

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public MemberType getMemberType() {
		return memberType;
	}

	public void setMemberType(MemberType memberType) {
		this.memberType = memberType;
	}

	public String getCertificateIdNumber() {
		return certificateIdNumber;
	}

	public void setCertificateIdNumber(String certificateIdNumber) {
		this.certificateIdNumber = certificateIdNumber;
	}

	public Date getBirthDate() {
		return birthDate;
	}

	public void setBirthDate(Date birthDate) {
		this.birthDate = birthDate;
	}

	public Date getBirthDateStart() {
		return birthDateStart;
	}

	public void setBirthDateStart(Date birthDateStart) {
		this.birthDateStart = birthDateStart;
	}

	public Date getBirthDateEnd() {
		return birthDateEnd;
	}

	public void setBirthDateEnd(Date birthDateEnd) {
		this.birthDateEnd = birthDateEnd;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getTelephone() {
		return telephone;
	}

	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getCounty() {
		return county;
	}

	public void setCounty(String county) {
		this.county = county;
	}

	public String getDistrict() {
		return district;
	}

	public void setDistrict(String district) {
		this.district = district;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public YesNo getEmailVerification() {
		return emailVerification;
	}

	public void setEmailVerification(YesNo emailVerification) {
		this.emailVerification = emailVerification;
	}

	public Date getSignUpDate() {
		return signUpDate;
	}

	public void setSignUpDate(Date signUpDate) {
		this.signUpDate = signUpDate;
	}

	public Date getSignUpDateStart() {
		return signUpDateStart;
	}

	public void setSignUpDateStart(Date signUpDateStart) {
		this.signUpDateStart = signUpDateStart;
	}

	public Date getSignUpDateEnd() {
		return signUpDateEnd;
	}

	public void setSignUpDateEnd(Date signUpDateEnd) {
		this.signUpDateEnd = signUpDateEnd;
	}

	public String getOrgFounder() {
		return orgFounder;
	}

	public void setOrgFounder(String orgFounder) {
		this.orgFounder = orgFounder;
	}

	public String getOrgCeo() {
		return orgCeo;
	}

	public void setOrgCeo(String orgCeo) {
		this.orgCeo = orgCeo;
	}

	public String getOrgContactPerson() {
		return orgContactPerson;
	}

	public void setOrgContactPerson(String orgContactPerson) {
		this.orgContactPerson = orgContactPerson;
	}

	public String getOrgContactPersonTel() {
		return orgContactPersonTel;
	}

	public void setOrgContactPersonTel(String orgContactPersonTel) {
		this.orgContactPersonTel = orgContactPersonTel;
	}

	public String getOrgContactPersonMobile() {
		return orgContactPersonMobile;
	}

	public void setOrgContactPersonMobile(String orgContactPersonMobile) {
		this.orgContactPersonMobile = orgContactPersonMobile;
	}

	public String getOrgWebsiteLink() {
		return orgWebsiteLink;
	}

	public void setOrgWebsiteLink(String orgWebsiteLink) {
		this.orgWebsiteLink = orgWebsiteLink;
	}

	public String getOrgFoundPurpose() {
		return orgFoundPurpose;
	}

	public void setOrgFoundPurpose(String orgFoundPurpose) {
		this.orgFoundPurpose = orgFoundPurpose;
	}

	public YesNo getOrgIdConfirmation() {
		return orgIdConfirmation;
	}

	public void setOrgIdConfirmation(YesNo orgIdConfirmation) {
		this.orgIdConfirmation = orgIdConfirmation;
	}

	@Override
	public String toString() {
		return "Member [id=" + id + ", account=" + account + ", password=" + password + ", name=" + name
				+ ", memberType=" + memberType + ", certificateIdNumber=" + certificateIdNumber + ", birthDate="
				+ birthDate + ", birthDateStart=" + birthDateStart + ", birthDateEnd=" + birthDateEnd + ", email="
				+ email + ", telephone=" + telephone + ", mobile=" + mobile + ", county=" + county + ", district="
				+ district + ", address=" + address + ", emailVerification=" + emailVerification + ", signUpDate="
				+ signUpDate + ", signUpDateStart=" + signUpDateStart + ", signUpDateEnd=" + signUpDateEnd
				+ ", orgFounder=" + orgFounder + ", orgCeo=" + orgCeo + ", orgContactPerson=" + orgContactPerson
				+ ", orgContactPersonTel=" + orgContactPersonTel + ", orgContactPersonMobile=" + orgContactPersonMobile
				+ ", orgWebsiteLink=" + orgWebsiteLink + ", orgFoundPurpose=" + orgFoundPurpose + ", orgIdConfirmation="
				+ orgIdConfirmation + "]";
	}

	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		List<GrantedAuthority> list = new ArrayList<>();
		Set<Role> roles = this.getRoles();
		for (Role r : roles) {
			list.add(new SimpleGrantedAuthority(rolePrefix+ r.getRoleName()));			
		}
		
//		list.add(new SimpleGrantedAuthority("ADMIN"));
		return list;
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


		

}