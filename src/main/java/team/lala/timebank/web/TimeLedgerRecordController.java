package team.lala.timebank.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import team.lala.timebank.entity.TimeLedger;
import team.lala.timebank.service.TimeLedgerService;
import team.lala.timebank.spec.TimeLedgerSpecification;

@Controller
@RequestMapping("/time-ledger")
public class TimeLedgerRecordController {

	@Autowired
	private TimeLedgerService timeLedgerService;

	@RequestMapping("/list")
	public String listPage(Model model) {
//		List<TimeLedger> timeLedgers = timeLedgerService.findAll();
//		model.addAttribute("timeLedgers", timeLedgers);
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
	@ResponseBody
	public String insert(TimeLedger timeLedger) {
		try {
			timeLedgerService.save(timeLedger);
			return "Success to insert [id= " + timeLedger.getId() + " timeledger]";
		} catch (Exception e) {
			e.printStackTrace();
			return "Failed to insert [id= " + timeLedger.getId() + " timeledger]";
		}
	}

	@RequestMapping("/update")
	@ResponseBody
	public String update(TimeLedger timeLedger, Model model) {
		try {
			TimeLedger dbTimeLedger = timeLedgerService.findById(timeLedger.getId());
			dbTimeLedger.setBalanceValue(timeLedger.getBalanceValue());
			dbTimeLedger.setDepositValue(timeLedger.getDepositValue());
			dbTimeLedger.setDescription(timeLedger.getDescription());
			dbTimeLedger.setMemberId(timeLedger.getMemberId());
			dbTimeLedger.setTransactionTime(timeLedger.getTransactionTime());
			dbTimeLedger.setWithdrawalValue(timeLedger.getWithdrawalValue());
			timeLedgerService.save(dbTimeLedger);
			return "Success to update [id= " + timeLedger.getId() + " timeledger]";
		} catch (Exception e) {
			e.printStackTrace();
			return "Failed to update [id= " + timeLedger.getId() + " timeledger]";
		}
		// timeLedgerService.save(timeLedger);
		// return editPage(timeLedger.getId(), model);
	}

	@RequestMapping("/delete")
	@ResponseBody
	public String delete(@RequestParam("id") Long id, Model model) {
		try {
			timeLedgerService.delete(id);
			return "Success to delete [id= " + id + " timeledger]";
		} catch (Exception e) {
			e.printStackTrace();
			return "Failed to delete [id= " + id + " timeledger]";
		}
	}

	@RequestMapping("/query")
	@ResponseBody
	public List<TimeLedger> query(TimeLedger inputTimeLedger) {
		TimeLedgerSpecification timeLedgerSpecification = new TimeLedgerSpecification(inputTimeLedger);
		List<TimeLedger> timeLedgers = timeLedgerService.findBySpecification(timeLedgerSpecification);
		System.out.println("queryTimeLedger=" +timeLedgers);
		return timeLedgers;
	}
}
