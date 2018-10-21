package team.lala.timebank.service;

import java.util.Collection;

import team.lala.timebank.dao.MemberDao;
import team.lala.timebank.entity.Member;

public class MemberService {

	private MemberDao memberDao = new MemberDao();

	/**
	 * insert member
	 * 
	 * @param member
	 */
	public void insert(Member member) {
		memberDao.getConnection();
		memberDao.insert(member);
		memberDao.closeConnection();
	}

	/**
	 * update member
	 * 
	 * @param member
	 */
	public void update(Member member) {
		memberDao.getConnection();
		memberDao.update(member);
		memberDao.closeConnection();
	}

	/**
	 * find member by id
	 * 
	 * @param id
	 * @return member
	 */
	public Member findMemberById(Long id) {
		memberDao.getConnection();
		Member member = memberDao.findOne(id);
		memberDao.closeConnection();
		if (member == null) {
			System.out.println("memberId does not exist");
		}
		return member;
	}

	/**
	 * lists all the members
	 * 
	 * @return the collection of all members
	 */
	public Collection<Member> findAll() {
		memberDao.getConnection();
		Collection<Member> memberCollection = memberDao.findAll();
		memberDao.closeConnection();
		if (memberCollection == null) {
			System.out.println("memberCollection does not exist");
		}
		return memberCollection;
	}

	/**
	 * delete member by id
	 * 
	 * @param id
	 */
	public void delete(Long id) {
		memberDao.getConnection();
		memberDao.delete(id);
		memberDao.closeConnection();
	}

}
