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

import team.lala.timebank.commons.ajax.AjaxResponse;
import team.lala.timebank.entity.Penalty;
import team.lala.timebank.service.PenaltyService;
import team.lala.timebank.spec.PenaltySpecification;

@Controller
@RequestMapping("/admin/penalty")
public class AdminPenaltyController {

	@Autowired
	private PenaltyService penaltyService;

	@RequestMapping("/add")
	public String add() {
		return "/admin/penalty/penalty_add";

	}

	@RequestMapping("/edit")
	public String edit(@RequestParam("id") Long id, Model model) {
		Penalty penalty = penaltyService.getOne(id);
		model.addAttribute("penalty", penalty);
		return "/admin/penalty/penalty_edit";

	}

	@RequestMapping("/update")
	@ResponseBody
	public AjaxResponse<Penalty> update(Penalty penalty, Model model) {
		AjaxResponse<Penalty> ajaxResponse = new AjaxResponse<Penalty>();
		try {
			ajaxResponse.setObj(penaltyService.update(penalty));
		} catch (Exception e) {
			ajaxResponse.addMessage(e.getMessage());
			e.printStackTrace();
		}
		return ajaxResponse;
	}

	@RequestMapping("/insert")
	@ResponseBody
	public AjaxResponse<Penalty> insert(Penalty penalty) {
		AjaxResponse<Penalty> ajaxResponse = new AjaxResponse<Penalty>();
		try {
			ajaxResponse.setObj(penaltyService.save(penalty));
		} catch (Exception e) {
			ajaxResponse.addMessage(e.getMessage());
			e.printStackTrace();
		}
		return ajaxResponse;
	}

	@RequestMapping("/delete")
	@ResponseBody
	public AjaxResponse<Penalty> delete(@RequestParam("id") Long id) {
		AjaxResponse<Penalty> ajaxResponse = new AjaxResponse<Penalty>();
		try {
			penaltyService.delete(id);
		} catch (Exception e) {
			ajaxResponse.addMessage(e.getMessage());
			e.printStackTrace();
		}
		return ajaxResponse;
	}

	@RequestMapping("/list")
	public String list() {
		return "/admin/penalty/penalty_list";
	}

	@ResponseBody
	@RequestMapping("/query")
	public Page<Penalty> queryPenalty(Penalty inputPenalty, @RequestParam(value="start",required=false) Optional<Integer> start, 
			@RequestParam(value="length",required=false) Optional<Integer> length) {
		int page = start.orElse(0)/length.orElse(10);
		PenaltySpecification penaltySpec = new PenaltySpecification(inputPenalty);
		Page<Penalty> penalties = penaltyService.findBySpecification(
				penaltySpec, PageRequest.of(page, length.orElse(10)));
		return penalties;

	}

}
