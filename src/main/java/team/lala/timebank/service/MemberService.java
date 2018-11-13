package team.lala.timebank.service;

import java.util.Collection;
import java.util.Optional;
import java.util.regex.Pattern;

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


	public boolean registered(String loginAccount, String password, String name, String type, String email,
			String telephone, String mobile) {
		// 檢查帳號
		boolean baccount = false;
		if (loginAccount == null || loginAccount.trim().length() < 6) {
			System.out.println("帳號長度必須大於等於6");
		} else {
			for (int i = 0; i < loginAccount.length(); i++) {
				String test = loginAccount.substring(i, i + 1);
				if (test.matches("[a-zA-Z0-9]")) {
					baccount = true;
				} else {
					System.out.println("帳號格式錯誤");
					baccount = false;
					break;
				}
			}
		}
		// 檢查密碼
		boolean bpassword = false;
		if (password == null || password.trim().length() < 6) {
			System.out.println("密碼長度必須大於等於6");
		} else {
			for (int i = 0; i < password.length(); i++) {
				String test = password.substring(i, i + 1);
				if (test.matches("[a-zA-Z0-9]")) {
					bpassword = true;
				} else {
					System.out.println("密碼格式錯誤");
					bpassword = false;
					break;
				}
			}
		}
		// 檢查名子
		boolean bname = false;
		if (name == null || name.trim().length() < 2) {
			System.out.println("名子長度必須大於等於2");
		} else {
			for (int i = 0; i < name.length(); i++) {
				String test = name.substring(i, i + 1);
				if (test.matches("[\\u4E00-\\u9FA5]")) {
					bname = true;
				} else {
					System.out.println("名子格式錯誤");
					bname = false;
					break;
				}
			}
		}
		// 檢查email
		boolean bemail = false;
		if (email == null || email.trim().length() == 0) {
			System.out.println("必須輸入email");
		} else {
			String regex = "^\\w{1,63}@[a-zA-Z0-9]{2,63}\\.[a-zA-Z]{2,63}(\\.[a-zA-Z]{2,63})?$";
			Pattern p = Pattern.compile(regex);
			if (p.matcher(email).find()) {
				bemail = true;
			} else {
				bemail = false;
			}

		}
		// 檢查家電
		boolean btelephone = false;
		if (telephone == null || telephone.trim().length() != 10) {
			System.out.println("電話格式錯誤-1");
		} else {
			for (int i = 0; i < telephone.length(); i++) {
				String test = telephone.substring(i, i + 1);
				if (test.matches("[0-9]")) {
					btelephone = true;
				} else {
					System.out.println("電話格式錯誤-2");
					btelephone = false;
					break;
				}
			}
		}
		// 檢查手機
		boolean bmobile = false;
		if (mobile == null || mobile.trim().length() != 10) {
			System.out.println("手機格式錯誤");
		} else {
			for (int i = 0; i < mobile.length(); i++) {
				String test = mobile.substring(i, i + 1);
				if (test.matches("[0-9]")) {
					bmobile = true;
				} else {
					System.out.println("手機格式錯誤");
					bmobile = false;
					break;
				}
			}
		}
		if (baccount && bpassword && bemail && bname && btelephone && bmobile) {
			// 檢查格式是否都符合
			Member member = null;
			try {
				member = memberDao.findByLoginAccount(loginAccount);
				if (member != null) {
					System.out.println("帳號重複");
				}
			} catch (Exception e) {
				member = new Member();
				member.setLoginAccount(loginAccount);
				member.setPassword(password);
				member.setName(name);
				member.setEmail(email);
				member.setType(type);
				member.setTelephone(telephone);
				member.setMobile(mobile);
				memberDao.save(member);
				System.out.println("註冊成功");
				return true;
			}

			// 檢查帳號是否存在
//			if (member != null) {
//				System.out.println("帳號重複");
//			} else {
//				member = new Member();
//				member.setLoginAccount(loginAccount);
//				member.setPassword(password);
//				member.setEmail(email);
//				member.setType(type);
//				member.setTelephone(telephone);
//				member.setMobile(mobile);
//				memberDao.save(member);
//				System.out.println("註冊成功");
//				return true;
//			}
		}
		System.out.println("註冊失敗");
		return false;

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
	
	public String getNameByMemberId(Long memberId) {
		
		String name="";
		Member member=memberDao.getOne(memberId);
		name=member.getName();
		return name;
		
	}

}
