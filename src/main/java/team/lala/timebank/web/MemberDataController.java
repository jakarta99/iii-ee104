package team.lala.timebank.web;

import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import team.lala.timebank.entity.Donation;
import team.lala.timebank.entity.Penalty;
import team.lala.timebank.service.DonationService;
import team.lala.timebank.service.MemberService;
import team.lala.timebank.service.PenaltyService;
import team.lala.timebank.service.TimeLedgerService;

@RestController
public class MemberDataController {

	@Autowired
	private MemberService memberservice;

	@Autowired
	private DonationService donationService;

	@Autowired
	private PenaltyService penaltyService;

	@Autowired
	private TimeLedgerService timeLedgetService;

	@Autowired
	private MemberService memberService;

	private Long memberId = 3L;

	@RequestMapping("/memberData")
	public String findMemberData() {
		String memberName = memberService.findMemberById(memberId).getName();
		String result = "<html><h3>查詢" + memberName + "資料</h3>";

		int totalDonateTime = 0;
		Collection<Donation> donations = donationService.findDonationsByMemberId(memberId);
		for (Donation donation : donations) {
			totalDonateTime += donation.getDonateValue();
		}
		result += "您的捐贈時間為:" + totalDonateTime + "小時<br>";

		int totalPenaltyTime = 0;
		Collection<Penalty> penaltys = penaltyService.findPenaltyTimeValueByMemberId(memberId);
		for (Penalty penalty : penaltys) {
			totalPenaltyTime += penalty.getPenaltyTimeValue();
		}

		result += "您的處罰時間為:" + totalPenaltyTime + "小時<br>";
		int balanceValue =0;
		if(timeLedgetService.getLastTransaction(memberId)==null) {
			
		}else {
		balanceValue = timeLedgetService.getLastTransaction(memberId).getBalanceValue();
		}
		result += "您的餘額為:" + balanceValue + "小時<br>";

		result += "</html>";
		return result;
	}

}
