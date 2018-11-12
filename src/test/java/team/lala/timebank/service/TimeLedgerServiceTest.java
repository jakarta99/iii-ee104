package team.lala.timebank.service;

import java.util.Collection;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import team.lala.timebank.entity.TimeLedger;

@RunWith(SpringRunner.class)
@SpringBootTest
public class TimeLedgerServiceTest {
	@Autowired
	private TimeLedgerService timeLedgerService;

	//存款測試
	@Test
	public void testDeposit() {
        //過去已有交易紀錄之會員
		System.out.println("存款前記錄=" + timeLedgerService.searchLastTransaction(2L).toString());
		timeLedgerService.deposit(20, 2L);
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
		
		//無交易紀錄之會員提款
		timeLedgerService.withdrawal(3000, 10L);
	}
	
	//更新測試
	@Test
	public void testUpdate() {
		//更改1號會員最近一筆交易紀錄之存款金額(50改為80)
			//1.查出1號會員最近一筆交易紀錄
			TimeLedger timeLedger = timeLedgerService.searchLastTransaction(1L);
			System.out.println("1號會員最近一筆交易紀錄(更新前)=" + timeLedger.toString());
			
			//2.更改1號會員存款金額
			timeLedger.setDepositValue(80);
			
			//3.更新
			timeLedgerService.update(timeLedger);
			
			//4.再次查詢1號會員資料，確認更新結果
			timeLedger = timeLedgerService.searchLastTransaction(1L);
			System.out.println("1號會員最近一筆交易紀錄(更新後)=" + timeLedger.toString());
		
		//待續
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
