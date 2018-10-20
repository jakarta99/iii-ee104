package team.lala.timebank.service;

import team.lala.timebank.dao.JobDao;

import team.lala.timebank.entity.Job;

public class JobService {

	private  JobDao jobDao = new JobDao();

	
	

	public void getAll() {
		jobDao.findAll();
		
		
		
	}

	public void getByJobId(Long jobId) {
		jobDao.findOne(jobId);
		
		
		
	}
	

}
