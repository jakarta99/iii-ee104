package team.lala.timebank.service;

import java.time.LocalDateTime;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;

import team.lala.timebank.dao.DonationDao;
import team.lala.timebank.entity.Donation;
import team.lala.timebank.entity.Member;

@Service
public class DonationService {

	@Autowired
	private DonationDao donationDao;

	public Donation save(Donation d) {
		d.setDonateTime(LocalDateTime.now());
		Donation donation = donationDao.save(d);
		return donation;
	}

	public Donation getOne(Long id) {
		Donation donation = donationDao.getOne(id);
		return donation;
	}

	public List<Donation> findAll() {
		List<Donation> donations = donationDao.findAll();
		return donations;
	}
	
	public List<Donation> findBySpecification(Specification<Donation> specification) {
		return donationDao.findAll(specification);
	}
	
	public void deleteById(Long id) {
		donationDao.deleteById(id);
	}

	// 查某人所有的Donations(更改by Brian)
	public List<Donation> findByMemberId(Long memberId) {

		List<Donation> donations = donationDao.findByMemberId(memberId);

		return donations;

	}

}
