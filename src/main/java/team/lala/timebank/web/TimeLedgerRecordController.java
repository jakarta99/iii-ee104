package team.lala.timebank.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import team.lala.timebank.entity.Order;
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
		TimeLedger timeLedger = timeLedgerService.findById(id);
		model.addAttribute("timeLedger", timeLedger);
		return "/time_ledger/time-ledger_edit";
	}

	@RequestMapping("/insert")
	public String insert(TimeLedger timeLedger) {
		timeLedgerService.save(timeLedger);
		return "/time_ledger/time-ledger_add";
	}

	@RequestMapping("/update")
	public String update(TimeLedger timeLedger, Model model) {
//		TimeLedger dbTimeLedger = timeLedgerService.findById(timeLedger.getId());
//		dbTimeLedger.setBalanceValue(timeLedger.getBalanceValue());
//		dbTimeLedger.setDepositValue(timeLedger.getDepositValue());
//		dbTimeLedger.setDescription(timeLedger.getDescription());
//		dbTimeLedger.setMemberId(timeLedger.getMemberId());
//		dbTimeLedger.setTransactionTime(timeLedger.getTransactionTime());
//		dbTimeLedger.setWithdrawalValue(timeLedger.getWithdrawalValue());
//		timeLedgerService.save(dbTimeLedger);
		
		timeLedgerService.save(timeLedger);
		return editPage(timeLedger.getId(), model);
	}

	@RequestMapping("/delete")
	public String delete(@RequestParam("id") Long id, Model model) {
		timeLedgerService.delete(id);
		return listPage(model);
	}

}
