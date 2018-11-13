package team.lala.timebank.web;

import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import team.lala.timebank.entity.Donation;
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
	

	private Long memberId = 1L;

	@RequestMapping("/memberData")
	public String findMemberData() {
		String result = "<html><h3>查詢"+memberService.getNameByMemberId(memberId)+"資料</h3>";
		int donateTime = donationService.getTimeValuesByMemberId(memberId);
		result += "您的捐贈時間為:" + donateTime + "小時<br>";
		
		int penaltyTime = penaltyService.getPenaltyTimeValueByMemberId(memberId);
		result += "您的處罰時間為:" + penaltyTime + "小時<br>";
		
		int money = timeLedgetService.getBalanceValueByMemberId(memberId);
		result += "您的餘額為:" + money + "小時<br>";
		
		result += "</html>";
		return result;
	}

}
