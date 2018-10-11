package team.lala.brian.service;

import team.lala.service.CalculateService;

public class CalculateServiceImpl implements CalculateService {

	@Override
	public int add(int a, int b) {
		int add = a + b;
		return add;
	}

	@Override
	public int sub(int a, int b) {
		int sub = a - b;
		return sub;
	}

	@Override
	public int mul(int a, int b) {
		int mul = a * b;
		return mul;
	}

}
