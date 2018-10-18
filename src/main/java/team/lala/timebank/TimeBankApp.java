package team.lala.timebank;

import java.util.Collection;

import team.lala.timebank.entity.TimeLedger;
import team.lala.timebank.service.TimeLedgerService;

public class TimeBankApp {

	public static void main(String[] args) {
		
		Long memberId = 1L;
		
		TimeLedgerService timeLedgerService;
		// 1. List my ledgers 
		Collection<TimeLedger> timeLedgers = timeLedgerService.getByMemberId(memberId);
		for(TimeLedger timeLedger : timeLedgers) {
			System.out.println(timeLedger); // @asdf124
		}
		
		// 2. Show Job List
		JobService.getAll();
		forEach List;
		
		
		// 3. Choose one Job (id:1) from Job List
		JobService.getById(1);
		
		
		// 4. After verified, Deposit service hours
		timeLedgerService.deposit(job.getHours(), memberId);
		

	}

}
