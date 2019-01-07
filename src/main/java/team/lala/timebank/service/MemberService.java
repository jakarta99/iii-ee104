package team.lala.timebank.service;

import java.sql.SQLException;
import java.util.Date;
import java.util.List;
import java.util.Optional;

import javax.persistence.EntityManager;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;

import team.lala.timebank.dao.MemberDao;
import team.lala.timebank.dao.RoleDao;
import team.lala.timebank.entity.Member;
import team.lala.timebank.entity.Role;
import team.lala.timebank.enums.MemberType;
import team.lala.timebank.enums.YesNo;

@Service
public class MemberService {

	@Autowired
	private MemberDao memberDao;
	@Autowired
	protected EntityManager em;
	@Autowired
	private RoleDao roleDao;
	
	
    //anchor 註冊會員 增加角色(roleDao.save進資料庫)
    public Member addRole(Long memberId, Long roleId) {
    	Member member = em.find(Member.class, memberId);
        Role role = em.find(Role.class, roleId);
        role.getMembers().add(member);
        roleDao.save(role);
        return member;
    } 
	
	public Member addMemberRole(Long memberId, Long roleId) {
		Member member = em.find(Member.class, memberId);
		Role role = em.find(Role.class, roleId);
		role.addMember(member);
		return member;
	}
	
	public void deleteMemberRole(Long memberId, Long roleId) {
		Role role = roleDao.getOne(roleId);
		Member member = memberDao.getOne(memberId);
		role.deleteMember(member);
		roleDao.save(role);
		memberDao.save(member);
		 
		System.out.println("role:deleteMember");
	}
	
	public Member insert(Member newMember) throws SQLException  {
		if (newMember.getId() != null) {
			throw new SQLException();
		} 		
		newMember.setSignUpDate(new Date());
		newMember.setEmailVerification(YesNo.N);
		newMember.setOrgIdConfirmation(YesNo.N);
		Member member = memberDao.save(newMember);			
		return member;
	}
	
	
	public Member update(Member member) {
		Member dbMember = null;
		if (member.getId() != null) {
			//id not exist throws exception
			dbMember = memberDao.getOne(member.getId()); 
			dbMember.setAccount(member.getAccount());
			dbMember.setPassword(member.getPassword());
			dbMember.setName(member.getName());
			dbMember.setCertificateIdNumber(member.getCertificateIdNumber());
			dbMember.setBirthDate(member.getBirthDate());
			dbMember.setEmail(member.getEmail());
			dbMember.setTelephone(member.getTelephone());
			dbMember.setMobile(member.getMobile());
			dbMember.setCounty(member.getCounty());
			dbMember.setDistrict(member.getDistrict());
			dbMember.setAddress(member.getAddress());
			dbMember.setEmailVerification(member.getEmailVerification());
			dbMember.setBirthDate(member.getBirthDate());
			dbMember.setCertificateIdNumber(member.getCertificateIdNumber());
			dbMember.setBalanceValue(member.getBalanceValue());
			dbMember.setSumScore(member.getSumScore());
			dbMember.setScoredTimes(member.getScoredTimes());
			dbMember.setAverageScore(member.getAverageScore());
			
			if (dbMember.getMemberType() == MemberType.O) {
				dbMember.setOrgCeo(member.getOrgCeo());
				dbMember.setOrgFounder(member.getOrgFounder());
				dbMember.setOrgContactPerson(member.getOrgContactPerson());
				dbMember.setOrgContactPersonMobile(member.getOrgContactPersonMobile());
				dbMember.setOrgContactPersonTel(member.getOrgContactPersonTel());
				dbMember.setOrgFoundPurpose(member.getOrgFoundPurpose());
				dbMember.setOrgIdConfirmation(member.getOrgIdConfirmation());
				dbMember.setOrgWebsiteLink(member.getOrgWebsiteLink());
			}
			dbMember = memberDao.save(dbMember);			
		}		
		return dbMember;
	}

//	public Member save(Member m) {
//		Member member = memberDao.save(m);
//		return member;
//	}

	public void deleteById(Long id) {
		memberDao.deleteById(id);
	}

	//Anchor 功能與下方findById雷同，是否需刪除 或 改List
	public Member getOne(Long id) {
		Member member = memberDao.getOne(id);
		return member;
	}
	

	public List<Member> findAll() {
		List<Member> members = memberDao.findAll();
		return members;
	}
	
	public List<Member> findBySpecification(Specification<Member> specification) {
		return memberDao.findAll(specification);
	}
	
	public Page<Member> findBySpecification(Specification<Member> specification, Pageable page) {			
		return memberDao.findAll(specification, page);
	}
	
	
	
	public Member findByAccount(String account) {
		Member member = null;
		member = memberDao.findByAccount(account);
		return member;
	}
	
	public Member setVolunteerScore(Member volunteer,Integer score) {
		volunteer.setSumScore(volunteer.getSumScore() + score);
		volunteer.setScoredTimes(volunteer.getScoredTimes() + 1);
		volunteer.setAverageScore(new Double(volunteer.getSumScore() / volunteer.getScoredTimes()));
		
		return memberDao.save(volunteer);
		
	}


}
