package team.lala.timebank.entity.inherit;

import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import team.lala.timebank.entity.Area;
import team.lala.timebank.entity.Member;
import team.lala.timebank.entity.OrgMember;
import team.lala.timebank.entity.Type;

@RestController
public class InheritTableMemberController {

	@Autowired
	private MemberInheritDao mInhDao;

	@Autowired
	private OrgMemberDao orgDao;
	
	@RequestMapping("/deleteMemberByInheriting") //成功
	public String deleteMemberByInheriting() {
		String result = "<html><h3>Find All Members By Inheriting tables</h3><p>";
		orgDao.deleteById(2l);
//		result += "</p></html>";
		return result;
	}

	@RequestMapping("/findMemberByInheriting") //成功
	public String findMemberByInheriting() {
		String result = "<html><h3>Find All Members By Inheriting tables</h3><p>";
		long begin = System.currentTimeMillis();
		Collection<MemberInherit> members = mInhDao.findAll();
		long end = System.currentTimeMillis();
		if (members != null) {
			for (MemberInherit m : members) {
				if (m instanceof OrgMemberInherit) {
					OrgMemberInherit orgMember = (OrgMemberInherit) m;
					result += "Id = " + orgMember.getId() + ", ";
					result += "LoginAccount = " + orgMember.getLoginAccount() + ", ";
					result += "Name = " + orgMember.getName() + ", ";
					result += "Type = " + orgMember.getType() + ", ";
					Area area = m.getArea();
					if (area != null) {
						result += "City = " + area.getCity()+ ", ";
					}
					result += "Founder = " + orgMember.getFounder() + ", ";
					result += "Ceo = " + orgMember.getCeo() + " ";
					result += "<br><br>";
				} else {
					result += "Id = " + m.getId() + ", ";
					result += "LoginAccount = " + m.getLoginAccount() + ", ";
					result += "Name = " + m.getName() + " ";
					result += "Type = " + m.getType() + ", ";
					Area area = m.getArea();
					if (area != null) {
						result += "City = " + area.getCity()+ ", ";
					}
					result += "<br><br>";
				}
				result += "member toString() = " + m.toString();
				result += "<hr>";
			}

		}
		result += "<h3>search time = " + (end - begin) + "</h3>";
		result += "</p></html>";
		return result;
	}
	


	@RequestMapping("/saveMemberByInheriting") // 失敗
	public String saveMemberByInheriting() {
		String result = "<html><h3>Save  Members By Inheriting tables</h3><p>";
		// 1
		// OrgMemberInherit orgMem = new OrgMemberInherit();
		// orgMem.setId(2L); //無效，且程式仍可正常運作
		// orgMem.setLoginAccount("JESE");
		// orgMem.setPassword("asdf");
		// orgMem.setEmail("CATHY@gmail.com");
		// orgMem.setType("O");
		// orgMem.setName("CATHY");
		// orgMem.setArea(3l);
		// orgMem.setCeo("Jim");
		// orgMem.setFounder("黃CATHY");
		// OrgMemberInherit orgMember = orgDao.save(orgMem);
		// result += "Id = " + orgMember.getId() + ", ";
		// result += "LoginAccount = " + orgMember.getLoginAccount() + ", ";
		// result += "Name = " + orgMember.getName() + ", ";
		// result += "Founder = " + orgMember.getFounder() + ", ";
		// result += "Ceo = " + orgMember.getCeo() + " ";
		// result += "<br>";

		// 2
		MemberInherit mem = new MemberInherit();
//		mem.setId(1L); //已存在id 無法存入
		mem.setLoginAccount("Loise");
		mem.setPassword("asdf");
		mem.setEmail("anchor@gmail.com");
		Type type = Type.P;
		mem.setType(type);
		mem.setName("anchor");
		// mem.setArea(2l);
		MemberInherit member = mInhDao.save(mem);
		result += "Id = " + member.getId() + ", ";
		result += "LoginAccount = " + member.getLoginAccount() + ", ";
		result += "Name = " + member.getName() + ", ";
		result += "<br>";

		result += "</p></html>";
		return result;
	}

}
