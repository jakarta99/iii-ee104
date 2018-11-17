package team.lala.timebank.service;

import java.util.Collection;

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
	public Member findByLoginAccount(Member member) {
		// 根據帳號在資料庫中尋找
		Member m = null;
		m = memberDao.findByLoginAccount(member.getLoginAccount());
		return m;

	}

	// /**
	// * insert member
	// *
	// * @param member
	// */
	// public void insert(Member member) {
	// memberDao.getConnection();
	// memberDao.insert(member);
	// memberDao.closeConnection();
	// }
	//
	// /**
	// * update member
	// *
	// * @param member
	// */
	// public void update(Member member) {
	// memberDao.getConnection();
	// memberDao.update(member);
	// memberDao.closeConnection();
	// }
	//
	// /**
	// * find member by id
	// *
	// * @param id
	// * @return member
	// */
	// public Member findMemberById(Long id) {
	// memberDao.getConnection();
	// Member member = memberDao.findOne(id);
	// memberDao.closeConnection();
	// if (member == null) {
	// System.out.println("memberId does not exist");
	// }
	// return member;
	// }
	//
	// /**
	// * lists all the members
	// *
	// * @return the collection of all members
	// */
	// public Collection<Member> findAll() {
	// memberDao.getConnection();
	// Collection<Member> memberCollection = memberDao.findAll();
	// memberDao.closeConnection();
	// if (memberCollection == null) {
	// System.out.println("memberCollection does not exist");
	// }
	// return memberCollection;
	// }
	//
	// /**
	// * delete member by id
	// *
	// * @param id
	// */
	// public void delete(Long id) {
	// memberDao.getConnection();
	// memberDao.delete(id);
	// memberDao.closeConnection();
	// }

}
