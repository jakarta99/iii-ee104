package team.lala.timebank.web;

import java.util.List;
import java.util.Optional;

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
		Optional<Penalty> penalty1 = penaltyService.findById(id);
		Penalty penalty2 = penalty1.orElse(null);
		model.addAttribute("penalty", penalty2);
		return "/penalty/penalty_edit";

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
