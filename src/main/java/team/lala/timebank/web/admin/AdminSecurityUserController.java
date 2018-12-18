package team.lala.timebank.web.admin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import team.lala.timebank.entity.Member;
import team.lala.timebank.entity.Role;
import team.lala.timebank.service.MemberService;

@Controller
@RequestMapping("/admin/securityUser")
public class AdminSecurityUserController {
	
	@Autowired
	private MemberService memberService;
	
	@RequestMapping("/query")
	@ResponseBody
	public Map<String, Object> query() {
		String resp="";
		List<Member> members = memberService.findAll();
		Map<String, Object> map = new HashMap<>();

		for (Member m : members) {
			Set<Role> roles = m.getRoles();
			for (Role r : roles) {
				map.put("id", m.getId());
				map.put("id", m.getAccount());
				map.put("role", r);
			}	
		}
		return map;
	}
	

	@RequestMapping("/list")
	public String list() {
		return "/admin/securityUser/securityUser_list";
	}

}
