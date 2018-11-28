package team.lala.timebank.web;

import java.util.Collection;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import team.lala.timebank.entity.Donation;
import team.lala.timebank.service.DonationService;

@Controller
@RequestMapping("/donation")
public class DonationController {

	@Autowired
	private DonationService donationService;

	@RequestMapping("/edit")
	public String editDonation(@RequestParam("id") Long id, Model model) {

		Donation donation = donationService.getOne(id);

		model.addAttribute("donation", donation);

		return "/donation/donation_edit";
	}

	@RequestMapping("/add")
	public String addDonation() {

		return "/donation/donation_add";
	}

	@RequestMapping("/list")
	public String listDonation(Model model) {

		List<Donation> donations = donationService.findAll();
		model.addAttribute("donations", donations);

		return "/donation/donation_list";
	}

	@RequestMapping("/insert")
	public String insertDonation(Donation donation) {

		donationService.save(donation);

		return "/donation/donation_add";
	}

	@RequestMapping("/delete")
	public String deleteDonation(@RequestParam("id") Long id, Model model) {

		donationService.deleteById(id);

		return listDonation(model);
	}

	@RequestMapping("/update")
	public String updateDonation(Donation donation, Model model) {

		Donation dbDonation = donationService.getOne(donation.getId());
		
		dbDonation.setDonateValue(donation.getDonateValue());
		donationService.save(dbDonation);

		return editDonation(donation.getId(), model);
	}

}
