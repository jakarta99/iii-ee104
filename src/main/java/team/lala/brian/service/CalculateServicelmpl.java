package team.lala.brian.service;

import team.lala.service.CalculateService;

public class CalculateServicelmpl implements CalculateService {

	@Override
	public int add(int a, int b) {
		int add=a+b;
		return add;
	}

	@Override
	public int sub(int a, int b) {
		int sub=a-b;
		return sub;
	}

	@Override
	public int mul(int a, int b) {
		int mul=a*b;
		return mul;
	}

	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}

}
