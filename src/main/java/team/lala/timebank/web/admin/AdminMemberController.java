package team.lala.timebank.web.admin;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.extern.slf4j.Slf4j;
import team.lala.timebank.commons.ajax.AjaxResponse;
import team.lala.timebank.entity.Member;
import team.lala.timebank.enums.MemberType;
import team.lala.timebank.service.MemberService;
import team.lala.timebank.spec.MemberSpecification;

@Slf4j
@Controller
@RequestMapping("/admin/member")
public class AdminMemberController {

	
//	private Logger log = LoggerFactory.getLogger(AdminMemberController.class);
	
	
	@Autowired
	private MemberService memberService;

	
	@RequestMapping("/list")
	public String listPage(Model model) {
		//FIXME		
//		return "/member/member_list";
		return "/admin/member/member_list2";

	}

	@RequestMapping("/add")
	public String addPage(@RequestParam("memberType") MemberType memberType, Model model) {
		model.addAttribute("memberType", memberType);
		return "/admin/member/member_add";

	}

	@RequestMapping("/edit/{id}")
	public String editPage(@PathVariable Long id, Model model) {
		Member member = memberService.getOne(id);
		model.addAttribute("member", member);
		return "/admin/member/member_edit";
	}
	


	@RequestMapping("/query")
	@ResponseBody
	public List<Member> queryMember(Member inputMember){
		System.out.println("query");
		System.out.println("inputmember=" + inputMember);
		MemberSpecification memberSpec = new MemberSpecification(inputMember);
		List<Member> members = memberService.findBySpecification(memberSpec);
		System.out.println("queryMember=" +members);
		return members;
	}
	
	@RequestMapping("/queryPage")
	@ResponseBody
	public Page<Member> queryMember(Member inputMember, @RequestParam(value="start",required=false) Optional<Integer> start, 
			@RequestParam(value="length",required=false) Optional<Integer> length){
		int page = start.orElse(0)/length.orElse(10);

		log.debug("start={},page={},length={}", start, page, length );
		log.debug("inputMember={}",inputMember);
		MemberSpecification memberSpec = new MemberSpecification(inputMember);	
		Page<Member> members = memberService.findBySpecification(memberSpec,PageRequest.of(page, length.orElse(10)));
		log.debug("PageRequest={}",PageRequest.of(page, length.orElse(10)));
		log.debug("queryMember={}",members.getContent());
		log.debug("Total Element Number={},total page={} ",members.getTotalElements(), members.getTotalPages());
		return members;
	}
	
	@ResponseBody
	@RequestMapping("/update")
	public AjaxResponse<Member> updateMember(Member member) {		
		log.debug("inputMember={}", member);
		AjaxResponse<Member> response = new AjaxResponse<Member>();
		try {
			Member updatedMember = memberService.update(member);
			response.setObj(updatedMember);
			log.debug("updatedMember={}", updatedMember);
			log.debug("資料更新成功" );
		} catch (Exception e) {
			response.addMessage("資料更新失敗" + e.getMessage());
			log.debug("資料更新失敗" );
		}
		return 	response;
	}


	@RequestMapping("/insert")
	@ResponseBody
	public AjaxResponse<Member> insertMember(Member member) {		
		log.debug("member={}", member);
		AjaxResponse<Member> response = new AjaxResponse<Member>();
		
		try {
			Member newMember = memberService.insert(member);
			response.setObj(newMember);
			log.debug("新增成功" );
		} catch (Exception e) {
			response.addMessage("新增失敗" + e.getMessage());
			e.printStackTrace();
		}
		return response;
	}

	@RequestMapping("/delete/{id}")
	@ResponseBody
	public AjaxResponse<Member> deleteMember(@PathVariable Long id) {
		AjaxResponse<Member> response = new AjaxResponse<Member>();
		System.out.println("id = "+id);
		try {
			memberService.deleteById(id);
			log.debug("刪除成功" );
		} catch (Exception e) {
			response.addMessage("刪除失敗" + e.getMessage());
			e.printStackTrace();
		}		
		return response;

	}
	

	


}