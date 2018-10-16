package team.lala.jasmine.service;

import static org.junit.Assert.*;

import org.junit.Test;

public class CalculateServiceTest2 {

	@Test
	public void testAdd() {
		CalculateServiceImpl a = new CalculateServiceImpl();
		assertEquals(9, a.add(4, 5));
		assertEquals(7, a.add(2, 5));
	}
	
	@Test
	public void testSub() {
		CalculateServiceImpl a = new CalculateServiceImpl();
		assertEquals(8, a.sub(10, 2));
		assertEquals(11, a.sub(99, 88));
	}
	
	@Test
	public void testMul(){
		CalculateServiceImpl a = new CalculateServiceImpl();
		assertEquals(30, a.mul(5, 6));
		assertEquals(56, a.mul(8, 7));
		
	}

}
