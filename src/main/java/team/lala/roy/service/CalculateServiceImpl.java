package team.lala.roy.service;
import team.lala.service.CalculateService;

public class CalculateServiceImpl implements CalculateService{

		@Override
		public int add(int a, int b) {

			return a+b;
		}

		@Override
		public int sub(int a, int b) {
			// TODO Auto-generated method stub
			return a-b;
		}

		@Override
		public int mul(int a, int b) {
			// TODO Auto-generated method stub
			return 0;
		}

}
