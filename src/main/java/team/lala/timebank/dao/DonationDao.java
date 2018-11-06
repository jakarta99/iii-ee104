package team.lala.timebank.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import team.lala.timebank.entity.Donation;

public interface DonationDao extends JpaRepository<Donation, Long> {
	
}

