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
public class TimeLedgerRecordController {

	@Autowired
	private TimeLedgerService timeLedgerService;

	Long memberId = 1L;

	@RequestMapping("/TimeLedger")
	public String findTimeLedgerRecord() {
		String result = "<html><h2>[TimeLedgerRecordController Test]透過memberId查詢所有帳戶變動紀錄!</h2>";
		Collection<TimeLedger> timeLedgerRecord = timeLedgerService.getAll(memberId);

		for (TimeLedger timeLedger : timeLedgerRecord) {
			result += timeLedger.toString() + "<br>";
		}

		result += "</html>";
		return result;

	}

}
