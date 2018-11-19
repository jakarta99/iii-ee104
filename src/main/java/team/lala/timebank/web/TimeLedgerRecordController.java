package team.lala.timebank.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import team.lala.timebank.entity.TimeLedger;
import team.lala.timebank.service.TimeLedgerService;

@RestController
public class TimeLedgerRecordController {

	@Autowired
	private TimeLedgerService timeLedgerService;

	Long memberId = 1L;

	@RequestMapping("/TimeLedger")
	public String findTimeLedgerRecord() {
		String result = "<html><h2>[TimeLedgerRecordController Test]透過memberId查詢所有帳戶變動紀錄!</h2>";
		List<TimeLedger> timeLedgerRecord = timeLedgerService.findAllByMemberId(memberId);

		for (TimeLedger timeLedger : timeLedgerRecord) {
			result += timeLedger.toString() + "<br>";
		}

		result += "</html>";
		return result;

	}

}
