package team.lala.timebank.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import team.lala.timebank.dao.OrgMemberDao;
import team.lala.timebank.entity.Member;
import team.lala.timebank.entity.OrgMember;

@Service
public class OrgMemberService {

	@Autowired
	private OrgMemberDao orgmemberDao;

	public OrgMember save(OrgMember m) {
		OrgMember member = orgmemberDao.save(m);
		return member;
	}

	public void deleteById(Long id) {
		orgmemberDao.deleteById(id);
	}

	//Anchor 功能與下方findById雷同，是否需刪除 或 改List
	public OrgMember getOne(Long id) {
		OrgMember member = orgmemberDao.getOne(id);
		return member;
	}
	
	public OrgMember findById(Long id){
		Optional<OrgMember> m = orgmemberDao.findById(id);
		OrgMember member = m.orElse(null);
		return member;
	}

	public List<OrgMember> findAll() {
		List<OrgMember> members = orgmemberDao.findAll();
		return members;
	}

	


}
