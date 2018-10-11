package team.lala.jasmine.service;

import static org.junit.Assert.*;

import org.junit.Test;

public class CalculateServiceTest {

	@Test
	public void testAdd() {
		CalculateServiceImpl calculateService = new CalculateServiceImpl();
		int result = calculateService.add(1, 2);
		
		assertEquals(3, result);
	}
	
	@Test
	public void testSub() {
		CalculateServiceImpl calculateService = new CalculateServiceImpl();
		int result = calculateService.sub(5, 2);
		
		assertEquals(3, result);
	}
	
	@Test
	public void testMul() {
		CalculateServiceImpl calculateService = new CalculateServiceImpl();
		int result = calculateService.mul(3, 2);
		
		assertEquals(6, result);
	}
	

}
