package team.lala.timebank.web;

import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
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
}
