package team.lala.anchor.service;

import static org.junit.Assert.fail;

import org.junit.Test;

import team.lala.service.CalculateService;

import static org.junit.Assert.assertEquals;

public class CalculateServiceTest {

	@Test
	public void testAdd() {
		CalculateService calculateService = new CalculateServiceImpl();
		assertEquals(7, calculateService.add(3, 4));
		assertEquals(10, calculateService.add(6, 4));
	}

	@Test
	public void testSub() {
		CalculateService calculateService = new CalculateServiceImpl();
		assertEquals(3, calculateService.sub(7, 4));
	}

	@Test
	public void testMul() {
		CalculateService calculateService = new CalculateServiceImpl();
		assertEquals(12, calculateService.mul(3, 4));
	}

}
