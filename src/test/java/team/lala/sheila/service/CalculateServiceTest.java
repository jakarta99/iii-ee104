package team.lala.sheila.service;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.fail;

import org.junit.Test;

import team.lala.sheila.service.CalculateServiceImpl;

public class CalculateServiceTest {

	@Test
	public void testAdd() {
		CalculateServiceImpl calculateService = new CalculateServiceImpl();
		assertEquals(3, calculateService.add(1, 2));
		assertEquals(7, calculateService.add(5, 2));
	}

	@Test
	public void testSub() {
		CalculateServiceImpl calculateService = new CalculateServiceImpl();
		assertEquals(3, calculateService.sub(5, 2));
		assertEquals(6, calculateService.sub(8, 2));
	}

	@Test
	public void testMul() {
		CalculateServiceImpl calculateService = new CalculateServiceImpl();
		assertEquals(6, calculateService.mul(3, 2));
		assertEquals(20, calculateService.mul(10, 2));

	}

}
