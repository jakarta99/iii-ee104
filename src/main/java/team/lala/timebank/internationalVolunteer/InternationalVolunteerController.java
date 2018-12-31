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
	private ProjectsAbroadPageProcessor projectsAbroadPageProcessor;
	@Autowired
	private InternationalVolunteerService internationalVolunteerService;

	//作用spiderScheduler的方法相同，可透過url執行
	@ResponseBody
	@RequestMapping("/spidertest")
	public String iVolunteerSpiderSearchData(Model model) {
		System.out.println("----開始執行國際志工文章爬蟲定時任務");
		Spider spider = Spider.create(projectsAbroadPageProcessor);
		spider.addUrl("https://www.projects-abroad.com.tw/volunteer-projects/care");
		spider.addPipeline(projectsAbroadPipeline);
		spider.thread(5);
		spider.setExitWhenComplete(true);
		spider.start();
		spider.stop();
		String msg = "爬蟲進行中，請耐心等候10秒，再重新整理頁面";
		return msg;
	}

	@RequestMapping("/list")
	public String listPage(Model model) {
		model.addAttribute("IVolunteers", internationalVolunteerService.findAll());
		return "/basic/commons/internationalVolunteer/internationalVolunteer_list";
	}

	@RequestMapping("/query")
	@ResponseBody
	public List<InternationalVolunteer> query() {
		return internationalVolunteerService.findAll();
	}

}
