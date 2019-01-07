package team.lala.timebank.service;

import java.security.Principal;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;

import team.lala.timebank.dao.DonationDao;
import team.lala.timebank.entity.Donation;
import team.lala.timebank.entity.Member;
import team.lala.timebank.entity.TimeLedger;
import team.lala.timebank.spec.DonationSpecification;

@Service
public class DonationService {

	@Autowired
	private DonationDao donationDao;

	public Donation insert(Donation d) {
		d.setDonateTime(new Date());
		Donation donation = donationDao.save(d);
		return donation;
	}

	public Donation getOne(Long id) {
		Donation donation = donationDao.getOne(id);
		return donation;
	}
	
	public Donation update(Donation donation) {
		Donation dbDonation = null;
		if(donation.getId() != null) {
			dbDonation = donationDao.getOne(donation.getId());
			dbDonation.setValue(donation.getValue());
			dbDonation = donationDao.save(dbDonation);
		}
		return dbDonation;
	}
	
	public List<Donation> findAll() {
		List<Donation> donations = donationDao.findAll();
		return donations;
	}
	
	public List<Donation> findBySpecification(Specification<Donation> specification) {
		return donationDao.findAll(specification);
	}
	
	public Page<Donation> findBySpecification(Specification<Donation> specification, Pageable page) {
		return donationDao.findAll(specification, page);
	}
	
	//list for user
	public Page<Donation> findByDonatorIdAndSpecification(Principal principal, Donation donation,
			PageRequest pageRequest){
		donation.setDonatorAccount(principal.getName());
		DonationSpecification donationSpec = new DonationSpecification(donation);
		Page<Donation> donations = this.findBySpecification(donationSpec, pageRequest);
		return donations;
	}
	
	public void deleteById(Long id) {
		donationDao.deleteById(id);
	}

	// 查某人所有的Donations(更改by Brian)
	public List<Donation> findByMemberId(Member memberId) {

		List<Donation> donations = donationDao.findByDonator(memberId);

		return donations;

	}

}
