package team.lala.timebank.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonBackReference;

import lombok.Getter;
import lombok.Setter;
import team.lala.timebank.enums.MyCollectionType;
import team.lala.timebank.enums.MissionStatus;

@Getter
@Setter
@Entity
@Table(name = "MYCOLLECTION")

public class MyCollection {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	// 收藏者
	@JsonBackReference
	@ManyToOne
	@JoinColumn(name = "MEMBER_ID", referencedColumnName = "id")
	private Member member;

	// 分辨收藏哪一種方便查詢
	@Enumerated(EnumType.STRING)
	@Column(name = "MYCOLLECTION_TYPE", nullable = false)
	private MyCollectionType myCollectionType;
	
	//收藏所屬類別的id
	@Column(name = "FAVORITEOBJECT_ID")
	private Long favoriteObjectId;

	//收藏的東西名稱
	@Column(name = "FAVORITEOBJECT_TITLE")
	private String favoriteObjectTitle;
	
	//收藏東西的連結
	@Column(name = "FAVORITEOBJECT_LINK")
	private String favoriteObjectLink;
	
	@Column(name = "FAVORITEOBJECT_PICNAME")
	private String favoriteObjectPicName;

}
