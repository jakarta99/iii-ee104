package team.lala.jasmine.service;

import static org.junit.Assert.*;

import org.junit.Test;

public class CalculateServiceTest {

	@Test
	public void testAdd() {
		CalculateServiceImpl calculateService = new CalculateServiceImpl();
		
		assertEquals(3, calculateService.add(1, 2));
		assertEquals(9, calculateService.add(4, 5));
	}
	
	@Test
	public void testSub() {
		CalculateServiceImpl calculateService = new CalculateServiceImpl();
		
		assertEquals(3, calculateService.sub(5, 2));
		assertEquals(12, calculateService.sub(15, 3));
	}
	
	@Test
	public void testMul() {
		CalculateServiceImpl calculateService = new CalculateServiceImpl();
		
		assertEquals(6, calculateService.mul(3, 2));
		assertEquals(20, calculateService.mul(4, 5));
	}
	

}
