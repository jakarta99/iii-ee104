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

	public void update(Donation donation) {
		donationDao.save(donation);
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

	public int getTimeValuesByMemberId(Long memberId) {
		int timeValues = 0;
		Collection<Donation> donations = donationDao.findByMemberId(memberId);
		for (Donation donation : donations) {
			timeValues += donation.getDonateValue();

		}
		return timeValues;
	}
}
