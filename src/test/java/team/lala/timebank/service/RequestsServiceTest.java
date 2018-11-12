package team.lala.timebank.service;

import static org.junit.Assert.fail;

import java.util.Collection;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.web.bind.annotation.RestController;

import team.lala.timebank.entity.Requests;

@RestController
@SpringBootTest
public class RequestsServiceTest {
	@Autowired
	private RequestsService requestsService;
	Integer jobArea = 3;
	Integer serviceType = 4;

	@Test
	public void testUpdate() {
		fail("Not yet implemented");
	}

	@Test
	public void testFindAll() {
		RequestsService requestsService = new RequestsService();
		Collection<Requests> requsetsList = requestsService.findAll();
		if (requsetsList != null) {

			for (Requests requsets : requsetsList) {
				System.out.println(requsets.toString());
			}
		}
	}

	@Test
	public void testFindByRequestListId() {
		fail("Not yet implemented");
	}

	@Test
	public void testDelete() {
		fail("Not yet implemented");
	}

	// @Test
	// public void testFindByJobAreaAndServiceType() {
	//
	// RequestsService requestsService = new RequestsService();
	//
	// requestsService.findByJobAreaAndServiceType(jobArea, serviceType);
	//
	// }
}
