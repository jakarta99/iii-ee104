package team.lala.timebank.web;

import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import team.lala.timebank.entity.Requests;
import team.lala.timebank.entity.TimeLedger;
import team.lala.timebank.service.MemberService;
import team.lala.timebank.service.RequestsService;
import team.lala.timebank.service.TimeLedgerService;

@RestController
public class TimeLedgerController {
	@Autowired
	private RequestsService requestsService;
	@Autowired
	private TimeLedgerService timeLedgerService;
	@Autowired
	private MemberService memberService;

	Long memberId = 1L;
	Long requestsId = 1l;

	@RequestMapping("/user")
	public String listMyTimeLedgers() {
		// 1. List my ledgers
		Collection<TimeLedger> timeLedgerList = timeLedgerService.getAll(memberId);
		String result = "<html><h1>Hello World!</h1><p>";
		for (TimeLedger timeLedger : timeLedgerList) {
			result += timeLedger.toString() + "<br>";

		}
		result += "</p><p>";

		// 2. Show Job List
		Collection<Requests> requestsList = requestsService.findAll();
		if (requestsList != null) {
			for (Requests requests : requestsList) {
				result += requests.toString() + "<br>";
			}
		}
		result += "</p><p>";

		// 3. Choose one Job (id:1) from Job List
		Requests requests1 = requestsService.findByRequestListId(requestsId);
		if (requests1 != null) {
			result += requests1.toString() + "<br>";

		} else {
			result += "cannot find requestsId = " + requestsId + "<br>";
		}
		result += "</p><p>";

		// 4. After verified, Deposit service hours
//		TimeLedger timeLedger = timeLedgerService.
//		result += "before deposit:" + timeLedger.toString();
//		timeLedgerService.deposit(job1.getTimeValue(), memberId);
//		timeLedger = timeLedgerService.searchLastTransaction(memberId);
//		result += "after deposit:" + timeLedger.toString();

		result += "</p></html>";

		return result;

	}

}
