package team.lala.timebank.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import team.lala.timebank.internationalVolunteer.projectsAbroad.ProjectsAbroadPageProcessor;
import team.lala.timebank.internationalVolunteer.projectsAbroad.ProjectsAbroadPipeline;
import team.lala.timebank.internationalVolunteer.step30.Step30PageProcessor;
import team.lala.timebank.internationalVolunteer.vya.VYAPageProcessor;
import us.codecraft.webmagic.Spider;
@Slf4j
@Component
public class TimeSchedule {
//	@Scheduled(cron = "0/5 * * * * *")
//	public void updateStatus() {
//		log.debug("123={}","123");
//	}
	
	
	
	@Autowired
	private ProjectsAbroadPipeline projectsAbroadPipeline;
	@Autowired
	private ProjectsAbroadPageProcessor projectsAbroadPageProcessor;
	@Autowired
	private Step30PageProcessor step30PageProcessor;	
	@Autowired
	private VYAPageProcessor vyaPageProcessor;
	
  
	//執行國際志工網路爬蟲
//    @PostConstruct //系統一啟動就執行  
//    @Scheduled(cron = "0 15 10 15 * ?")//定期執行:每月15日上午10:15執行(順序:"秒 分 時 天 月 星期 年分")
    public void iVolunteerSpider() {
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
		
    }
	
	
	
}
