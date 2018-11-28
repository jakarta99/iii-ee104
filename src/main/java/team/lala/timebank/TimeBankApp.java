package team.lala.timebank;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jackson.JacksonAutoConfiguration;
import org.springframework.http.converter.json.GsonHttpMessageConverter;

import com.google.gson.Gson;



/**
 * find all the timeLedger list, find all the job list, choose a job, after
 * providing service timeLedger increased.
 */


@SpringBootApplication
public class TimeBankApp {
	
	public static void main(String[] args) {
		SpringApplication.run(TimeBankApp.class, args);
	}

}
