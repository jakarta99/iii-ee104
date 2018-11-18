package team.lala.timebank.service;

import java.util.Collection;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import team.lala.timebank.dao.MemberDao;
import team.lala.timebank.entity.Member;

@Service
public class MemberService {

	@Autowired
	private MemberDao memberDao;

	public Member save(Member m) {
		Member member = memberDao.save(m);
		return member;
	}

	public void deleteById(Long id) {
		memberDao.deleteById(id);
	}

	public Member findMemberById(Long id) {
		Member member = memberDao.getOne(id);
		return member;
	}
	
	public Member findById(Long id){
		Optional<Member> m = memberDao.findById(id);
		Member member = m.orElse(null);
		return member;
	}

	public Collection<Member> findAll() {
		Collection<Member> members = memberDao.findAll();
		return members;
	}

	public Member login(String account, String password) {
		Member member = memberDao.findByLoginAccount(account);
		if (member != null) {
			if (member.getPassword().equals(password)) {
				return member;
			}
		}
		return null;
	}

	// louis
	public boolean checkAccountDuplicates(Member member) {
		// 根據帳號在資料庫中尋找
		member = memberDao.findByLoginAccount(member.getLoginAccount());
		if (member != null) {
			return false;
		} else {
			memberDao.save(member);
			return true;
		}
	}


}
