package team.lala.timebank.entity;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import team.lala.timebank.enums.MemberType;
import team.lala.timebank.enums.YesNo;

@Entity
@Table(name = "MEMBER")
@Inheritance(strategy = InheritanceType.JOINED)
public class Member {
		
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "CITY", referencedColumnName="Id",
				insertable=false, updatable=false)
	@Transient
	private Area area;


	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	@Column(name = "LOGIN_ACCOUNT")
	private String loginAccount;

	@Column(name = "PASSWORD")
	private String password;

	@Column(name = "NAME")
	private String name;

	@Enumerated(EnumType.STRING)
	@Column(name = "TYPE")
	private MemberType memberType; // P: Person; O: Organization

	@Column(name = "EMAIL")
	private String email;

	@Column(name = "TEL")
	private String telephone;

	@Column(name = "MOBILE")
	private String mobile;

	@Column(name = "CITY")
	private Long city;

	@Enumerated(EnumType.STRING)
	@Column(name="EMAIL_VERTIFICATION")
	private YesNo emailVerification = YesNo.N;
	
	@Column(name="SIGN_UP_DATE")
	private Date signUpDate;

	@Column(name = "ORG_FOUNDER")
	private String orgFounder;

	@Column(name = "ORG_CEO")
	private String orgCeo;
	
	@Enumerated(EnumType.STRING)
	@Column(name="ORG_IDENTITY_CONFIRMATION")
	private YesNo orgIdConfirmation = YesNo.N;
	

	public Area getArea() {
		return area;
	}

	public void setArea(Area area) {
		this.area = area;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getLoginAccount() {
		return loginAccount;
	}

	public void setLoginAccount(String loginAccount) {
		this.loginAccount = loginAccount;
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

	public Long getCity() {
		return city;
	}

	public void setCity(Long city) {
		this.city = city;
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



	public YesNo getOrgIdConfirmation() {
		return orgIdConfirmation;
	}

	public void setOrgIdConfirmation(YesNo orgIdConfirmation) {
		this.orgIdConfirmation = orgIdConfirmation;
	}

	@Override
	public String toString() {
		return "Member [area=" + area + ", id=" + id + ", loginAccount=" + loginAccount + ", password=" + password
				+ ", name=" + name + ", memberType=" + memberType + ", email=" + email + ", telephone=" + telephone
				+ ", mobile=" + mobile + ", city=" + city + ", emailVerification=" + emailVerification + ", signUpDate="
				+ signUpDate + ", orgFounder=" + orgFounder + ", orgCeo=" + orgCeo + ", orgIdConfirmation="
				+ orgIdConfirmation + "]";
	}



	

	

}