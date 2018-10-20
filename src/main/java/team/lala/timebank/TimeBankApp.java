package team.lala.timebank;

import java.util.Collection;

import team.lala.timebank.dao.*;
import team.lala.timebank.entity.*;
import team.lala.timebank.service.*;


public class TimeBankApp {

	public static void main(String[] args) {

		Long memberId = 1L;

		// 1. List my ledgers 
		TimeLedgerService timeLedgerService = new TimeLedgerService();
		Collection<TimeLedger> myTimeLedgers = timeLedgerService.getLedgersByMemberId(memberId);
		for (TimeLedger timeLedger : myTimeLedgers) {
			System.out.println(timeLedger.toString());			
		}

		MemberService memberService;

		// 2. Show Job List
		JobService jobService =new JobService();
		jobService.getAll();
		//forEach List;

		// 3. Choose one Job (id:1) from Job List
		jobService.getByJobId(1l);

//		// 4. After verified, Deposit service hours
//		timeLedgerService.deposit(job.getHours(), memberId);

	}

}
