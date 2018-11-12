package team.lala.gary.service;

import static org.junit.Assert.fail;

import org.junit.Test;

import team.lala.timebank.service.SpringBootTest;
@SpringBootTest
public class CalculateServiceImplTest {

	@Test
	public void testAdd() {
		CalculateServiceImpl calculateService = new CalculateServiceImpl();
		//...
	}

	@Test
	public void testSub() {
		fail("Not yet implemented");
	}

	@Test
	public void testMul() {
		fail("Not yet implemented");
	}

}
