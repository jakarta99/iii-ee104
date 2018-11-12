package team.lala.timebank.service;

import static org.junit.Assert.fail;

import java.util.Collection;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import team.lala.timebank.entity.Member;


@RunWith(SpringRunner.class)
@SpringBootTest
public class MemberServiceTest {
	
	@Autowired
	MemberService memberService; 
	
	@Test
	public void testFindAll() {
		Long id = 1l;
		if (memberService!= null) {
			Collection<Member> members = memberService.findAll();
			for (Member m :members) {
				System.out.println(m.getId());
				System.out.println(m.getLoginAccount());
			}
			
		}
		
	}


}
