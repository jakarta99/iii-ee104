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

@RestController
@SpringBootApplication
public class TimeBankApp2 {

	@Autowired
	private JobService jobService;
	@Autowired
	private TimeLedgerService timeLedgerService;
	@Autowired
	private MemberService memberService;

	Long memberId = 1L;
	Long jobId = 1l;

	@RequestMapping("/user")
	public String listMyTimeLedgers() {
		// 1. List my ledgers
		Collection<TimeLedger> timeLedgerList = timeLedgerService.getAll(memberId);
		String result = "<html><h1>Hello World!</h1><p>";
		for (TimeLedger timeLedger : timeLedgerList) {
			result += timeLedger.toString() + "<br>";

		}
		result += "</p><p>";

		// 2. Show Job List
		Collection<Job> jobList = jobService.findAll();
		if (jobList != null) {
			for (Job job : jobList) {
				result += job.toString() + "<br>";
			}
		}
		result += "</p><p>";

		// 3. Choose one Job (id:1) from Job List
		Job job1 = jobService.findOne(jobId);
		if (job1 != null) {
			result += job1.toString() + "<br>";

		} else {
			result += "cannot find jobId = " + jobId + "<br>";
		}
		result += "</p><p>";

		// 4. After verified, Deposit service hours
//		TimeLedger timeLedger = timeLedgerService.
//		result += "before deposit:" + timeLedger.toString();
//		timeLedgerService.deposit(job1.getTimeValue(), memberId);
//		timeLedger = timeLedgerService.searchLastTransaction(memberId);
//		result += "after deposit:" + timeLedger.toString();

		result += "</p></html>";

		return result;

	}

	public static void main(String[] args) {
		SpringApplication.run(TimeBankApp2.class, args);

	}

}
