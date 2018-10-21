package team.lala.timebank.service;

import java.util.Collection;

import org.junit.Test;

import team.lala.timebank.entity.Job;

public class JobServiceTest {
	private JobService jobService = new JobService();

	@Test
	public void testInsert() {
		// 正向
		Job job1 = new Job();
		long id1 = 3L;
		job1.setId(id1);
		job1.setRequester("伊甸基金會");
		job1.setJobTitle("行政志工");
		job1.setTimeValue(1);
		jobService.insert(job1);
		// 結果: 失敗
		// 未設定參數號碼 4 的值。

		// 反向
		Job job2 = new Job();
		long id2 = 10L;
		job2.setId(id2);
		job2.setRequester("伊甸基金會");
		job2.setJobTitle("行政志工");
		job2.setTimeValue(1);
		jobService.insert(job2);
		// 結果: 失敗
		// 未設定參數號碼 4 的值。
	}

	@Test
	public void testUpdate() {
		// 正向
		Job job1 = new Job();
		long id1 = 3L;
		job1.setId(id1);
		job1.setRequester("伊甸基金會");
		job1.setJobTitle("行政志工");
		job1.setTimeValue(1);
		jobService.update(job1);
		// 結果: 失敗
		// ?where...

		// 反向
		Job job2 = new Job();
		long id2 = 10L;
		job2.setId(id2);
		job2.setRequester("伊甸基金會");
		job2.setJobTitle("行政志工");
		job2.setTimeValue(1);
		// 結果: 失敗
		// ?where...
	}

	@Test
	public void testFindAll() {
		Collection<Job> jobs = jobService.findAll();
		for (Job job : jobs) {
			System.out.println(job.toString());
		}
	}
	// 結果:成功
	// 列出所有job

	@Test
	public void testFindOne() {
		// 正向
		Long id1 = 1L;
		Job job1 = jobService.findOne(id1);
		if (job1 != null) {
			System.out.println(job1.toString());
		}
		// 結果: 搜尋成功
		// Job [id=1, requester=中華育幼機構關懷協會, jobTitle=假日活動志工, timeValue=2]

		// 反向
		Long id2 = 10L;
		Job job2 = jobService.findOne(id2);
		if (job2 != null) {
			System.out.println(job2.toString());
		}
		// 結果: 搜尋成功 ??
		// id10 does not exist
	}
	

	@Test
	public void testDelete() {
		// 正向
		Long id1 = 3L;
		jobService.delete(id1);
		// 結果: delete成功

		// 反向
		Long id2 = 10L;
		jobService.delete(id2);
		// 結果: delete成功 ??
	}

}
