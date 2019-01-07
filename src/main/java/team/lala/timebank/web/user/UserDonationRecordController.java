package team.lala.timebank.web.user;

import java.security.Principal;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.extern.slf4j.Slf4j;
import team.lala.timebank.entity.Donation;
import team.lala.timebank.entity.Member;
import team.lala.timebank.service.DonationService;

@Slf4j
@Controller
@RequestMapping("/user/donation-record")
public class UserDonationRecordController {
	
	@Autowired
	private DonationService donationService;
	
	@RequestMapping("/list")
	public String listPage(Model model) {
		return "/basic/user/donation_record/donation-record_list";
	}
	
	@RequestMapping("/query")
	@ResponseBody
	public Page<Donation> queryDonation(Donation inputDonation, Principal principal,
			@RequestParam(name = "start", required = false) Optional<Integer> start, 
			@RequestParam(name = "length", required = false) Optional<Integer> length){
		int page = start.orElse(0) / length.orElse(10);
		Page<Donation> donations = donationService.findByDonatorIdAndSpecification(principal, inputDonation,
				PageRequest.of(page, length.orElse(10)));
		return donations;
	}
	
}
