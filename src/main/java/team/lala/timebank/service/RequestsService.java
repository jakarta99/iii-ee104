package team.lala.timebank.service;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import team.lala.timebank.dao.RequestsDao;
import team.lala.timebank.dao.TimeLedgerDao;
import team.lala.timebank.entity.Requests;

/**
 * Using the methods of JobDao to implement some service
 * 
 * @author Sheila
 *
 */
@Service
public class RequestsService {

	@Autowired
	private RequestsDao requestsDao;

	// update
	public void update(Requests request) {

		requestsDao.save(request);

	}

	public Collection<Requests> findAllByMemberId(Long id) {

		Collection<Requests> requests = requestsDao.findAllByMemberId(id);

		return requests;

	}

	public List<Requests> findAll() {

		List<Requests> requestsList = requestsDao.findAll();

		if (requestsList == null) {
			// FIXME test on console
			System.out.println("jobList does not exist");
		}
		return requestsList;
	}

	public Requests findByRequestListId(Long id) {

		Requests requests = requestsDao.getOne(id);

		if (requests == null) {
			// FIXME test on console
			System.out.println("id" + id + " does not exist");
		}
		return requests;
	}

	public void delete(Long id) {

		requestsDao.deleteById(id);

	}

	public Collection<Requests> findByJobAreaAndServiceType(Integer jobArea, Integer serviceType) {

		Collection<Requests> requestsList = requestsDao.findByJobAreaAndServiceType(jobArea, serviceType);

		if (requestsList == null) {

			System.out.println("requestsList does not exist");

		}
		return requestsList;
	}
}
