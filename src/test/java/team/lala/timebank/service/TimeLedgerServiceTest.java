package team.lala.timebank.service;

import static org.junit.Assert.*;

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

*/
	@Test
	public void testUpdate() {
		TimeLedger timeLedger = new TimeLedger();
		
		timeLedgerService.update(timeLedger);
	}
	
	@Test
	public void testDelete() {
		//正向
		timeLedgerService.delete(2L);
		
		
		//反向
		timeLedgerService.delete(10L);
	}


	@Test
	public void testSearchALLTransaction() {
		fail("Not yet implemented");
	}

	@Test
	public void testSearchLastTransaction() {
		fail("Not yet implemented");
	}

}
