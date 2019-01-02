package team.lala.timebank.web.user;

import java.security.Principal;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.extern.slf4j.Slf4j;
import team.lala.timebank.entity.Member;
import team.lala.timebank.entity.TimeLedger;
import team.lala.timebank.service.MemberService;
import team.lala.timebank.service.TimeLedgerService;

@Slf4j
@Controller
@RequestMapping("/user/transaction-record")
public class UserTransactionRecordController {
	
	@Autowired
	private TimeLedgerService timeLedgerService;
	
	@Autowired
	private MemberService memberService;
	
	@RequestMapping("/list")
	public String listPage(Model model) {
		Member userDetails = (Member) SecurityContextHolder.getContext()  
				.getAuthentication()  
				.getPrincipal();
		log.debug("USERID={}", userDetails.getId());
		Member member = memberService.getOne(userDetails.getId());
		List<TimeLedger> timeLedgers = timeLedgerService.findByMemberId(member);
		System.out.println(timeLedgers);
		model.addAttribute("member", member);
		model.addAttribute("timeLedgers", timeLedgers);
		return "/basic/user/transaction_record/transaction-record_list";
	}
	
	@RequestMapping("/query")
	@ResponseBody
	public Page<TimeLedger> queryTimeLedger(Principal principal,
			@RequestParam(name = "start", required = false) Optional<Integer> start, 
			@RequestParam(name = "length", required = false) Optional<Integer> length){
		int page = start.orElse(0)/length.orElse(10);
		Page<TimeLedger> timeLedgers = timeLedgerService.findByMemberId(memberService.findByAccount(principal.getName()), page, length);
		return timeLedgers;
	}
	
	//測試直接從登入資訊中取得會員id
	@RequestMapping("/test")
	public void showMember() {
		Member userDetails = (Member) SecurityContextHolder.getContext()  
	    					.getAuthentication()  
							.getPrincipal();  
		log.debug("USERID={}", userDetails.getId());		  
		log.debug("USERNAME={}", userDetails.getAccount());
		log.debug("USERNAME={}", userDetails.getUsername());
	}
}
