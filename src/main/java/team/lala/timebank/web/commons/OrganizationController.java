package team.lala.timebank.web.commons;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.extern.slf4j.Slf4j;
import team.lala.timebank.entity.Member;
import team.lala.timebank.entity.MyCollection;
import team.lala.timebank.enums.MemberType;
import team.lala.timebank.enums.MyCollectionType;
import team.lala.timebank.enums.YesNo;
import team.lala.timebank.service.MemberService;
import team.lala.timebank.service.MyCollectionService;

@Slf4j
@Controller
@RequestMapping("/commons/organization")
public class OrganizationController {

	@Autowired
	private MemberService memberService;

	@Autowired
	private MyCollectionService myCollectionService;

	@RequestMapping("/list")
	public String listPage(Model model, @RequestParam(required = false,value = "Id") String Id) {
		if (!StringUtils.isEmpty(Id)) {
			model.addAttribute("Id", Id);
		}
		return "/basic/commons/organization_list";
	}

	@ResponseBody
	@RequestMapping("/query")
	public Page<Member> query(@RequestParam int page, @RequestParam int length, Principal principal) {
		List<Member> memberList = memberService.findByMemberType(MemberType.O);
		if (principal != null) {
			List<MyCollection> myCollections = myCollectionService
					.findByMyCollectionTypeAndMemberAccount(MyCollectionType.ORGANIZATION, principal.getName());
			// log.debug("myCollections={}",myCollections);

			for (Member member : memberList) {
				for (MyCollection myCollect : myCollections) {
					if (myCollect.getFavoriteObjectId() == member.getId()) {
						member.setIsCollected(YesNo.Y);
						log.debug("member={}", member);
					}
				}

			}
		}
		return memberService.findByMemberType(MemberType.O, PageRequest.of(page, length));
	}

}
