package team.lala.timebank.service;

import java.util.List;
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

	//Anchor 功能與下方findById雷同，是否需刪除 或 改List
	public Member findMemberById(Long id) {
		Member member = memberDao.getOne(id);
		return member;
	}
	
	public Member findById(Long id){
		Optional<Member> m = memberDao.findById(id);
		Member member = m.orElse(null);
		return member;
	}

	public List<Member> findAll() {
		List<Member> members = memberDao.findAll();
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
	public Member findByLoginAccount(Member m) {
		// 根據帳號在資料庫中尋找
		Member member = null;
		member = memberDao.findByLoginAccount(m.getLoginAccount());
		return member;

	}


}
