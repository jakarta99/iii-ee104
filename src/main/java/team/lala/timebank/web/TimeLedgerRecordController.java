package team.lala.timebank.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import team.lala.timebank.entity.TimeLedger;
import team.lala.timebank.service.TimeLedgerService;

@Controller
@RequestMapping("/time-ledger")
public class TimeLedgerRecordController {

	@Autowired
	private TimeLedgerService timeLedgerService;

	@RequestMapping("/list")
	public String listPage(Model model) {
		List<TimeLedger> timeLedgers = timeLedgerService.findAll();
		model.addAttribute("timeLedgers", timeLedgers);
		return "/time_ledger/time-ledger_list";
	}
	
	@RequestMapping("/add")
	public String addPage() {
		return "/time_ledger/time-ledger_add";
	}
	
	@RequestMapping("/edit")
	public String editPage(@RequestParam("id") Long id, Model model) {
		List<TimeLedger> timeLedger = timeLedgerService.findAllByMemberId(id);
		model.addAttribute("timeLedger", timeLedger);
		return "/time_ledger/time-ledger_edit";
	}
	
	@RequestMapping("delete")
	public String deletePage(@RequestParam("id") Long id, Model model) {
		timeLedgerService.delete(id);
		return "/time_ledger/time-ledger_list";
	}

//	Long memberId = 1L;
//
//	@RequestMapping("/TimeLedger")
//	public String findTimeLedgerRecord() {
//		String result = "<html><h2>[TimeLedgerRecordController Test]透過memberId查詢所有帳戶變動紀錄!</h2>";
//		List<TimeLedger> timeLedgerRecord = timeLedgerService.findAllByMemberId(memberId);
//
//		for (TimeLedger timeLedger : timeLedgerRecord) {
//			result += timeLedger.toString() + "<br>";
//		}
//
//		result += "</html>";
//		return result;
//
//	}
	
	

}
