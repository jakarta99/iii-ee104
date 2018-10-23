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
//		JobDao job4=new JobDao();
//		job4.getConnection();
//		Job job=job4.findOne(1L);
//		System.out.println(job.toString());
//		job4.closeConnection();
//		
		JobDao job5=new JobDao();
		job5.getConnection();
		Job job=job5.findOne(10L);
		System.out.println(job.toString());
		job5.closeConnection();
		
	}

	@Test
	public void testInsert() {
		JobDao job6=new JobDao();
		job6.getConnection();
		
		
		
		
		
		
		//job6.insert(job);
		job6.closeConnection();
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
