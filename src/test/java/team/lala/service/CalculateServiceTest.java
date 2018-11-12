package team.lala.service;

import org.junit.Test;

import team.lala.gary.service.CalculateServiceImpl;
import team.lala.timebank.service.SpringBootTest;

import static org.junit.Assert.assertEquals;
@SpringBootTest
public class CalculateServiceTest {

	@Test
	public void testAdd() {
		CalculateService calculateService = new CalculateServiceImpl();
		int sum = calculateService.add(1, 2);
		
		assertEquals(3, sum);
		
		assertEquals(5, calculateService.add(3, 2));
		
		assertEquals(2002, calculateService.add(2000, 2));
	}
	
	@Test
	public void testSub() {
		CalculateService calculateService = new CalculateServiceImpl();
		int result = calculateService.sub(3, 1);
		
		assertEquals(2, result);
	}
	
	@Test
	public void testMul() {
		CalculateService calculateService = new CalculateServiceImpl();
		int result = calculateService.mul(3, 2);
		
		assertEquals(6, result);
	}
	
	
	

}
