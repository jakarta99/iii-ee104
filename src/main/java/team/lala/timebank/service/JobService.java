package team.lala.timebank.service;
import java.util.ArrayList;
import java.util.Collection;

import team.lala.timebank.dao.JobDao;

import team.lala.timebank.entity.Job;

public class JobService {

	private JobDao jobDao = new JobDao();
	
	// 使用者刊登志工需求
	public void insertJob(Job job) { 
		jobDao.getConnection();
		jobDao.insert(job);
		jobDao.closeConnection();

	}
	
	// 更新志工需求
	public void updateJob(Job job) {
		jobDao.getConnection();
		jobDao.update(job);
		jobDao.closeConnection();

	}
	
	//搜尋所有志工需求表
	public void findAllJob() {
		jobDao.getConnection();
		Collection<Job> jobList = jobDao.findAll();
		for(Job job : jobList) {
			System.out.println(job.toString());
		}
		jobDao.closeConnection();
	}
	
	
	//根據jobId搜尋志工需求
	public void findOneJobByJobId(Long jobId) {
		jobDao.getConnection();
		Job job = jobDao.findOne(jobId);
		System.out.println(job.toString());
		jobDao.closeConnection();
	}
	
	//刪除志工需求
	public void deleteJobByJobId(Long jobId) {
		jobDao.getConnection();		
		jobDao.delete(jobId);
		jobDao.closeConnection();
	}
	
	
	
	

	

}
