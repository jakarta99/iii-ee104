package team.lala.timebank.service;
import java.util.ArrayList;
import java.util.Collection;

import team.lala.timebank.dao.JobDao;

import team.lala.timebank.entity.Job;

public class JobService {

	private JobDao jobDao = new JobDao();
	
	// 使用者刊登志工需求
	public void insert(Job job) { 
		jobDao.getConnection();
		jobDao.insert(job);
		jobDao.closeConnection();
	}
	
	// 更新志工需求
	public void update(Job job) {
		jobDao.getConnection();
		jobDao.update(job);
		jobDao.closeConnection();

	}
	
	//搜尋所有志工需求表
	public Collection<Job> findAll() {
		jobDao.getConnection();
		Collection<Job> jobList = jobDao.findAll();
		jobDao.closeConnection();
		if(jobList ==null) {
			System.out.println("jobList does not exist");
		}
		return jobList;
	}
	
	
	//根據jobId搜尋志工需求
	public Job findOne(Long jobId) {
		jobDao.getConnection();
		Job job = jobDao.findOne(jobId);
		jobDao.closeConnection();
		if(job == null) {
			System.out.println("jobId does not exist");
		}
		return job;
	}
	
	//刪除志工需求
	public void delete(Long jobId) {
		jobDao.getConnection();		
		jobDao.delete(jobId);
		jobDao.closeConnection();
	}
	
	
	
	

	

}
