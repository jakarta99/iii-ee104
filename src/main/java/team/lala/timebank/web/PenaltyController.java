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
	public String addPage() {

		return "/penalty/penalty_add";

	}

	@RequestMapping("/edit")
	public String editPage(@RequestParam("id") Long id, Model model) {
		Optional<Penalty> penalty = penaltyService.findById(id);
		model.addAttribute("penalty", penalty);
		return "/penalty/penalty_edit";

	}

	@RequestMapping("/delete")
	public String deletePage(@RequestParam("id") Long id, Model model) {
		penaltyService.delete(id);
		return "/penalty/penalty_list";

	}

	@RequestMapping("/list")
	public String listPage(Model model) {
		List<Penalty> penalties = penaltyService.findAll();
		model.addAttribute("penalties", penalties);
		return "/penalty/penalty_list";

	}

}
