package team.lala.timebank.web;

import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import team.lala.timebank.entity.Requests;
import team.lala.timebank.service.RequestsService;


@RestController
public class RequestsController {
	
	@Autowired
	private RequestsService requestsService;
	
	private Long id = 2L;  //查詢ID2號
	
	@RequestMapping("/requests")
	public String findRequestListById() {
		String htmlString = "<html><h4>透過志工會員id查詢工作表</h4>";
		Collection<Requests> requestCollection = requestsService.findAllByMemberId(id);
		for (Requests requests : requestCollection) {
			htmlString += requests.toString() + "<br>";
		}
		htmlString += "</html>";
		return htmlString;
	}
	
	
}
