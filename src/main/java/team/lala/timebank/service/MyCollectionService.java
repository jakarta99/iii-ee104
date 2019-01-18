package team.lala.timebank.service;

import java.security.Principal;
import java.util.Date;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;

import team.lala.timebank.dao.InternationalVolunteerDao;
import team.lala.timebank.dao.MemberDao;
import team.lala.timebank.dao.MissionDao;
import team.lala.timebank.dao.MyCollectionDao;
import team.lala.timebank.dao.ServiceTypeDao;
import team.lala.timebank.entity.InternationalVolunteer;
import team.lala.timebank.entity.Mission;
import team.lala.timebank.entity.MyCollection;
import team.lala.timebank.entity.ServiceType;
import team.lala.timebank.enums.MissionStatus;
import team.lala.timebank.enums.MyCollectionType;

@Service
public class MyCollectionService {

	@Autowired
	private MyCollectionDao myCollectionDao;

	@Autowired
	private MemberDao memberDao;

	@Autowired
	private MissionDao missionDao;

	@Autowired
	private InternationalVolunteerDao internationalVolunteerDao;

	public MyCollection save(MyCollection m) {
		MyCollection myCollection = myCollectionDao.save(m);
		return myCollection;
	}

	public List<MyCollection> findAll() {
		List<MyCollection> myCollectionList = myCollectionDao.findAll();
		return myCollectionList;
	}

	public List<MyCollection> findByMyCollectionTypeAndMemberAccount(MyCollectionType myCollectionType,
			String memberAccount) {

		return myCollectionDao.findByMyCollectionTypeAndMember(myCollectionType,
				memberDao.findByAccount(memberAccount));
	};

	public MyCollection findByMyCollectionTypeAndMemberAccount(MyCollectionType myCollectionType, Principal principal,
			Long favoriteObjectId) {

		return myCollectionDao.findByMyCollectionTypeAndMemberAndFavoriteObjectId(myCollectionType,
				memberDao.findByAccount(principal.getName()), favoriteObjectId);
	};

	public MyCollection getOne(Long id) {
		MyCollection myCollection = myCollectionDao.getOne(id);
		return myCollection;
	}

	public void deleteById(Long id) {
		myCollectionDao.deleteById(id);
	}

	public MyCollection insert(MyCollectionType myCollectionType, Long favoriteObjectId, Principal principal) {
		MyCollection myCollection = new MyCollection();
		myCollection.setMember(memberDao.findByAccount(principal.getName()));
		myCollection.setFavoriteObjectId(favoriteObjectId);
		// myCollection.setOrganization(memberDao.getOne(organizationId));
		myCollection.setMyCollectionType(myCollectionType);
		// myCollection.setInternationalVolunteer(null);
		// myCollection.setMission(null);
		return myCollectionDao.save(myCollection);
	}

	public void deleteByMemberAndMyCollectionType(MyCollectionType myCollectionType, Long favoriteObjectId,
			Principal principal) {
		List<MyCollection> myCollections = this.findByMyCollectionTypeAndMemberAccount(myCollectionType,
				principal.getName());
		for (MyCollection myCollect : myCollections) {
			if (myCollect.getFavoriteObjectId() == favoriteObjectId) {
				this.deleteById(myCollect.getId());
			}
		}
	}
	
	public Page<MyCollection> findByMember(Principal principal,Integer page,Optional<Integer> length) {
		Sort sort = new Sort(Sort.Direction.DESC, "id");
		Page<MyCollection> myCollections = myCollectionDao.findByMember(memberDao.findByAccount(principal.getName()), PageRequest.of(page, length.orElse(10),sort));
		return myCollections;
	}
}
