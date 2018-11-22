package team.lala.timebank.web;

import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import team.lala.timebank.entity.Donation;
import team.lala.timebank.service.DonationService;

@RestController
public class DonationController {

	@Autowired
	private DonationService donationService;

	@RequestMapping("/donation")
	public String findDonations() {
		String result = "<html><p>";
		Collection<Donation> donations = donationService.findAll();
		for (Donation donation : donations) {
			result += donation.toString() + "<br>";
		}
		result += "</p></html>";

		return result;
	}

	@RequestMapping("/edit")
	public String donation_edit(@RequestParam("id") Long id, Model model) {

		Donation donation = donationService.getOne(id);

		model.addAttribute("donation", donation);

		return "/donation_edit";
	}

	@RequestMapping("/add")
	public String donation_add() {

		return "/donation_add";
	}

	@RequestMapping("/list")
	public String donation_list(@RequestParam("id") Long id, Model model) {
		
		
		
		return "/donation_list";
	}
}
