package team.lala.timebank;

import java.util.Collection;

import team.lala.timebank.dao.*;
import team.lala.timebank.entity.*;
import team.lala.timebank.service.*;


public class TimeBankApp {

	public static void main(String[] args) {

		Long memberId = 1L;
//		MemberService memberService;
		TimeLedgerService timeLedgerService = new TimeLedgerService();
		JobService jobService =new JobService();

		// 1. List my ledgers 
//		Collection<TimeLedger> myTimeLedgers = timeLedgerService.findByMemberId(memberId);
//		for (TimeLedger timeLedger : myTimeLedgers) {
//			System.out.println(timeLedger.toString());			
//		}

		// 2. Show Job List
		Collection<Job> jobList = jobService.findAll();
		for (Job job: jobList) {
			System.out.println(job.toString());
		}
		
		// 3. Choose one Job (id:1) from Job List
		Long jobId = 1l;
		Job job = jobService.findOne(jobId);
		System.out.println(job.toString());

		// 4. After verified, Deposit service hours
//		timeLedgerService.deposit(job.getTimeValue(),memberId);
//		System.out.println(timeLedgerService.toString());

	}

}
