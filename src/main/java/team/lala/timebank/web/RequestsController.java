package team.lala.timebank.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import team.lala.timebank.entity.Requests;
import team.lala.timebank.service.RequestsService;

@Controller
@RequestMapping("/requests")
public class RequestsController {

	@Autowired
	private RequestsService requestsService;

	@RequestMapping("/requestsList")
	public String requestsList(Model model) {
		List<Requests> requests = requestsService.findAll();

		model.addAttribute("requests", requests);

		return "requests_requestsList";
	}

	@RequestMapping("/requestsadd")
	public String addPage(@RequestParam("id") Long id, Model model) {
		Requests request = requestsService.getOne(id);
		model.addAttribute("request", request);
		return "/requestsList_add";
	}

	@RequestMapping("/requestsedit")
	public String editPage(@RequestParam("id") Long id, Model model) {
		Requests request = requestsService.getOne(id);
		model.addAttribute("request", request);
		return "/requestsList_edit";
	}

	@RequestMapping("/requestsedelete")
	public String deletePage(@RequestParam("id") Long id, Model model) {
		Requests request = requestsService.getOne(id);
		model.addAttribute("request", request);
		return "/requestsList_delete";
	}

}
