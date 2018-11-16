package team.lala.timebank.web;

import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import team.lala.timebank.entity.Area;
import team.lala.timebank.entity.Member;
import team.lala.timebank.entity.OrgMember;
import team.lala.timebank.entity.Type;
import team.lala.timebank.entity.inherit.OrgMemberInherit;
import team.lala.timebank.service.AreaService;
import team.lala.timebank.service.MemberService;

@RestController
public class JoinTableMemberController {

	String account = "sheila";
	String password = "asdf";

	@Autowired
	private MemberService memberService;
	
	@Autowired
	private AreaService areaService;
	private Long memberId = 4l;
	
	@RequestMapping("/deleteMemberByJoining") //成功
	public String deleteMemberByJoining() {
		String result = "<html><h3>Find All Members By Inheriting tables</h3><p>";
		memberService.deleteById(memberId);
//		result += "</p></html>";
		return result;
	}

	// findAllMember，並印出 member的結果 (join tables : area & orgMember ) 
	@RequestMapping("/findMemberByJoining") //成功
	public String findMemberByJoining() {
		String result = "<html><h3>Find All Members By Joining tables</h3><p>";
		long begin = System.currentTimeMillis();	
		Collection<Member> members = memberService.findAll();
		long end = System.currentTimeMillis();
		if (members != null) {
			for (Member m : members) {
				result += "Id = " + m.getId()+", ";
				result += "LoginAccount =" + m.getLoginAccount()+", ";
				result +=  "Name = " + m.getName()+", ";
				result += "Type = " + m.getType() + ", ";
				Area area = m.getArea();
				if (area != null) {
					result+= "City = " + area.getCity()+ ", ";
				}
				OrgMember orgMember = m.getOrgMember();
				if (orgMember!= null) {
					result+=  "Founder = " + orgMember.getFounder()+", ";
					result+=  "Ceo = " + orgMember.getCeo()+", ";	
				}
				
				result += "<br><br>";
				result+=  "member toString() = " +m.toString() +"<br>";
				result+= "<hr>";
			}
		}
		result += "<h3>search time = " + (end - begin) +"</h3>"; 
		result += "</p></html>";
		return result;
	}
	
	@RequestMapping("/updateMemberByJoining") //update成功
	public String updateMemberByJoining() {
		String result = "<html><h3>Save(update) Members By Joining tables</h3><p>";
		Member mem = new Member();//設id >update
		mem.setId(memberId); 
		mem.setLoginAccount("Sam");
		mem.setPassword("asdf");
		mem.setEmail("anchor@gmail.com");	
		mem.setType("P");
		mem.setName("anchor");

		OrgMember orgMem = new OrgMember();
		orgMem.setCeo("Jim");
		orgMem.setFounder("黃CATHY");
		
		mem.setOrgMember(orgMem);
		orgMem.setMember(mem);
		// mem.setArea(2l);
		Member member = memberService.save(mem);		
	
		result += "Id = " + member.getId() + ", ";
		result += "LoginAccount = " + member.getLoginAccount() + ", ";
		result += "Name = " + member.getName() + ", ";
		result += "Founder = " + member.getOrgMember().getFounder() + ", ";
		result += "Ceo = " + member.getOrgMember().getCeo() + " ";
		result += "<br>";
		
		result += "</p></html>";
		return result; 
	}
	
	@RequestMapping("/insertMemberByJoining") //insert成功
	public String insertMemberByInheriting() {
		String result = "<html><h3>Save(insert)  Members By Joining tables</h3><p>";	
		Member mem = new Member(); //不設id >insert
		mem.setLoginAccount("Bruse");
		mem.setPassword("asdf");
		mem.setEmail("Bruse@gmail.com");	
		mem.setType("P");
		mem.setName("Bruse");

		OrgMember orgMem = new OrgMember();
		orgMem.setCeo("anchor");
		orgMem.setFounder("黃CATHY");
		
		mem.setOrgMember(orgMem);
		orgMem.setMember(mem);
		// mem.setArea(2l);
		Member member = memberService.save(mem);		
	
		result += "Id = " + member.getId() + ", ";
		result += "LoginAccount = " + member.getLoginAccount() + ", ";
		result += "Name = " + member.getName() + ", ";
		result += "Founder = " + member.getOrgMember().getFounder() + ", ";
		result += "Ceo = " + member.getOrgMember().getCeo() + " ";
		result += "<br>";
		
		result += "</p></html>";
		return result; 
	}
	
	
	

}
