package team.lala.timebank;

import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import team.lala.timebank.entity.Job;
import team.lala.timebank.entity.Member;
import team.lala.timebank.entity.TimeLedger;
import team.lala.timebank.service.JobService;
import team.lala.timebank.service.MemberService;
import team.lala.timebank.service.TimeLedgerService;

/**
 * find all the timeLedger list, find all the job list, choose a job, after
 * providing service timeLedger increased.
 * 
 * @author Sheila
 *
 */


@SpringBootApplication
public class TimeBankApp2 {

	public static void main(String[] args) {
		SpringApplication.run(TimeBankApp2.class, args);

	}

}
