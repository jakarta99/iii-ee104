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
	private ProjectsAbroadPipeline projectsAbroadPipeline;
	@Autowired
	private InternationalVolunteerService internationalVolunteerService;

	
	//執行網路爬蟲
	//需用scheduler設定定期執行
	@RequestMapping("/test")
	@ResponseBody
	public String test() {
		Spider.create(new ProjectsAbroadSpider())
		.addUrl("https://www.projects-abroad.com.tw/volunteer-projects/care/")
		.addPipeline(projectsAbroadPipeline).thread(3).run();
		String str = "程式成功執行";
		str += internationalVolunteerService.findAll().toString();
		return str;
	}
	
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
