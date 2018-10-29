package team.lala.timebank.service;
import java.util.ArrayList;
import java.util.Collection;

import org.springframework.stereotype.Service;

import team.lala.timebank.dao.JobDao;

import team.lala.timebank.entity.Job;

/**
 * Using the methods of JobDao to implement some service
 * @author Sheila
 *
 */
@Service
public class JobService {

	private JobDao jobDao = new JobDao();
	
	/**
	 * posting recruit for volunteers 
	 * @param job 
	 */
	public void insert(Job job) { 
		jobDao.getConnection();
		jobDao.insert(job);
		jobDao.closeConnection();
	}
	
	/**
	 * update the job recruit
	 * @param job
	 */
	public void update(Job job) {
		jobDao.getConnection();
		jobDao.update(job);
		jobDao.closeConnection();

	}
	
	/**
	 * lists all the jobs
	 * @return the collection of all jobs
	 */
	public Collection<Job> findAll() {
		jobDao.getConnection();
		Collection<Job> jobList = jobDao.findAll();
		jobDao.closeConnection();
		if(jobList ==null) {
			// FIXME test on console
			System.out.println("jobList does not exist");
		}
		return jobList;
	}
	
	
	/**
	 * find a job by using id
	 * @param id
	 * @return the job found by using id
	 */
	public Job findOne(Long id) {
		jobDao.getConnection();
		Job job = jobDao.findOne(id);
		jobDao.closeConnection();
		if(job == null) {
			// FIXME test on console
			System.out.println( "id" + id + " does not exist");
		}
		return job;
	}
	
	/**
	 * delete the recruit
	 * @param id
	 */
	public void delete(Long id) {
		jobDao.getConnection();		
		jobDao.delete(id);
		jobDao.closeConnection();
	}
	
	
	
	

	

}
