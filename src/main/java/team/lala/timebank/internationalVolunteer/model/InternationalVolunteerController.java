package team.lala.timebank.internationalVolunteer.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import team.lala.timebank.internationalVolunteer.projectsAbroad.ProjectsAbroadPageProcessor;
import team.lala.timebank.internationalVolunteer.projectsAbroad.ProjectsAbroadPipeline;
import team.lala.timebank.internationalVolunteer.step30.Step30PageProcessor;
import team.lala.timebank.internationalVolunteer.vya.VYAPageProcessor;
import team.lala.timebank.internationalVolunteer.vya.VYAPipeline;
import team.lala.timebank.internationalVolunteer.waker.WakerPageProcessor;
import team.lala.timebank.internationalVolunteer.waker.WakerPipeline;
import us.codecraft.webmagic.Spider;

@Controller
@RequestMapping("/commons/InternationalVolunteer")
public class InternationalVolunteerController {

	@Autowired
	private InternationalVolunteerService internationalVolunteerService;
	
	@RequestMapping("search")
	public String searchPage() {
		return "/basic/commons/internationalVolunteer/iVolunteer_search";
	}

	@RequestMapping("/list")
	public String listPage(Model model) {
		model.addAttribute("IVolunteers", internationalVolunteerService.findAll());
		return "/basic/commons/internationalVolunteer/iVolunteer_list";
	}

	@RequestMapping("/query")
	@ResponseBody
	public List<InternationalVolunteer> query() {
		return internationalVolunteerService.findAll();
	}
	
	
	
	//此方法作用spiderScheduler的方法相同，爬蟲功能透過url執行
	//成功
	@Autowired
	private ProjectsAbroadPipeline projectsAbroadPipeline;
	@Autowired
	private ProjectsAbroadPageProcessor projectsAbroadPageProcessor;
	@Autowired
	private Step30PageProcessor step30PageProcessor;	
	@Autowired
	private VYAPageProcessor vyaPageProcessor;
	
	
	@ResponseBody
	@RequestMapping("/spidertest")
	public String iVolunteerSpider(Model model) {
		System.out.println("----開始執行國際志工文章爬蟲定時任務");
		Spider spider = Spider.create(projectsAbroadPageProcessor);
		spider.addUrl("https://www.projects-abroad.com.tw/volunteer-projects/").addPipeline(projectsAbroadPipeline)
				.thread(5).setExitWhenComplete(true).start();
		
		spider = Spider.create(step30PageProcessor);
		spider.addUrl("https://www.step30.org/action_explain.php?select=1")
			.thread(5).setExitWhenComplete(true).start();
		spider = Spider.create(vyaPageProcessor);
		spider.addUrl("http://www.volunteermatch.org.tw/IW/3-1-group-pariticipant.htm")
				.thread(5).setExitWhenComplete(true).start();		
		spider.stop();
		
		String msg = "爬蟲進行中，請耐心等候10秒，再重新整理頁面";
		return msg;
	}
	
	
	
	
	
	
	
	
	
	//以下均為爬蟲各網頁的測試程式
	
	
	@ResponseBody
	@RequestMapping("/spidertest1")
	public String iVolunteerSpiderProjectsAbroad(Model model) {
		System.out.println("----開始執行ProjectsAbroad文章爬蟲定時任務");
		Spider spider = Spider.create(projectsAbroadPageProcessor);
		spider.addUrl("https://www.projects-abroad.com.tw/volunteer-projects/").addPipeline(projectsAbroadPipeline)
				.thread(5).setExitWhenComplete(true).start();
		spider.stop();
		String msg = "爬蟲進行中，請耐心等候10秒，再重新整理頁面";
		return msg;
	}
	
	
	
	//成功	
	@ResponseBody
	@RequestMapping("/spidertest3")
	public String iVolunteerSpiderStep30(Model model) {
		System.out.println("----開始執行step30文章爬蟲定時任務");
		Spider spider = Spider.create(step30PageProcessor);
		spider.addUrl("https://www.step30.org/action_explain.php?select=1")
			.thread(5).setExitWhenComplete(true).start();
		spider.stop();
		String msg = "爬蟲進行中，請耐心等候10秒，再重新整理頁面";
		return msg;
	}
	
	//成功
		@Autowired
		private VYAPipeline vyaPipeline;
		
		@ResponseBody
		@RequestMapping("/spidertest4")
		public String iVolunteerSpiderVYA(Model model) {
			System.out.println("----開始執行VYA文章爬蟲定時任務");
			Spider spider = Spider.create(vyaPageProcessor);
			spider.addUrl("http://www.volunteermatch.org.tw/IW/3-1-group-pariticipant.htm")
//					.addPipeline(vyaPipeline)
					.thread(5).setExitWhenComplete(true).start();
			spider.stop();
			String msg = "爬蟲進行中，請耐心等候10秒，再重新整理頁面";
			return msg;
		}
		
		//未成功
			@Autowired
			private WakerPipeline wakerPipeline;
			@Autowired
			private WakerPageProcessor wakerPageProcessor;	
			@ResponseBody
			@RequestMapping("/spidertest2")
			public String iVolunteerSpiderWaker(Model model) {
				System.out.println("----開始執行waker文章爬蟲定時任務");
				Spider spider = Spider.create(wakerPageProcessor);
				spider.addUrl(
						"https://www.waker.org.tw/LocationList.aspx?nowPage=1&id=&tid=8")
//						.addPipeline(wakerPipeline)
						.thread(5).setExitWhenComplete(true).start();
				spider.stop();
				String msg = "爬蟲進行中，請耐心等候10秒，再重新整理頁面";
				return msg;
			}
			
	
	

}
