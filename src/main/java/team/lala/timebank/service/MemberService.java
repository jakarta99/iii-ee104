package team.lala.timebank.service;

import team.lala.timebank.dao.MemberDao;
import team.lala.timebank.entity.Member;

public class MemberService {

	private MemberDao memberDao = new MemberDao();
	
	public void insert(Member member) {
		
		memberDao.insert(member);
		
		
	}
	
	
}
