package team.lala.timebank.web.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import team.lala.timebank.commons.ajax.AjaxResponse;
import team.lala.timebank.entity.Role;
import team.lala.timebank.service.RoleService;

@Controller
@RequestMapping("/admin/role")
public class AdminRoleController {
	@Autowired
	private RoleService roleService;
	
	

	@RequestMapping("/list")
	public String listPage(Model model) {
//		List<Role> roles = roleService.findAll();
//		model.addAttribute("roles", roles);
		
		return "/admin/role/role_list";

	}

	@RequestMapping("/add")
	public String addPage() {
		return "/admin/role/role_add";

	}

	@RequestMapping("/edit")
	public String editPage(@RequestParam("id") Long id, Model model) {
		Role role = roleService.getOne(id);
		model.addAttribute("role", role);
		return "/admin/role/role_edit";
	}
	


	@RequestMapping("/query")
	@ResponseBody
	public List<Role> queryMember(){
		List<Role> roles = roleService.findAll();
		System.out.println("roles=" +roles);
		return roles;
	}
	

	
	@ResponseBody
	@RequestMapping("/update")
	public AjaxResponse<Role> updateMember(Role role) {
		System.out.println("unputRole="+role);			
		AjaxResponse<Role> response = new AjaxResponse<Role>();
		try {
			Role updatedRole = roleService.save(role);
			response.setObj(updatedRole);
			System.out.println("updatedMember="+updatedRole);		
			System.out.println("資料更新成功");
		} catch (Exception e) {
			response.addMessage("資料更新失敗" + e.getMessage());
			System.out.println("資料更新失敗");
		}
		return 	response;
	}


	@RequestMapping("/insert")
	@ResponseBody
	public AjaxResponse<Role> insertMember(Role role) {		
		System.out.println("inputRole = " + role);
		AjaxResponse<Role> response = new AjaxResponse<Role>();
		
		try {
			Role newRole =roleService.insert(role);
			response.setObj(newRole);
			System.out.println("新增成功");
		} catch (Exception e) {
			response.addMessage("新增失敗" + e.getMessage());
			e.printStackTrace();
		}
		return response;
	}

	@RequestMapping("/delete")
	@ResponseBody
	public AjaxResponse<Role> deleteMember(@RequestParam("id") Long id) {
		AjaxResponse<Role> response = new AjaxResponse<Role>();
		System.out.println("id = "+id);
		try {
			roleService.deleteById(id);
			System.out.println("刪除成功");
		} catch (Exception e) {
			response.addMessage("刪除失敗" + e.getMessage());
			e.printStackTrace();
		}		
		return response;

	}
	

	

}
