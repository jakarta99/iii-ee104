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
public class Member {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	@Column(name = "ACCOUNT")
	private String account;

	@Column(name = "PASSWORD")
	private String password;

	@Column(name = "NAME")
	private String name;

	@Enumerated(EnumType.STRING)
	@Column(name = "TYPE")
	private MemberType memberType; // P: Person; O: Organization

	@Column(name="CERTIFICATE_ID_NUMBER")
	private String certificateIdNumber;
	
	@Column(name="BIRTH_DATE")
	private Date birthDate;
	
	@Column(name = "EMAIL")
	private String email;

	@Column(name = "TEL")
	private String telephone;

	@Column(name = "MOBILE")
	private String mobile;

	@Column(name = "COUNTY")
	private String county;
	
	@Column(name = "DISTRICT")
	private String district;

	@Column(name = "ADDRESS")
	private String address;

	@Enumerated(EnumType.STRING)
	@Column(name = "EMAIL_VERTIFICATION")
	private YesNo emailVerification = YesNo.N;

	@Column(name = "SIGN_UP_DATE")
	private Date signUpDate;

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
	private YesNo orgIdConfirmation = YesNo.N;

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
				+ birthDate + ", email=" + email + ", telephone=" + telephone + ", mobile=" + mobile + ", county="
				+ county + ", district=" + district + ", address=" + address + ", emailVerification="
				+ emailVerification + ", signUpDate=" + signUpDate + ", orgFounder=" + orgFounder + ", orgCeo=" + orgCeo
				+ ", orgContactPerson=" + orgContactPerson + ", orgContactPersonTel=" + orgContactPersonTel
				+ ", orgContactPersonMobile=" + orgContactPersonMobile + ", orgWebsiteLink=" + orgWebsiteLink
				+ ", orgFoundPurpose=" + orgFoundPurpose + ", orgIdConfirmation=" + orgIdConfirmation + "]";
	}

	

}