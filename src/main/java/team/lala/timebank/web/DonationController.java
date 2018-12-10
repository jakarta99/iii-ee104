package team.lala.timebank.web;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import team.lala.timebank.entity.Donation;
import team.lala.timebank.service.DonationService;
import team.lala.timebank.spec.DonationSpecification;

@Controller
@RequestMapping("/donation")
public class DonationController {

	@Autowired
	private DonationService donationService;

	@RequestMapping("/edit")
	public String editPage(@RequestParam("id") Long id, Model model) {
		Donation donation = donationService.getOne(id);
		model.addAttribute("donation", donation);
		return "/donation/donation_edit";
	}

	@RequestMapping("/add")
	public String addPage() {
		
		return "/donation/donation_add";
	}

	@RequestMapping("/list")
	public String listPage(Model model) {
		List<Donation> donations = donationService.findAll();
		model.addAttribute("donations", donations);
		return "/donation/donation_list";
	}

	@RequestMapping("/insert")
	public String insertDonation(Donation donation) {

		donationService.save(donation);

		return "redirect:/donation/add";
	}

	@RequestMapping("/delete")
	@ResponseBody
	public String deleteDonation(@RequestParam("id") Long id) {
		try {
			donationService.deleteById(id);
			return "delete id " + id + " success";
		} catch (Exception e) {
			e.printStackTrace();
			return "delete fail";
		}

	}

	@RequestMapping("/update")
	public String updateDonation(Donation donation) {

		Donation dbDonation = donationService.getOne(donation.getId());

		dbDonation.setValue(donation.getValue());
		donationService.save(dbDonation);

		return "redirect:/donation/list";
	}

	@RequestMapping("/query")
	@ResponseBody
	public List<Donation> queryDonation(Donation inputDonation){
		
		DonationSpecification donationSpec = new DonationSpecification(inputDonation);
		
		List<Donation> donations = donationService.findBySpecification(donationSpec);
		
		return donations;
	}

}
