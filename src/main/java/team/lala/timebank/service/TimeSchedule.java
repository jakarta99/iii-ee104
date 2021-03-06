package team.lala.timebank.service;

import java.time.LocalDate;
import java.time.ZoneId;
import java.util.Date;
import java.util.List;

import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import lombok.extern.slf4j.Slf4j;
import team.lala.timebank.dao.MissionDao;
import team.lala.timebank.dao.OrderDao;
import team.lala.timebank.entity.Mission;
import team.lala.timebank.entity.Order;
import team.lala.timebank.enums.MissionStatus;
import team.lala.timebank.enums.OrderStatus;
import team.lala.timebank.internationalVolunteer.projectsAbroad.ProjectsAbroadPageProcessor;
import team.lala.timebank.internationalVolunteer.projectsAbroad.ProjectsAbroadPipeline;
import team.lala.timebank.internationalVolunteer.step30.Step30PageProcessor;
import team.lala.timebank.internationalVolunteer.vya.VYAPageProcessor;
import team.lala.timebank.spec.MissionSpecification;
import us.codecraft.webmagic.Spider;

@Slf4j
@Transactional
@Component
public class TimeSchedule {
	@Autowired
	private FacadeService facadeService;
	@Autowired
	private OrderDao orderDao;
	@Autowired
	private MissionDao missionDao;
	@Autowired
	private SystemMessageService systemMessageService;
	@Autowired
	private MissionService missionService;
	@Autowired
	private OrderService orderService;
//	@Scheduled(cron = "0 0/2 * * * *") (cron = "0 0 1 * * ?")每天一點執行
	public void autoPay() {
		
		//獲得到期的所有mission
		Mission inputMission = new Mission();
		inputMission.setMissionstatus(MissionStatus.A_New);
		inputMission.setAutoPayDate(new Date(new Date().getTime() + 1 * 24 * 60 * 60 * 1000));
		MissionSpecification missionSpec = new MissionSpecification(inputMission);
		List<Mission> missions = missionService.findBySpecification(missionSpec);
		//設定mission狀態
		for(Mission mission : missions) {
			//每個mission的order自動付款評分
			for(Order order : mission.getOrders()) {
				//付款評分 自動評5分
				facadeService.transaction(mission.getTimeValue(), order.getId(), 5);
			}
		}
		
		
		
		
		
		
	}
	
	
	
	
	//測試　 
//	@Scheduled(cron = "0 0/2 * * * *") //(cron = "0 0 1 * * ?")每天一點執行
	public void updateStatus() {

		Mission inputMission = new Mission();
		inputMission.setMissionstatus(MissionStatus.A_New);
		
		//搜尋A狀態的Mission
		MissionSpecification missionSpec = new MissionSpecification(inputMission);
		List<Mission> missions = missionService.findBySpecification(missionSpec);
		for(Mission mission : missions) {

			//活動時間到期　將mission改為B狀態　取消未確認的申請
			// java.util.Date -> java.time.LocalDate
			LocalDate EndDate = mission.getEndDate().toInstant().atZone(ZoneId.systemDefault()).toLocalDate();	
			LocalDate nowDate = new Date().toInstant().atZone(ZoneId.systemDefault()).toLocalDate();	

			if(EndDate.equals(nowDate)){
				
				if(mission.getOrders().size() == 0) {
					mission.setMissionstatus(MissionStatus.C_Cancel);
					
				}else {
					List<Order> cancelOrders = orderDao.findByMissionAndOrderStatus(mission, OrderStatus.VolunteerApply);
					if(cancelOrders.size() != 0) {
						systemMessageService.missionCancel(cancelOrders);
						orderService.rejectOrders(cancelOrders);
					}
					
					
					mission.setMissionstatus(MissionStatus.B_AccountsPayable);
					missionDao.save(mission);
					
					
					
				}
			}
		}
		
	}

	
	
	
	@Autowired
	private ProjectsAbroadPipeline projectsAbroadPipeline;
	@Autowired
	private ProjectsAbroadPageProcessor projectsAbroadPageProcessor;
	@Autowired
	private Step30PageProcessor step30PageProcessor;	
	@Autowired
	private VYAPageProcessor vyaPageProcessor;
	@Autowired
	private InternationalVolunteerService internationalVolunteerService;
  
	//執行國際志工網路爬蟲
    @PostConstruct //系統一啟動就執行  
//    @Scheduled(cron = "0 15 10 15 * ?")//定期執行:每月15日上午10:15執行(順序:"秒 分 時 天 月 星期 年分")
    public void iVolunteerSpider() {
    	internationalVolunteerService.deleteAll();
    	log.debug("----開始執行國際志工文章爬蟲定時任務");
		Spider spider = Spider.create(projectsAbroadPageProcessor);
		spider.addUrl("https://www.projects-abroad.com.tw/volunteer-projects/").addPipeline(projectsAbroadPipeline)
				.thread(5).setExitWhenComplete(true).start();
		spider = Spider.create(step30PageProcessor);
		spider.addUrl("https://www.step30.org/action_explain.php?select=1").thread(5).setExitWhenComplete(true).start();
		spider = Spider.create(vyaPageProcessor);
		spider.addUrl("http://www.volunteermatch.org.tw/IW/3-1-group-pariticipant.htm").thread(5)
				.setExitWhenComplete(true).start();
		spider.stop();
		
    }
	
}
