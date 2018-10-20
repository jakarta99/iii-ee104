package team.lala.timebank;

import java.util.Collection;

import team.lala.timebank.dao.*;
import team.lala.timebank.entity.*;
import team.lala.timebank.service.*;


public class TimeBankApp {

	public static void main(String[] args) {
		
		Long memberId = 1L;
//		Long memberId = 6L;
		
		MemberService memberService = new MemberService();
		TimeLedgerService timeLedgerService = new TimeLedgerService();
		JobService jobService =new JobService();

		// 1. List my ledgers 
//		Collection<TimeLedger> myTimeLedgers = timeLedgerService.findByMemberId(memberId);
//		for (TimeLedger timeLedger : myTimeLedgers) {
//			System.out.println(timeLedger.toString());			
//		}
		
		timeLedgerService.searchALLTransaction(memberId);

		
		// 2. Show Job List
//		Collection<Job> jobList = jobService.findAll();
//		for (Job job: jobList) {
//			System.out.println(job.toString());
//		}
		
		// 3. Choose one Job (id:1) from Job List
		Long jobId = 1l;	
		Job job = jobService.findOne(jobId);
		System.out.println("find jobId = " + jobId);
		if (job != null) {
			System.out.println(job.toString());			
		} else {
			System.out.println("cannot find jobId = "+ jobId);
		}
		

		// 4. After verified, Deposit service hours
		TimeLedgerDao timeLedgerDao = new TimeLedgerDao();
		timeLedgerDao.getConnection();
		TimeLedger myTimeLedger = timeLedgerDao.findTop1ByMemberIdOrderByTransactionTime(memberId);
		System.out.println("更新前: " + myTimeLedger.toString());
		timeLedgerService.deposit(job.getTimeValue(),memberId);
		myTimeLedger = timeLedgerDao.findTop1ByMemberIdOrderByTransactionTime(memberId);

		System.out.println("更新後: "+ myTimeLedger.toString());

	}

}
