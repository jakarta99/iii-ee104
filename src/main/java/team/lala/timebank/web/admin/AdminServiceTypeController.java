package team.lala.timebank.web.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import team.lala.timebank.commons.ajax.AjaxResponse;
import team.lala.timebank.entity.ServiceType;
import team.lala.timebank.service.ServiceTypeService;

@Controller
@RequestMapping("/admin/serviceType")
public class AdminServiceTypeController {
	@Autowired
	private ServiceTypeService serviceTypeService;

	@RequestMapping("/list")
	public String listPage(Model model) {
//		List<Role> roles = roleService.findAll();
//		model.addAttribute("roles", roles);

		return "/admin/serviceType/serviceType_list";

	}

	@RequestMapping("/add")
	public String addPage() {
		return "/admin/serviceType/serviceType_add";

	}

	@RequestMapping("/edit")
	public String editPage(@RequestParam("id") Long id, Model model) {
		ServiceType serviceType = serviceTypeService.getOne(id);
		model.addAttribute("serviceType", serviceType);
		return "/admin/serviceType/serviceType_edit";
	}

	@RequestMapping("/query")
	@ResponseBody
	public List<ServiceType> query() {
		List<ServiceType> serviceType = serviceTypeService.findAll();
		System.out.println("serviceType=" + serviceType);
		return serviceType;
	}

	@ResponseBody
	@RequestMapping("/save")
	public AjaxResponse<ServiceType> save(ServiceType serviceType) {
		AjaxResponse<ServiceType> response = new AjaxResponse<ServiceType>();
		try {
			serviceTypeService.save(serviceType);
			response.setObj(serviceType);
		} catch (Exception e) {
			response.addMessage("資料更新失敗" + e.getMessage());
		}
		return response;
	}

//	@RequestMapping("/insert")
//	@ResponseBody
//	public AjaxResponse<ServiceType> insert(ServiceType serviceType) {		
//		AjaxResponse<ServiceType> response = new AjaxResponse<ServiceType>();
//		
//		try {
//			serviceTypeService.save(serviceType);
//			response.setObj(serviceType);
//		} catch (Exception e) {
//			response.addMessage("新增失敗" + e.getMessage());
//			e.printStackTrace();
//		}
//		return response;
//	}

	@RequestMapping("/delete")
	@ResponseBody
	public AjaxResponse<ServiceType> delete(@RequestParam("id") Long id) {
		AjaxResponse<ServiceType> response = new AjaxResponse<ServiceType>();
		try {
			serviceTypeService.deleteById(id);
		} catch (Exception e) {
			response.addMessage("刪除失敗" + e.getMessage());
			e.printStackTrace();
		}
		return response;

	}

}
