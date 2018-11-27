package team.lala.timebank.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import team.lala.timebank.entity.Order;
import team.lala.timebank.entity.Requests;
import team.lala.timebank.service.RequestsService;

@Controller
@RequestMapping("/request")
public class RequestsController {

	@Autowired
	private RequestsService requestsService;

	@RequestMapping("/list")
	public String listPage(Model model) {
		List<Requests> requests = requestsService.findAll();

		model.addAttribute("requests", requests);

		return "/request/request_list";
	}

	@RequestMapping("/add")
	public String addPage() {
		
		return "/request/request_add";
	}

	@RequestMapping("/edit")
	public String editPage(@RequestParam("id") Long id, Model model) {
		Requests request = requestsService.getOne(id);
		model.addAttribute("request", request);
		return "/request/request_edit";
	}

	@RequestMapping("/delete")
	public String deletePage(@RequestParam("id") Long id, Model model) {
		requestsService.delete(id);
		
		return listPage(model);
	}
	
	@RequestMapping("/update")
	public String update(Requests requests, Model model) {
		
//		Requests r =requestsService.getOne(requests.getId());
		
//		r.setJobArea(requests.getJobArea());
//		r.setJobTitle(requests.getJobTitle());
//		r.setServiceType(requests.getServiceType());
//		r.setTermType(requests.getTermType());
//		r.setTimeValue(requests.getTimeValue());
		
		requestsService.save(requests);
		
		
		return "redirect:/request/list";
	}
	
	@RequestMapping("/insert")
	public String insert(Requests requests) {
		
		requestsService.save(requests);
		
		
		return "redirect:/request/list";
	}
	

}
