package team.lala.timebank.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import team.lala.timebank.entity.Requests;
import team.lala.timebank.service.RequestsService;


@RestController
public class RequestsController {
	
	@Autowired
	private RequestsService requestsService;
	
	private Long memberid = 2L;  //查詢ID2號
	
	@RequestMapping("/requests")
	public String findRequestListById() {
		String htmlString = "<html><h4>透過志工會員id查詢工作表</h4>";
		List<Requests> requestList = requestsService.findByMemberId(memberid);
		for (Requests requests : requestList) {
			if(requests != null) {
			htmlString += requests.toString() + "<br>";
			}
		}
		htmlString += "</html>";
		return htmlString;
	}
	
	
}
