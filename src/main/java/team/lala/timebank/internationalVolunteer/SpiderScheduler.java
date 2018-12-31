package team.lala.timebank.internationalVolunteer;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import team.lala.timebank.internationalVolunteer.projectsAbroad.ProjectsAbroadPageProcessor;
import team.lala.timebank.internationalVolunteer.projectsAbroad.ProjectsAbroadPipeline;
import us.codecraft.webmagic.Spider;

//執行國際志工網路爬蟲
@Component
public class SpiderScheduler {
	
    @Autowired
    private ProjectsAbroadPipeline projectsAbroadPipeline;
    @Autowired
    private ProjectsAbroadPageProcessor projectsAbroadPageProcessor;
  
    //需花費許多時間來執行爬蟲功能，啟動較慢
//    @PostConstruct //系統一啟動就執行  
//    @Scheduled(cron = "0 15 10 15 * ?")//定期執行:每月15日上午10:15執行(順序:"秒 分 時 天 月 星期 年分")
    public void iVolunteerSpiderScheduled() {
        System.out.println("----開始執行國際志工文章爬蟲定時任務");
        Spider spider = Spider.create(projectsAbroadPageProcessor);
        spider.addUrl("https://www.projects-abroad.com.tw/volunteer-projects/care");
        spider.addPipeline(projectsAbroadPipeline);
        spider.thread(5);
        spider.setExitWhenComplete(true);
        spider.start();
        spider.stop();
    }
    
  
}

