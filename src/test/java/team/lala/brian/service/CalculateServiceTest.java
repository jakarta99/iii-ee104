package team.lala.brian.service;

import static org.junit.Assert.*;

import org.junit.Test;

public class CalculateServiceTest {

	@Test
	public void testAdd() {
		CalculateServiceImpl calculateService = new CalculateServiceImpl();

		assertEquals(3, calculateService.add(1, 2));
		assertEquals(7, calculateService.add(2, 5));

	}

	@Test
	public void testSub() {
		CalculateServiceImpl calculateService = new CalculateServiceImpl();
		assertEquals(1, calculateService.sub(3, 2));
		assertEquals(2, calculateService.sub(6, 4));
	}

	@Test
	public void testMul() {
		CalculateServiceImpl calculateService = new CalculateServiceImpl();
		assertEquals(2, calculateService.mul(1, 2));
		assertEquals(12, calculateService.mul(3, 4));
	}

}
