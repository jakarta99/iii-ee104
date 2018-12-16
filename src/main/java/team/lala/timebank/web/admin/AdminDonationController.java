package team.lala.timebank.web.admin;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import team.lala.timebank.commons.ajax.AjaxResponse;
import team.lala.timebank.entity.Donation;
import team.lala.timebank.entity.Member;
import team.lala.timebank.service.DonationService;
import team.lala.timebank.spec.DonationSpecification;

@Controller
@RequestMapping("/admin/donation")
public class AdminDonationController {

	@Autowired
	private DonationService donationService;

	@RequestMapping("/edit")
	public String editPage(@RequestParam("id") Long id, Model model) {
		Donation donation = donationService.getOne(id);
		model.addAttribute("donation", donation);
		return "/admin/donation/donation_edit";
	}

	@RequestMapping("/add")
	public String addPage() {
		
		return "/admin/donation/donation_add";
	}

	@RequestMapping("/list")
	public String listPage(Model model) {
		List<Donation> donations = donationService.findAll();
		model.addAttribute("donations", donations);
		return "/admin/donation/donation_list";
	}

	@RequestMapping("/insert")
	@ResponseBody
	public AjaxResponse<Donation> insertDonation(Donation donation) {
		AjaxResponse<Donation> response = new AjaxResponse<Donation>();
		try{
			Donation insertDonation = donationService.save(donation);
			response.setObj(insertDonation);
		}catch(Exception e) {
			response.addMessage("新增失敗");
			e.printStackTrace();
		}
		return response;
	}

	@RequestMapping("/delete")
	@ResponseBody
	public AjaxResponse<Donation> deleteDonation(@RequestParam("id") Long id) {
		AjaxResponse<Donation> response = new AjaxResponse<Donation>();
		try {
			donationService.deleteById(id);
			
		} catch (Exception e) {
			e.printStackTrace();
			response.addMessage("刪除失敗");
		}
		return response;
	}

	@RequestMapping("/update")
	@ResponseBody
	public AjaxResponse<Donation> updateDonation(Donation donation) {
		AjaxResponse<Donation> response = new AjaxResponse<Donation>();
		try {
			Donation updateDonation = donationService.update(donation);
			response.setObj(updateDonation);
		}catch(Exception e) {
			response.addMessage("更新失敗");
		}
		return response;
	}

	@RequestMapping("/query")
	@ResponseBody
	public List<Donation> queryDonation(Donation inputDonation){
		
		DonationSpecification donationSpec = new DonationSpecification(inputDonation);
		
		List<Donation> donations = donationService.findBySpecification(donationSpec);
		
		return donations;
	}

}
