package team.lala.timebank.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

import team.lala.timebank.entity.Donation;

public interface DonationDao extends JpaRepository<Donation, Long>, JpaSpecificationExecutor<Donation> {

	// 查詢某人的Donation by Brian
	public List<Donation> findByMemberId(Long memberId);

}
