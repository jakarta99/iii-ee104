package team.lala.timebank.service;

<<<<<<< HEAD
=======
import java.util.ArrayList;
>>>>>>> branch 'master' of https://github.com/jakarta99/iii-ee104
import java.util.Collection;

import team.lala.timebank.dao.JobDao;

import team.lala.timebank.entity.Job;

public class JobService {

	private JobDao jobDao = new JobDao();
<<<<<<< HEAD
	
	// 使用者刊登志工需求
	public void insertJob(Job job) { 
		jobDao.insert(job);
=======

	public void getAll() {
		jobDao.getConnection();

		Collection<Job> jobList = jobDao.findAll();
		for (Job job : jobList) {
			System.out.println(job.getJobId());
			System.out.println(job.getRequester());
			System.out.println(job.getJobTitle());
			System.out.println(job.getTimeValue());
		}
		jobDao.closeConnection();

>>>>>>> branch 'master' of https://github.com/jakarta99/iii-ee104
	}
<<<<<<< HEAD
	
	// 更新志工需求
	public void updateJob(Job job) {
		jobDao.update(job);
=======

	public void getByJobId(Long jobId) {
		jobDao.getConnection();
		Job job = jobDao.findOne(jobId);

		System.out.println(job.getJobId());
		System.out.println(job.getRequester());
		System.out.println(job.getJobTitle());
		System.out.println(job.getTimeValue());
		jobDao.closeConnection();

>>>>>>> branch 'master' of https://github.com/jakarta99/iii-ee104
	}
	
	public void deleteJob(Long jobId) {
		jobDao.delete(jobId);
	}
	
	public Job findOneJob(Long jobId) {
		Job job = jobDao.findOne(jobId);
		return job;
	}
	public Collection<Job> findAllJob() {
		Collection<Job> jobList = jobDao.findAll();
		return jobList;
	}
	

	

}
