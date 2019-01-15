package team.lala.timebank.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

import team.lala.timebank.entity.Member;
import team.lala.timebank.entity.Mission;
import team.lala.timebank.entity.MyCollection;
import team.lala.timebank.enums.MyCollectionType;

public interface MyCollectionDao extends JpaRepository<MyCollection, Long>, JpaSpecificationExecutor<MyCollection> {

	// public List<MyCollection> findByMission(Mission mission);
	public List<MyCollection> findByMyCollectionTypeAndMember(MyCollectionType myCollectionType, Member member);

}
