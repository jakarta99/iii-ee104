package team.lala.timebank.service;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import team.lala.timebank.web.RegisteredController;

@RunWith(SpringRunner.class)
@SpringBootTest
public class RegisteredTest {
	RegisteredController registeredControll = new RegisteredController();

	@Test
	public void testRegistered() {
		String loginAccount = "qqqq123";
		String password = "qqq123";
		String email = "qqq123@yahoo.com.tw";
		String name = "你他媽";
		String mobile = "0912456789";
		String type = "1";
		String telephone = "0245634569";

		registeredControll.MemberRegistered(loginAccount, password, name, type, email, telephone, mobile);

	}

}
