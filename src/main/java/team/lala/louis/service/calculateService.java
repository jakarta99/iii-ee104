package team.lala.louis.service;

import team.lala.service.CalculateService;

public class calculateService implements CalculateService {

	@Override
	public int add(int a, int b) {
		int c = a + b;
		return c;
	}

	@Override
	public int sub(int a, int b) {
		int c = a - b ;
		return c;
	}

	@Override
	public int mul(int a, int b) {
		int c = a * b;
		return c;
	}

}