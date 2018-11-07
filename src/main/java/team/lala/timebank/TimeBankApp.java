package team.lala.timebank;

import java.util.Collection;

import team.lala.timebank.dao.TimeLedgerDao;
import team.lala.timebank.entity.Requests;
import team.lala.timebank.entity.TimeLedger;
import team.lala.timebank.service.MemberService;
import team.lala.timebank.service.RequestsService;
import team.lala.timebank.service.TimeLedgerService;

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
		RequestsService requestService = new RequestsService();

		// 1. List my ledgers
		Collection<TimeLedger> myTimeLedgers = timeLedgerService.getAll(memberId);
		for (TimeLedger timeLedger : myTimeLedgers) {
			System.out.println(timeLedger.toString());
		}
		System.out.println("-----------------------------------------------------------");

		// 2. Show Job List
		Collection<Requests> requsetsList = requestService.findAll();
		for (Requests requsets : requsetsList) {
			System.out.println(requsets.toString());
		}
		System.out.println("-----------------------------------------------------------");

		// 3. Choose one Job (id:1) from Job List
		Long requestListId = 1l;
		// Long jobId = 6l;
		Requests requsets = requestService.findByRequestListId(requestListId);
		System.out.println("try to find: requestListId = " + requestListId);
		if (requsets != null) {
			System.out.println(requsets.toString());
		} else {
			System.out.println("cannot find requestListId = " + requestListId);
		}
		System.out.println("-----------------------------------------------------------");

		// 4. After verified, Deposit service hours
		TimeLedger myTimeLedger = timeLedgerService.searchLastTransaction(memberId);
		System.out.println("更新前: " + myTimeLedger.toString());
		timeLedgerService.deposit(requsets.getTimeValue(), memberId);
		myTimeLedger = timeLedgerService.searchLastTransaction(memberId);

		System.out.println("更新後: " + myTimeLedger.toString());

	}

}
