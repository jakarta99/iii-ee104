package team.lala.timebank.web.admin;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.extern.slf4j.Slf4j;
import team.lala.timebank.commons.ajax.AjaxResponse;
import team.lala.timebank.commons.ajax.PageResponse;
import team.lala.timebank.entity.Order;
import team.lala.timebank.entity.TimeLedger;
import team.lala.timebank.service.TimeLedgerService;
import team.lala.timebank.spec.OrderSpecification;
import team.lala.timebank.spec.TimeLedgerSpecification;
@Slf4j
@Controller
@RequestMapping("/admin/time-ledger")
public class AdminTimeLedgerRecordController {

	@Autowired
	private TimeLedgerService timeLedgerService;

	@RequestMapping("/list")
	public String listPage(Model model) {
//		List<TimeLedger> timeLedgers = timeLedgerService.findAll();
//		model.addAttribute("timeLedgers", timeLedgers);
		return "/admin/time_ledger/time-ledger_list";
	}

	@RequestMapping("/add")
	public String addPage() {
		return "/admin/time_ledger/time-ledger_add";
	}

	@RequestMapping("/edit")
	public String editPage(@RequestParam("id") Long id, Model model) {
		TimeLedger timeLedger = timeLedgerService.findById(id);
		model.addAttribute("timeLedger", timeLedger);
		return "/admin/time_ledger/time-ledger_edit";
	}

	@RequestMapping("/insert")
	@ResponseBody
	public AjaxResponse<TimeLedger> insert(TimeLedger timeLedger) {
		AjaxResponse<TimeLedger> response = new AjaxResponse<TimeLedger>();
		try {
			timeLedgerService.insert(timeLedger);
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
			timeLedgerService.update(timeLedger);
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
	public Page<TimeLedger> queryTimeLedger(TimeLedger inputTimeLedger,
			@RequestParam(name = "start", required = false) Optional<Integer> start, 
			@RequestParam(name = "length", required = false) Optional<Integer> length){
		int page = start.orElse(0)/length.orElse(10);
		TimeLedgerSpecification timeLedgerSpec = new TimeLedgerSpecification(inputTimeLedger);
		Page<TimeLedger> timeLedgers = timeLedgerService.findBySpecification(
				timeLedgerSpec, PageRequest.of(page, length.orElse(10)));
		log.debug("queryMember={}",timeLedgers.getContent());
		return timeLedgers;
	}
}
