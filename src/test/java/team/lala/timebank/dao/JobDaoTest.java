package team.lala.timebank.dao;

import static org.junit.Assert.*;

import java.util.Collection;

import org.junit.Test;

import team.lala.timebank.entity.Job;



public class JobDaoTest {

	@Test
	public void testGetConnection() {
	JobDao job1=new JobDao();
	job1.getConnection();
	}

	@Test
	public void testCloseConnection() {
	JobDao job2=new JobDao();
	job2.getConnection();
	job2.closeConnection();
	}

	@Test
	public void testFindAll() {
	JobDao job3=new JobDao();
	job3.getConnection();
	Collection<Job> jobs =job3.findAll();
	for (Job job : jobs) {
	System.out.println(job.toString());
	}
	job3.closeConnection();
	}

	@Test
	public void testFindOne() {
		fail("Not yet implemented");
	}

	@Test
	public void testInsert() {
		fail("Not yet implemented");
	}

	@Test
	public void testUpdate() {
		fail("Not yet implemented");
	}

	@Test
	public void testDelete() {
		fail("Not yet implemented");
	}

}
