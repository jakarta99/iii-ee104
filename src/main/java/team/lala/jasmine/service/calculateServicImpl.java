package team.lala.jasmine.service;

import team.lala.service.CalculateService;

public class calculateServicImpl implements CalculateService {

	@Override
	public int add(int a, int b) {
		return a + b;
	}

	@Override
	public int sub(int a, int b) {
		
		return a - b;
	}

	@Override
	public int mul(int a, int b) {
		return a * b;
	}

	public static void main(String[] args) {
		

	}

}
