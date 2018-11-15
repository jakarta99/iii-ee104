package team.lala.timebank.entity.jdbcQuery;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import team.lala.timebank.entity.Area;
import team.lala.timebank.entity.OrgMember;

@Entity
@Table(name = "MEMBER")
public class Member {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	@Column(name = "LOGIN_ACCOUNT")
	private String loginAccount;

	public Member(String loginAccount, String password, String name, String type, String email, String telephone,
			String mobile) {
		this.loginAccount = loginAccount;
		this.password = password;
		this.name = name;
		this.type = type;
		this.email = email;
		this.telephone = telephone;
		this.mobile = mobile;
	}

	public Member() {
	}

	@Column(name = "PASSWORD")
	private String password;

	@Column(name = "NAME")
	private String name;

	@Column(name = "TYPE")
	private String type; // P: Person; O: Organization

	@Column(name = "EMAIL")
	private String email;

	@Column(name = "TEL")
	private String telephone;

	@Column(name = "MOBILE")
	private String mobile;

	@ManyToOne(fetch=FetchType.LAZY,optional = false)
	@JoinColumn(name = "CITY")
//	@Column(name="city")
	private Area area;

	@OneToOne(mappedBy = "member", cascade = CascadeType.ALL, fetch = FetchType.EAGER) // mappedBy:對應到Member2的實例變數																						// member
	private OrgMember orgMember;

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

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
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

	public OrgMember getOrgMember() {
		return orgMember;
	}

	public void setOrgMember(OrgMember orgMember) {
		this.orgMember = orgMember;
	}

	public Area getArea() {
		return area;
	}

	public void setArea(Area area) {
		this.area = area;
	}

	@Override
	public String toString() {
		return "Member [id=" + id + ", loginAccount=" + loginAccount + ", password=" + password + ", name=" + name
				+ ", type=" + type + ", email=" + email + ", telephone=" + telephone + ", mobile=" + mobile + ", area="
				+ area + ", orgMember=" + orgMember + "]";
	}

}
