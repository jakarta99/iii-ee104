package team.lala.timebank.service;

import static org.junit.Assert.*;

import java.util.Collection;

import org.junit.Test;

import team.lala.timebank.entity.TimeLedger;

public class TimeLedgerServiceTest {

	private TimeLedgerService timeLedgerService = new TimeLedgerService();

	//存款測試
	@Test
	public void testDeposit() {
        //過去已有交易紀錄之會員
		System.out.println("存款前記錄=" + timeLedgerService.searchLastTransaction(2L).toString());
		timeLedgerService.deposit(2, 2L);
		System.out.println("存款後記錄=" + timeLedgerService.searchLastTransaction(2L).toString());
		
        //第一次存款之會員
		System.out.println("存款前記錄=" + timeLedgerService.searchLastTransaction(3L).toString());
		timeLedgerService.deposit(20, 3L);
		System.out.println("存款後記錄=" + timeLedgerService.searchLastTransaction(3L).toString());

	}

	//提款測試
	@Test
	public void testWithdrawal() {
        //餘額足夠提款
		timeLedgerService.withdrawal(3, 2L);

        //超額提款
		timeLedgerService.withdrawal(3000, 2L);
		
		//從無交易紀錄之會員提款
		timeLedgerService.withdrawal(3000, 10L);
	}
	
	@Test
	public void testUpdate() {
	
	}
	
	@Test
	public void testDelete() {
		
	}

	@Test
	public void testGetAll() {
		Collection<TimeLedger> timeLedgers = timeLedgerService.getAll(1L);
		for(TimeLedger timeLedger : timeLedgers) {
			System.out.println(timeLedger.toString());
		}
		
		timeLedgerService.getAll(10L);
	}




	@Test
	public void testSearchLastTransaction() {
		TimeLedger timeLedger = timeLedgerService.searchLastTransaction(1L);
		System.out.println(timeLedger.toString());
		
		timeLedgerService.searchLastTransaction(10L);
		
	}

}
