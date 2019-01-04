package team.lala.timebank.service;

import java.time.LocalDate;
import java.time.ZoneId;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import lombok.extern.slf4j.Slf4j;
import team.lala.timebank.dao.MissionDao;
import team.lala.timebank.entity.Mission;
import team.lala.timebank.entity.Order;
import team.lala.timebank.enums.MissionStatus;
import team.lala.timebank.enums.OrderStatus;
import team.lala.timebank.spec.MissionSpecification;
@Slf4j
@Transactional
@Component
public class TimeSchedule {
	
	@Autowired
	private MissionDao missionDao;
	@Autowired
	private SystemMessageService systemMessageService;
	@Autowired
	private MissionService missionService;
	@Autowired
	private OrderService orderService;
	
	//測試　 
	@Scheduled(cron = "0 0/2 * * * *") //(cron = "0 0 1 * * ?")每天一點執行
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
					List<Order> cancelOrders = new ArrayList<Order>();
					List<Order> orders = orderService.findByMission(mission);
					mission.setMissionstatus(MissionStatus.B_AccountsPayable);
					missionDao.save(mission);
					for(Order order : orders) {
						if(order.getOrderStatus() == OrderStatus.VolunteerApply) {
							cancelOrders.add(order);		
						}
					}
					systemMessageService.missionCancel(cancelOrders);
					orderService.rejectOrders(cancelOrders);
				}
			}
		}
		
	}
}
