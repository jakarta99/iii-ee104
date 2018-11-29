package team.lala.timebank.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import team.lala.timebank.entity.Penalty;
import team.lala.timebank.service.PenaltyService;

@Controller
@RequestMapping("/penalty")
public class PenaltyController {

	@Autowired
	private PenaltyService penaltyService;

	@RequestMapping("/add")
	public String add() {

		return "/penalty/penalty_add";

	}
	
	@RequestMapping("/insert")
	public String insert(Penalty penalty) {		
		penaltyService.save(penalty);		
		return "/penalty/penalty_add";
	}

	@RequestMapping("/edit")
	public String edit(@RequestParam("id") Long id, Model model) {
		Penalty penalty = penaltyService.getOne(id);
		model.addAttribute("penalty", penalty);
		return "/penalty/penalty_edit";

	}
	
	@RequestMapping("/update")
	public String update(Penalty penalty, Model model) {
		Penalty penalty1 = penaltyService.getOne(penalty.getId());
		penalty1.setPenaltyTimeValue(penalty.getPenaltyTimeValue());
		penalty1.setStatus(penalty.getStatus());
		penaltyService.save(penalty1);
		return "/penalty/penalty_list";
	}

	@RequestMapping("/delete")
	public String delete(@RequestParam("id") Long id, Model model) {
		penaltyService.delete(id);
		return list(model);

	}

	@RequestMapping("/list")
	public String list(Model model) {
		List<Penalty> penalties = penaltyService.findAll();
		model.addAttribute("penalties", penalties);
		return "/penalty/penalty_list";

	}

}
