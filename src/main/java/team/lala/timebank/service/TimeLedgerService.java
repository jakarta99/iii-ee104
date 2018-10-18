package team.lala.timebank.service;

import team.lala.timebank.dao.TimeLedgerDao;
import team.lala.timebank.entity.TimeLedger;

public class TimeLedgerService {

	private TimeLedgerDao timeLedgerDao = new TimeLedgerDao();
	
	public void deposit(int hours, Long memberId) {
		
		// 1. findTimeLedgerByMemberId
		TimeLedger lastTimeLedger = timeLedgerDao.findTop1ByMemberIdOrderByTransactionTime(memberId);
		if(lastTimeLedger == null) {
			lastTimeLedger = new TimeLedger();
		}
		
		// 2. prepare timeledger data 
		TimeLedger timeLedger = new TimeLedger();
		timeLedger.setMemberId(memberId);
		timeLedger.setDepositValue(hours);
		timeLedger.setBalanceValue(lastTimeLedger.getBalanceValue()+hours);
		
		// 3. insert
		timeLedgerDao.insert(timeLedger);
		
		
	}
	
}
