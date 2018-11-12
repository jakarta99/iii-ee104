package team.lala.timebank.service;

import org.junit.Test;
import org.springframework.boot.test.context.SpringBootTest;

import team.lala.timebank.entity.Member;
@SpringBootTest
public class RegisteredTest {
	MemberService memberService = new MemberService();

	@Test
	public void testRegistered() {
		String loginAccount = "qqqq123";
		String password = "qqq123";
		String email = "qqq123@yahoo.com.tw";
		String name = "你他媽";
		String mobile = "0912456789";
		String type = "1";
		String telephone = "0245634569";
		
		Member member = new Member();
		member.setLoginAccount(loginAccount);
		member.setPassword(password);
		member.setEmail(email);
		member.setName(name);
		member.setMobile(mobile);
		member.setType(type);
		member.setTelephone(telephone);
		
		memberService.registered(loginAccount, password, name, type, email, telephone, mobile);
		
		
	}

}
