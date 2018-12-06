package team.lala.timebank.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import team.lala.timebank.entity.Member;
import team.lala.timebank.entity.Order;
import team.lala.timebank.entity.Requests;
import team.lala.timebank.service.RequestsService;
import team.lala.timebank.spec.MemberSpecification;
import team.lala.timebank.spec.RequestSpecification;

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

	@RequestMapping("/div")
	public String divPage(Model model) {
		List<Requests> requests = requestsService.findAll();

		model.addAttribute("requests", requests);

		return "/request/request_div";
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
	@ResponseBody
	public Map<String, String> deletePage(@RequestParam("id") Long id, Model model) {
		Map<String, String> msg = new HashMap<>();

		try {
			requestsService.delete(id);
			msg.put("msg", "刪除成功");

		} catch (Exception e) {
			msg.put("msg", "刪除失敗");

			e.printStackTrace();
		}
		return msg;
	}

	@RequestMapping("/update")
	@ResponseBody
	public Map<String, Object> update(Requests requests, Model model) {
		Map<String, Object> msg = new HashMap<>();
		// Requests r =requestsService.getOne(requests.getId());
		// r.setJobArea(requests.getJobArea());
		// r.setJobTitle(requests.getJobTitle());
		// r.setServiceType(requests.getServiceType());
		// r.setTermType(requests.getTermType());
		// r.setTimeValue(requests.getTimeValue());

		try {
			requestsService.save(requests);
			msg.put("requestinfo", requests);
			msg.put("msg", "資料更新成功");
			System.out.println("資料更新成功");
		} catch (Exception e) {
			msg.put("requestinfo", requests);
			msg.put("msg", "資料更新失敗");
			System.out.println("資料更新失敗");
			e.printStackTrace();
		}

		return msg;
	}

	@RequestMapping("/insert")
	@ResponseBody
	public Map<String, String> insert(Requests requests, Model model) {
		Map<String, String> msg = new HashMap<>();

		try {
			requestsService.save(requests);
			msg.put("msg", "新增成功");
			System.out.println("新增成功");
		} catch (Exception e) {
			msg.put("msg", "新增失敗");
			System.out.println("新增失敗");
			e.printStackTrace();
		}
		return msg;
	}

	@RequestMapping("/query")
	@ResponseBody
	public List<Requests> query(Requests inputRequests) {
		RequestSpecification requestSpecification=new RequestSpecification(inputRequests);
		List<Requests> requests = requestsService.findBySpecification(requestSpecification);
		return requests;
	}
	

		
		
		
		
	

}
