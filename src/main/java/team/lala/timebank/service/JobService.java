package team.lala.timebank.service;

import java.util.ArrayList;
import java.util.Collection;

import team.lala.timebank.dao.JobDao;

import team.lala.timebank.entity.Job;

public class JobService {

	private JobDao jobDao = new JobDao();

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

	}

	public void getByJobId(Long jobId) {
		jobDao.getConnection();
		Job job = jobDao.findOne(jobId);

		System.out.println(job.getJobId());
		System.out.println(job.getRequester());
		System.out.println(job.getJobTitle());
		System.out.println(job.getTimeValue());
		jobDao.closeConnection();

	}

}
