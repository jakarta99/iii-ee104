package team.lala.timebank.internationalVolunteer;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import us.codecraft.webmagic.Spider;

@Controller
@RequestMapping("/commons/InternationalVolunteer")
public class InternationalVolunteerController {

	
	
	@Autowired
	private InternationalVolunteerService internationalVolunteerService;

	
	
	
	@RequestMapping("list")
	public String listPage(Model model) {
		model.addAttribute("IVolunteers",internationalVolunteerService.findAll());
		return "/basic/commons/internationalVolunteer/internationalVolunteer_list";
	}
	
	@RequestMapping("query")
	@ResponseBody
	public List<InternationalVolunteer> query() {		
		return internationalVolunteerService.findAll();
	}
	
	
	

	
	

}
