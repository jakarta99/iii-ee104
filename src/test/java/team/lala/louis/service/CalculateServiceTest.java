package team.lala.louis.service;

import static org.junit.Assert.*;

import org.junit.Test;


public class CalculateServiceTest {

	@Test
	public void testAdd() {
		CalculateServiceImpl calculateService = new CalculateServiceImpl();
		
		assertEquals(3, calculateService.add(1, 2));
		assertEquals(5, calculateService.add(4, 1));
	}

	@Test
	public void testSub() {
		CalculateServiceImpl calculateService = new CalculateServiceImpl();

		assertEquals(2, calculateService.sub(4, 2));
		assertEquals(1, calculateService.sub(3, 2));
	}

	@Test
	public void testMul() {
		CalculateServiceImpl calculateService = new CalculateServiceImpl();
		
		assertEquals(6, calculateService.mul(3, 2));
		assertEquals(12, calculateService.mul(4, 3));
	}

}
