package team.lala.timebank.service;

import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import team.lala.timebank.dao.MemberDao;
import team.lala.timebank.dao.RoleDao;
import team.lala.timebank.entity.Member;
import team.lala.timebank.entity.Role;


@Service
public class RoleService {

	@Autowired
	private RoleDao roleDao ;
	
	@Autowired
	private MemberDao memberDao;
	
	public Role insert(Role r) {
		//FIXME		
		return r; 
	}
	
	public Role update(Role r) {
		//FIXME
		return r;
	}
	
	public Role save(Role r) {
		//FIXME delete it 
		Role role = roleDao.save(r);
		return role;
	}
	
	public List<Role> findAll(){
		List<Role> roleList = roleDao.findAll();
		return roleList;
	}
	
	public Role getOne(Long id) {
		Role role = roleDao.getOne(id);
		return role;
	}

	public void deleteById(Long id) {
		roleDao.deleteById(id);
	}
	
	public void deleteMemberRole(Long memberId, Long roleId) {
		 Role role = roleDao.getOne(roleId);
		 Member member = memberDao.getOne(memberId);
		 role.deleteMember(member);
		 roleDao.save(role);
		 memberDao.save(member);
		 
		 System.out.println("role:deleteMember");
	 }
	
	
	
}
