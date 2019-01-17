package team.lala.timebank.web.user;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.extern.slf4j.Slf4j;
import team.lala.timebank.commons.ajax.AjaxResponse;
import team.lala.timebank.entity.MyCollection;
import team.lala.timebank.enums.MyCollectionType;
import team.lala.timebank.service.MemberService;
import team.lala.timebank.service.MyCollectionService;

@Slf4j
@Controller
@RequestMapping("/user/myCollection")
public class MyCollectionController {

	@Autowired
	public MyCollectionService myCollectionService;

	@Autowired
	public MemberService memberService;

	@RequestMapping("/insertMission")
	@ResponseBody
	public AjaxResponse<MyCollection> insertMission(Principal principal, @RequestParam("id") Long missionId) {

		AjaxResponse<MyCollection> response = new AjaxResponse<MyCollection>();
		try {
			if(myCollectionService.findByMyCollectionTypeAndMemberAccount(MyCollectionType.MISSION, principal, missionId)==null) {
			myCollectionService.insert(MyCollectionType.MISSION, missionId, principal);
			}
		} catch (Exception e) {
			e.printStackTrace();
			response.addMessage("加入最愛失敗");
		}
		return response;
	}

	@RequestMapping("/cancelMission")
	@ResponseBody
	public AjaxResponse<MyCollection> cancelMission(Principal principal, @RequestParam("id") Long missionId) {

		AjaxResponse<MyCollection> response = new AjaxResponse<MyCollection>();
		try {

			myCollectionService.deleteByMemberAndMyCollectionType(MyCollectionType.MISSION, missionId, principal);
		} catch (Exception e) {
			e.printStackTrace();
			response.addMessage("移除最愛失敗");
		}
		return response;
	}
	
	@RequestMapping("/insertOrganization")
	@ResponseBody
	public AjaxResponse<MyCollection> insertOrganization(Principal principal, @RequestParam("id") Long memberId) {

		AjaxResponse<MyCollection> response = new AjaxResponse<MyCollection>();
		try {
			if(myCollectionService.findByMyCollectionTypeAndMemberAccount(MyCollectionType.ORGANIZATION, principal, memberId)==null) {
			myCollectionService.insert(MyCollectionType.ORGANIZATION, memberId, principal);
			}
		} catch (Exception e) {
			e.printStackTrace();
			response.addMessage("加入最愛失敗");
		}
		return response;
	}

	@RequestMapping("/cancelOrganization")
	@ResponseBody
	public AjaxResponse<MyCollection> cancelOrganization(Principal principal, @RequestParam("id") Long memberId) {

		AjaxResponse<MyCollection> response = new AjaxResponse<MyCollection>();
		try {

			myCollectionService.deleteByMemberAndMyCollectionType(MyCollectionType.ORGANIZATION, memberId, principal);
		} catch (Exception e) {
			e.printStackTrace();
			response.addMessage("移除最愛失敗");
		}
		return response;
	}
	
	@RequestMapping("/insertInternationalVolunteer")
	@ResponseBody
	public AjaxResponse<MyCollection> insertInternationalVolunteer(Principal principal, @RequestParam("id") Long internationalVolunteerId) {

		AjaxResponse<MyCollection> response = new AjaxResponse<MyCollection>();
		try {
			if(myCollectionService.findByMyCollectionTypeAndMemberAccount(MyCollectionType.INTERNATIONALVOLUNTEER, principal, internationalVolunteerId)==null) {
			myCollectionService.insert(MyCollectionType.INTERNATIONALVOLUNTEER, internationalVolunteerId, principal);
			}
		} catch (Exception e) {
			e.printStackTrace();
			response.addMessage("加入最愛失敗");
		}
		return response;
	}

	@RequestMapping("/cancelInternationalVolunteer")
	@ResponseBody
	public AjaxResponse<MyCollection> cancelInternationalVolunteer(Principal principal, @RequestParam("id") Long internationalVolunteerId) {

		AjaxResponse<MyCollection> response = new AjaxResponse<MyCollection>();
		try {

			myCollectionService.deleteByMemberAndMyCollectionType(MyCollectionType.INTERNATIONALVOLUNTEER, internationalVolunteerId, principal);
		} catch (Exception e) {
			e.printStackTrace();
			response.addMessage("移除最愛失敗");
		}
		return response;
	}
}
