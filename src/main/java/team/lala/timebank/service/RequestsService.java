package team.lala.timebank.service;
import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import team.lala.timebank.dao.RequestsDao;
import team.lala.timebank.dao.TimeLedgerDao;
import team.lala.timebank.entity.Requests;

/**
 * Using the methods of JobDao to implement some service
 * @author Sheila
 *
 */
@Service
public class RequestsService {
	
	
	@Autowired
	private RequestsDao requestsDao;
	
	

	
	
	/**
	 * posting recruit for volunteers 
	 * @param job 
	 */
//	public void insert(Job job) { 
//		jobDao.getConnection();
//		jobDao.insert(job);
//		jobDao.closeConnection();
//	}
	
	/**
	 * update the job recruit
	 * @param job
	 */
	public void update(Requests request) {
		
		requestsDao.save(request);
		
	}
	
	/**
	 * lists all the jobs
	 * @return the collection of all jobs
	 */
	public List<Requests> findAll() {
		
		List<Requests> requestsList = requestsDao.findAll();
		
		if(requestsList ==null) {
			// FIXME test on console
			System.out.println("jobList does not exist");
		}
		return requestsList;
	}
	
	
	/**
	 * find a job by using id
	 * @param id
	 * @return the job found by using id
	 */
	public Requests findByRequestListId(Long id) {
		
		Requests requests = requestsDao.getOne(id);
		
		if(requests == null) {
			// FIXME test on console
			System.out.println( "id" + id + " does not exist");
		}
		return requests;
	}
	
	/**
	 * delete the recruit
	 * @param id
	 */
	public void delete(Long id) {
			
		requestsDao.deleteById(id);
		
	}
	
	
	
	
	
	

	

}
