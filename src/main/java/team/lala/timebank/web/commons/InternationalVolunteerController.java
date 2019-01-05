package team.lala.timebank.web.commons;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.extern.slf4j.Slf4j;
import team.lala.timebank.entity.InternationalVolunteer;
import team.lala.timebank.internationalVolunteer.projectsAbroad.ProjectsAbroadPageProcessor;
import team.lala.timebank.internationalVolunteer.projectsAbroad.ProjectsAbroadPipeline;
import team.lala.timebank.internationalVolunteer.step30.Step30PageProcessor;
import team.lala.timebank.internationalVolunteer.vya.VYAPageProcessor;
import team.lala.timebank.internationalVolunteer.waker.WakerPageProcessor;
import team.lala.timebank.internationalVolunteer.waker.WakerPipeline;
import team.lala.timebank.service.InternationalVolunteerService;
import team.lala.timebank.spec.InternationalVolunteerSpecification;
import us.codecraft.webmagic.Spider;
@Slf4j
@Controller
@RequestMapping("/commons/InternationalVolunteer")
public class InternationalVolunteerController {

	@Autowired
	private InternationalVolunteerService internationalVolunteerService;
	
	@RequestMapping("/search")
	public String searchPage() {
		return "/basic/commons/internationalVolunteer/iVolunteer_search";
	}

	@RequestMapping("/list")
	public String listPage(InternationalVolunteer iVolunteer, Model model) {
		log.debug("iVolunteer={}", iVolunteer);
		Specification<InternationalVolunteer> spec = new InternationalVolunteerSpecification(iVolunteer);
		model.addAttribute("IVolunteers", internationalVolunteerService.findBySpecification(spec));
		return "/basic/commons/internationalVolunteer/iVolunteer_list";
	}


	//此方法作用spiderScheduler的方法相同，client端發出request才執行爬蟲功能
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
		internationalVolunteerService.deleteAll();
		System.out.println("----開始執行國際志工文章爬蟲定時任務");
		Spider spider = Spider.create(projectsAbroadPageProcessor);
		spider.addUrl("https://www.projects-abroad.com.tw/volunteer-projects/")
				.addPipeline(projectsAbroadPipeline)
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
