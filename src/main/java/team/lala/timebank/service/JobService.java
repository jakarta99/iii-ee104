package team.lala.timebank.service;

import java.util.Collection;

import team.lala.timebank.dao.JobDao;

import team.lala.timebank.entity.Job;

public class JobService {

	private JobDao jobDao = new JobDao();
	
	// 使用者刊登志工需求
	public void insertJob(Job job) { 
		jobDao.insert(job);
	}
	
	// 更新志工需求
	public void updateJob(Job job) {
		jobDao.update(job);
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
