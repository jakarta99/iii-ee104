package team.lala.timebank.entity;


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Entity
@Table(name = "MYCOLLECTION")

public class MyCollection {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	//收藏者
	@ManyToOne
	@JoinColumn(name = "MEMBER_ID", referencedColumnName = "id")
	private Member member;
	
	//收藏的mission
	@ManyToOne
	@JoinColumn(name = "MISSION_ID", referencedColumnName = "id")
	private Mission mission;
	
	//收藏的機構
	@ManyToOne
	@JoinColumn(name = "ORGANIZATION_ID", referencedColumnName = "id")
	private Member organization;
	
}
