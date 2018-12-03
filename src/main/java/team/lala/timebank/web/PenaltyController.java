package team.lala.timebank.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import team.lala.timebank.entity.Penalty;
import team.lala.timebank.service.PenaltyService;

@Controller
@RequestMapping("/penalty")
public class PenaltyController {

	@Autowired
	private PenaltyService penaltyService;

	@RequestMapping("/add")
	public String add() {
	return "/penalty/penalty_add";

	}
	
	@RequestMapping("/edit")
	public String edit(@RequestParam("id") Long id, Model model) {
		Penalty penalty = penaltyService.getOne(id);
		model.addAttribute("penalty", penalty);
		return "/penalty/penalty_edit";

	}
	
	@RequestMapping("/update")
	@ResponseBody
	public Map<String, String> update(Penalty penalty, Model model) {
		Map<String, String> msg = new HashMap<>();
		try {
			Penalty penalty1 = penaltyService.getOne(penalty.getId());
			penalty1.setPenaltyTimeValue(penalty.getPenaltyTimeValue());
			penalty1.setStatus(penalty.getStatus());
			penaltyService.save(penalty1);
			msg.put("msg", "新增成功");
		} catch (Exception e) {
			msg.put("msg", "新增失敗");
			e.printStackTrace();
		}
		return msg;
	}
	
	@RequestMapping("/insert")
	@ResponseBody
	public Map<String, String> insert(Penalty penalty) {
		Map<String, String> msg = new HashMap<>();
		try {
			penaltyService.save(penalty);
			msg.put("msg", "新增成功");
		} catch (Exception e) {
			msg.put("msg", "新增失敗");
			e.printStackTrace();
		}	
		return msg;
	}

	@RequestMapping("/delete")
	@ResponseBody
	public Map<String, String> delete(@RequestParam("id") Long id) {
		Map<String, String> msg = new HashMap<>();	
		try {
			penaltyService.delete(id);
			msg.put("msg", "刪除成功");
		} catch (Exception e) {
			msg.put("msg", "刪除失敗");
			e.printStackTrace();
		} 
			return msg;			
	}
	
	@RequestMapping("/list")
	public String list() {
		return "/penalty/penalty_list";
	}
	
	@ResponseBody
	@RequestMapping("/getList")
	public List<Penalty> getList() {
		List<Penalty> penalties = penaltyService.findAll();
		return penalties;

	}

}
