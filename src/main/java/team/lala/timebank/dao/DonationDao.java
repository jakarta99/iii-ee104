package team.lala.timebank.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

import team.lala.timebank.entity.Donation;
import team.lala.timebank.entity.Member;

public interface DonationDao extends JpaRepository<Donation, Long>, JpaSpecificationExecutor<Donation> {

	public List<Donation> findByDonator(Member memberId);

}
