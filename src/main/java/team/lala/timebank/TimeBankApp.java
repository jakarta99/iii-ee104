package team.lala.timebank;

import java.util.Collection;

import team.lala.timebank.dao.*;
import team.lala.timebank.entity.*;
import team.lala.timebank.service.*;

/**
 * find all the timeLedger list, find all the job list, choose a job, after
 * providing service timeLedger increased.
 * 
 * @author Sheila
 *
 */
public class TimeBankApp {

	/**
	 * test the flow
	 * 
	 * @param args
	 */
	public static void main(String[] args) {

		Long memberId = 1L;
		// Long memberId = 6L;

		MemberService memberService = new MemberService();
		TimeLedgerService timeLedgerService = new TimeLedgerService();
		JobService jobService = new JobService();

		// 1. List my ledgers
		Collection<TimeLedger> myTimeLedgers = timeLedgerService.searchALLTransaction(memberId);
		for (TimeLedger timeLedger : myTimeLedgers) {
			System.out.println(timeLedger.toString());
		}
		System.out.println("-----------------------------------------------------------");

		// 2. Show Job List
		Collection<Job> jobList = jobService.findAll();
		for (Job job : jobList) {
			System.out.println(job.toString());
		}
		System.out.println("-----------------------------------------------------------");

		// 3. Choose one Job (id:1) from Job List
		Long jobId = 1l;
		// Long jobId = 6l;
		Job job = jobService.findOne(jobId);
		System.out.println("try to find: jobId = " + jobId);
		if (job != null) {
			System.out.println(job.toString());
		} else {
			System.out.println("cannot find jobId = " + jobId);
		}
		System.out.println("-----------------------------------------------------------");

		// 4. After verified, Deposit service hours
		TimeLedgerDao timeLedgerDao = new TimeLedgerDao();
		timeLedgerDao.getConnection();
		TimeLedger myTimeLedger = timeLedgerDao.findTop1ByMemberIdOrderByTransactionTime(memberId);
		System.out.println("更新前: " + myTimeLedger.toString());
		timeLedgerService.deposit(job.getTimeValue(), memberId);
		myTimeLedger = timeLedgerDao.findTop1ByMemberIdOrderByTransactionTime(memberId);

		System.out.println("更新後: " + myTimeLedger.toString());

	}

}
