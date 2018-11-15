package team.lala.timebank.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity 
@Table(name="ORG_MEMBER")
public class OrgMember implements Serializable{
	
//	@Id
//	@GeneratedValue(strategy =GenerationType.AUTO)
//	private Long id;
	
	@Column(name="FOUNDER")
	private String founder;
	
	public OrgMember(String founder, String ceo) {
		this.founder = founder;
		this.ceo = ceo;
	}

	public OrgMember() {
	}

	@Column(name="CEO")
	private String ceo;
	
	@Id
	@OneToOne
	@JoinColumn(name="id")
	private Member member;



	@Override
	public String toString() {
		return "OrgMember [founder=" + founder + ", ceo=" + ceo + "]";
	}

	public String getFounder() {
		return founder;
	}

	public void setFounder(String founder) {
		this.founder = founder;
	}

	public String getCeo() {
		return ceo;
	}

	public void setCeo(String ceo) {
		this.ceo = ceo;
	}

	public Member getMember() {
		return member;
	}

	public void setMember(Member member) {
		this.member = member;
	}
	

}
