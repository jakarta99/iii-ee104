package team.lala.timebank.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import team.lala.timebank.commons.ajax.AjaxResponse;
import team.lala.timebank.commons.ajax.PageResponse;
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
	public AjaxResponse<TimeLedger> insert(TimeLedger timeLedger) {
		AjaxResponse<TimeLedger> response = new AjaxResponse<TimeLedger>();
		try {
			timeLedgerService.save(timeLedger);
		} catch (Exception e) {
			response.addMessage("Failed to insert. " + e.getMessage());
			e.printStackTrace();
		}finally {
			response.setObj(timeLedger);
		}
		return response;
	}

	@RequestMapping("/update")
	@ResponseBody
	public AjaxResponse<TimeLedger> update(TimeLedger timeLedger, Model model) {
		AjaxResponse<TimeLedger> response = new AjaxResponse<TimeLedger>();
		try {
			TimeLedger dbTimeLedger = timeLedgerService.findById(timeLedger.getId());
			dbTimeLedger.setBalanceValue(timeLedger.getBalanceValue());
			dbTimeLedger.setDepositValue(timeLedger.getDepositValue());
			dbTimeLedger.setDescription(timeLedger.getDescription());
			dbTimeLedger.setMemberId(timeLedger.getMemberId());
			dbTimeLedger.setTransactionTime(timeLedger.getTransactionTime());
			dbTimeLedger.setWithdrawalValue(timeLedger.getWithdrawalValue());
			timeLedgerService.save(dbTimeLedger);
		} catch (Exception e) {
			response.addMessage("Failed to update. " + e.getMessage());
			e.printStackTrace();
		}finally {
			response.setObj(timeLedger);
		}
		return response;
		// timeLedgerService.save(timeLedger);
		// return editPage(timeLedger.getId(), model);
	}

	@RequestMapping("/delete")
	@ResponseBody
	public AjaxResponse<TimeLedger> delete(@RequestParam("id") Long id, Model model) {
		AjaxResponse<TimeLedger> response = new AjaxResponse<TimeLedger>();
		try {
			response.setObj(timeLedgerService.findById(id));
			timeLedgerService.delete(id);
		} catch (Exception e) {
			response.addMessage("Failed to delete. " + e.getMessage());
			e.printStackTrace();
		}
		return response;
	}

//	@RequestMapping("/query")
//	@ResponseBody
//	public List<TimeLedger> query(TimeLedger inputTimeLedger) {
//		TimeLedgerSpecification timeLedgerSpecification = new TimeLedgerSpecification(inputTimeLedger);
//		List<TimeLedger> timeLedgers = timeLedgerService.findBySpecification(timeLedgerSpecification);
//		System.out.println("queryTimeLedger=" +timeLedgers);
//		return timeLedgers;
//	}
	
	@RequestMapping("/query")
	@ResponseBody
	public PageResponse<TimeLedger> queryTimeLedger(TimeLedger inputTimeLedger,
			@RequestParam("pageNumber") Integer pageNumber, @RequestParam("pageSize") Integer pageSize){
		PageResponse<TimeLedger> response = new PageResponse<TimeLedger>();
		try {
			TimeLedgerSpecification timeLedgerSpecification = new TimeLedgerSpecification(inputTimeLedger);
			PageRequest thisPage = PageRequest.of(pageNumber, pageSize);
			Page<TimeLedger> timeLedgers = timeLedgerService.findBySpecification(timeLedgerSpecification, thisPage);
			response.setPage(timeLedgers);
		} catch (Exception e) {
			response.addMessage("Failed to search. " + e.getMessage());
			e.printStackTrace();
		}
		return response;
	}
}
