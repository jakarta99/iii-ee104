package team.lala.timebank.dao;

import java.util.Collection;

import org.springframework.data.jpa.repository.JpaRepository;

import team.lala.timebank.entity.Donation;

public interface DonationDao extends JpaRepository<Donation, Long> {

	// 查詢某人的Donation by Brian
	public Collection<Donation> findByMemberId(Long memberId);

}
