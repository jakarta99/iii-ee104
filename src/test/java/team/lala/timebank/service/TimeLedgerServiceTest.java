package team.lala.timebank.service;

import static org.junit.Assert.*;

import java.util.Collection;

import org.junit.Test;

import team.lala.timebank.entity.TimeLedger;

public class TimeLedgerServiceTest {

	private TimeLedgerService timeLedgerService = new TimeLedgerService();
/*
	
	@Test
	public void testDeposit() {
         //正常存款
		timeLedgerService.deposit(2, 2L);
		
        //第一次存款
		timeLedgerService.deposit(20, 3L);
	}



	@Test
	public void testWithdrawal() {
        //正常提款
		timeLedgerService.withdrawal(3, 2L);
		
		
        //超額提款
		timeLedgerService.withdrawal(3000, 2L);
	}
	@Test
	public void testUpdate() {
	
	}
	@Test
	public void testDelete() {
		
	}

	@Test
	public void testSearchALLTransaction() {
		Collection<TimeLedger> timeLedgers = timeLedgerService.searchALLTransaction(1L);
		for(TimeLedger timeLedger : timeLedgers) {
			System.out.println(timeLedger.toString());
		}
		
		timeLedgerService.searchALLTransaction(10L);
	}
*/
	



	@Test
	public void testSearchLastTransaction() {
		TimeLedger timeLedger = timeLedgerService.searchLastTransaction(1L);
		System.out.println(timeLedger.toString());
		
		timeLedgerService.searchLastTransaction(10L);
		
	}

}
