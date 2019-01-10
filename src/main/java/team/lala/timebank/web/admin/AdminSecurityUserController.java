package team.lala.timebank.web.admin;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.extern.slf4j.Slf4j;
import team.lala.timebank.commons.ajax.AjaxResponse;
import team.lala.timebank.entity.Member;
import team.lala.timebank.entity.Role;
import team.lala.timebank.service.MemberService;
@Slf4j
@Controller
@RequestMapping("/admin/securityUser")
public class AdminSecurityUserController {
	
	@Autowired
	private MemberService memberService;

	@RequestMapping("/list")
	public String list() {
		return "/admin/securityUser/securityUser_list";
	}
	
	@ResponseBody
	@RequestMapping("/add")
	public AjaxResponse<Member> add(@RequestParam("memberId") Long memberId,
			@RequestParam("roleId") Long roleId, Model model) {
		log.debug("memberId={}, roleId={} ",memberId, roleId);
		AjaxResponse<Member> resp = new AjaxResponse<Member>();
		Member member = null;
		if (memberId != 0 && roleId != 0) {
			member = memberService.addRole(memberId, roleId);
		}
		member = memberService.update(member);
		resp.setObj(member);
		
		return resp;
	}
	
	
	@RequestMapping("/query")
	@ResponseBody
	public List<Map<String, Object>> query() {
		List<Member> members = memberService.findAll();
		List<Map<String, Object>> maps = new ArrayList<Map<String, Object>>();
		for (Member m : members) {
			Set<Role> roles = m.getRoles();
			for (Role r : roles) {
				Map<String, Object> map = new HashMap<>();
				map.put("id", m.getId());
				map.put("account", m.getUsername());
				map.put("role", r);
				maps.add(map);
			}	
		}
		return maps;
	}
	
	
	@RequestMapping("/delete")
	@ResponseBody
	public AjaxResponse<Member> deleteMember(@RequestParam("memberId") Long memberId, @RequestParam("roleId") Long roleId) {
		System.out.println("securityUser delete:");
		System.out.println("memberId=" +memberId+ ", roleId="+roleId );
		
		AjaxResponse<Member> response = new AjaxResponse<Member>();
		try {
			memberService.deleteMemberRole(memberId, roleId);
			System.out.println("刪除成功");
		} catch (Exception e) {
			response.addMessage("刪除失敗" + e.getMessage());
			e.printStackTrace();
		}		
		return response;

	}
	

}
