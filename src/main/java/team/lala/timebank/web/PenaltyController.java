package team.lala.timebank.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import team.lala.timebank.entity.Penalty;
import team.lala.timebank.service.PenaltyService;

@RestController
public class PenaltyController {
	
	@Autowired
	private PenaltyService penaltyService;

	@RequestMapping("/penalty")
	public String findPenaltys() {
		String result = "<html><p>";
		List<Penalty> penaltys = penaltyService.findAll();
		for(Penalty penalty : penaltys) {
			result += penalty.toString() + "<br>";
		}
		result += "</p></html>";
		
		return result;
		
	}
	
}
