package team.lala.timebank;

import team.lala.timebank.dao.JobDao;
import team.lala.timebank.dao.MemberDao;
import team.lala.timebank.dao.TimeLedgerDao;
import team.lala.timebank.entity.Job;
import team.lala.timebank.entity.Member;
import team.lala.timebank.entity.TimeLedger;

public class DaoTest {

	public static void main(String[] args) {
		MemberDao m = new MemberDao();
		TimeLedgerDao t = new TimeLedgerDao();
		JobDao j = new JobDao();

		long id = 20l;

		m.getConnection();
		Member mem = m.findOne(id);
		if (mem != null) {
			System.out.println(mem.toString());
		}else {
			System.out.println("object is null");
		}
		
		m.closeConnection();

//		t.getConnection();
//		TimeLedger time = t.findOne(id);
//		if (time != null) {
//			System.out.println(time.toString());
//		}else {
//			System.out.println("object is null");
//		}
//	
//		t.closeConnection();

		j.getConnection();
		Job job = j.findOne(id);
		if (job != null) {
			System.out.println(job.toString());
		} else {
			System.out.println("object is null");
		}
		
		j.closeConnection();

	}

}
