package team.lala.jasmine.service;

import static org.junit.Assert.*;

import org.junit.Test;

public class CalculateServiceTest2 {

	@Test
	public void testAdd() {
		CalculateServiceImpl a = new CalculateServiceImpl();
//<<<<<<< HEAD
//		assertEquals(12, a.add(6, 6));
//=======
//		 assertEquals(15, a.add(10, 5));
//>>>>>>> branch 'master' of https://github.com/jakarta99/iii-ee104
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
