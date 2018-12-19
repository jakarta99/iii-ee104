package team.lala.timebank.web.admin;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import team.lala.timebank.commons.ajax.AjaxResponse;
import team.lala.timebank.entity.Member;
import team.lala.timebank.entity.Role;
import team.lala.timebank.service.MemberService;
import team.lala.timebank.service.RoleService;

@Controller
@RequestMapping("/admin/securityUser")
public class AdminSecurityUserController {
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private RoleService roleService;
	
	

	@RequestMapping("/list")
	public String list() {
		return "/admin/securityUser/securityUser_list";
	}
	

	@RequestMapping("/add")
	public String add() {
		return "/admin/securityUser/securityUser_add";
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
	
	
	
//	@ResponseBody
//	@RequestMapping("/update")
//	public AjaxResponse<Member> update(Member member) {
//		System.out.println("inputMember="+member);			
//		AjaxResponse<Member> response = new AjaxResponse<Member>();
//		try {
//			Member updatedMember = memberService.update(member);
//			response.setObj(updatedMember);
//			System.out.println("updatedMember="+updatedMember);		
//			System.out.println("資料更新成功");
//		} catch (Exception e) {
//			response.addMessage("資料更新失敗" + e.getMessage());
//			System.out.println("資料更新失敗");
//		}
//		return 	response;
//	}


//	@RequestMapping("/insert")
//	@ResponseBody
//	public AjaxResponse<Member> insert(@RequestParam("memberId") Long memberId, @RequestParam("roleId") Long roleId) {		
//		System.out.println("member = " + member);
//		AjaxResponse<Member> response = new AjaxResponse<Member>();
//		
//		try {
//			Member newMember = memberService.insert(member);
//			response.setObj(newMember);
//			System.out.println("新增成功");
//		} catch (Exception e) {
//			response.addMessage("新增失敗" + e.getMessage());
//			e.printStackTrace();
//		}
//		return response;
//	}

	@RequestMapping("/delete")
	@ResponseBody
	public AjaxResponse<Member> deleteMember(@RequestParam("memberId") Long memberId, @RequestParam("roleId") Long roleId) {
		System.out.println("securityUser delete:");
		System.out.println("memberId=" +memberId+ ", roleId="+roleId );
		
		AjaxResponse<Member> response = new AjaxResponse<Member>();
		try {
			roleService.deleteMemberRole(memberId, roleId);
			System.out.println("刪除成功");
		} catch (Exception e) {
			response.addMessage("刪除失敗" + e.getMessage());
			e.printStackTrace();
		}		
		return response;

	}
	

}
