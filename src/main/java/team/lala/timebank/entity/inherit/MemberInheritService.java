package team.lala.timebank.entity.inherit;

import java.util.Collection;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import team.lala.timebank.entity.Member;

@Service
public class MemberInheritService {
	
	@Autowired 
	private MemberInheritDao dao;
	
	public MemberInherit findById(Long id) {
		Optional<MemberInherit> m = dao.findById(id);
		MemberInherit member = m.orElse(null);
		return member;
	}
	
	public MemberInherit getOne(Long id) {
		MemberInherit member = dao.getOne(id);
		return member;
	}
	
	public MemberInherit save(MemberInherit m) {
		MemberInherit member = dao.save(m);
		return member;
	}

	public void deleteById(Long id) {
		dao.deleteById(id);
	}
	
	public Collection<MemberInherit> findAll() {
		Collection<MemberInherit> members = dao.findAll();
		return members;
	}


	

	
}
