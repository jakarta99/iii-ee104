package team.lala.timebank.service;

import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import team.lala.timebank.dao.DonationDao;
import team.lala.timebank.entity.Donation;

@Service
public class DonationService {

	@Autowired
	private DonationDao donationDao;

	public Donation update(Donation d) {
		Donation donation =donationDao.save(d);
		return donation;
	}

	public Donation findById(Long id) {
		Donation donation = donationDao.getOne(id);
		return donation;
	}

	public Collection<Donation> findAll() {
		Collection<Donation> donations = donationDao.findAll();
		return donations;
	}

	public void deleteById(Long id) {
		donationDao.deleteById(id);
	}

	// 查某人所有的Donations(更改by Brian)
	public Collection<Donation> findByMemberId(Long memberId) {

		Collection<Donation> donations = donationDao.findByMemberId(memberId);

		return donations;

	}

}
