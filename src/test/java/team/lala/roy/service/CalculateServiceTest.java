package team.lala.roy.service;

import static org.junit.Assert.*;

import org.junit.Test;

import team.lala.gary.service.CalculateServiceImpl;

public class CalculateServiceTest {

	@Test
	public void testAdd() {
		CalculateServiceImpl calculateService = new CalculateServiceImpl();
		int sum = calculateService.add(1, 2);
		assertEquals(3, sum);
	}

	@Test
	public void testSub() {
		CalculateServiceImpl calculateService = new CalculateServiceImpl();
		int result = calculateService.sub(3, 2);
		assertEquals(1, result);
	}

	@Test
	public void testMul() {
		CalculateServiceImpl calculateService = new CalculateServiceImpl();
		int result = calculateService.mul(3, 2);
		assertEquals(6, result); 
	}

}
