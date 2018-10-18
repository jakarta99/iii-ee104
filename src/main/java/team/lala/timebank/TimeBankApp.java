package team.lala.timebank;

import java.util.Collection;

import team.lala.timebank.entity.TimeLedger;
import team.lala.timebank.service.TimeLedgerService;

public class TimeBankApp {

	public static void main(String[] args) {
		
		Long memberId = 1L;
		
		TimeLedgerService timeLedgerService;
		// 
		Collection<TimeLedger> timeLedgers = timeLedgerService.getByMemberId(memberId);
		for(TimeLedger timeLedger : timeLedgers) {
			System.out.println(timeLedger); // @asdf124
		}
		
		// Choose one Service from Service List
		
		
		// After verified, Deposit service hours
		timeLedgerService.deposit(service.getHours(), memberId);
		

	}

}
