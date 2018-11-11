package team.lala.timebank.dao;

import java.util.Collection;

import org.springframework.data.jpa.repository.JpaRepository;

import team.lala.timebank.entity.Donation;

public interface DonationDao extends JpaRepository<Donation, Long> {
	
	public Collection<Donation> findByMemberId(Long memberId);
	
}

