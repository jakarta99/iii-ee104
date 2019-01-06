package team.lala.timebank;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.scheduling.annotation.EnableScheduling;

@EnableScheduling
@SpringBootApplication
public class TimeBankApp {
	
	public static void main(String[] args) {
		SpringApplication.run(TimeBankApp.class, args);
	}
	


}
