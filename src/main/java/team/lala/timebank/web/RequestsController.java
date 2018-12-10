package team.lala.timebank.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import team.lala.timebank.commons.ajax.AjaxResponse;
import team.lala.timebank.commons.ajax.PageResponse;
import team.lala.timebank.entity.Member;
import team.lala.timebank.entity.Order;
import team.lala.timebank.entity.Requests;
import team.lala.timebank.service.RequestsService;
import team.lala.timebank.spec.MemberSpecification;
import team.lala.timebank.spec.OrderSpecification;
import team.lala.timebank.spec.RequestSpecification;

@Controller
@RequestMapping("/request")
public class RequestsController {

	@Autowired
	private RequestsService requestsService;

	@RequestMapping("/list2")
	public String listPage(Model model) {
		List<Requests> requests = requestsService.findAll();

		model.addAttribute("requests", requests);

		return "/request/request_list2";
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
	public AjaxResponse<Requests> deletePage(@RequestParam("id") Long id, Model model) {
		AjaxResponse<Requests> response = new AjaxResponse<Requests>();

		try {
			response.setObj(requestsService.getOne(id));
			requestsService.delete(id);

		} catch (Exception e) {
			response.addMessage("刪除失敗，" + e.getMessage());

			e.printStackTrace();
		}
		return response;
	}

	@RequestMapping("/update")
	@ResponseBody
	public AjaxResponse<Requests> update(Requests requests) {
		AjaxResponse<Requests> response = new AjaxResponse<Requests>();
		// Requests r =requestsService.getOne(requests.getId());
		// r.setJobArea(requests.getJobArea());
		// r.setJobTitle(requests.getJobTitle());
		// r.setServiceType(requests.getServiceType());
		// r.setTermType(requests.getTermType());
		// r.setTimeValue(requests.getTimeValue());
		try {
			requestsService.save(requests);
			response.setObj(requests);
		} catch (Exception e) {
			response.addMessage("修改失敗，" + e.getMessage());
			e.printStackTrace();
		}

		return response;
	}

	@RequestMapping("/insert")
	@ResponseBody
	public AjaxResponse<Requests> insert(Requests requests) {
		AjaxResponse<Requests> response = new AjaxResponse<Requests>();

		try {
			requestsService.save(requests);
			response.setObj(requests);
		} catch (Exception e) {
			response.addMessage("新增失敗，" + e.getMessage());
			e.printStackTrace();
		}
		return response;
	}

	@RequestMapping("/query")
	@ResponseBody
	 public List<Requests> query(Requests inputRequests) {
	 System.out.println("inputRequests="+inputRequests);
	 RequestSpecification requestSpecification=new RequestSpecification(inputRequests);
	 List<Requests> requests =requestsService.findBySpecification(requestSpecification);
	 System.out.println(requests);
	 return requests;
	 }
//	public PageResponse<Requests> query(Requests requests, @RequestParam("pageNumber") Integer pageNumber,
//			@RequestParam("pageSize") Integer pageSize) {
//		PageResponse<Requests> response = new PageResponse<Requests>();
//
//		try {
//			RequestSpecification requestSpecification = new RequestSpecification(requests);
//			PageRequest thisPage = PageRequest.of(pageNumber, pageSize);
//			Page<Requests> requestPage = requestsService.findBySpecification(requestSpecification, thisPage);
//			response.setPage(requestPage);
//		} catch (Exception e) {
//			response.addMessage("查詢失敗，" + e.getMessage());
//			e.printStackTrace();
//		}
//
//		return response;
//	}

}
