package team.lala.timebank.service;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
@Slf4j
@Component
public class TimeSchedule {
	@Scheduled(cron = "0/5 * * * * *")
	public void updateStatus() {
		log.debug("123={}","123");
	}
}
