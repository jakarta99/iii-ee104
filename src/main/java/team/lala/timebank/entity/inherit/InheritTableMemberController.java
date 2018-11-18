package team.lala.timebank.entity.inherit;

import java.util.Collection;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import team.lala.timebank.entity.Area;
import team.lala.timebank.entity.Type;

//使用inheritence建立member與orgMember關係的新刪修查
@RestController
public class InheritTableMemberController {

	@Autowired
	private MemberInheritService inheritService;

	@Autowired
	private OrgMemberDao orgDao;

	private Long memberId = 10l;

	// 根據id刪除個人或組織會員的資料
	@RequestMapping("/deleteMemberByInheriting")
	public String deleteMemberByInheriting() {
		String result = "<html><h3>Delete Member By Inheriting tables</h3><p>";
		inheritService.deleteById(memberId);
		result += "Deleted id : " + memberId;
		result += "</p></html>";
		return result;
	} 
	//結果: 若會員為組織會員，則會員在member表及orgMember表的資料都會被刪除
	//	若id不存在會出現錯誤

	// 根據id查詢個人或組織會員的資料
	@RequestMapping("/findByIdMemberByInheriting")
	public String findByIdMemberByInheriting() {
		String result = "<html><h3>Find One Member By Inheriting tables</h3><p>";
		//補充:使用findById，而非getOne的原因: 
		//使用getOne，若id不存在會出現錯誤，且getOne的回傳物件無法判定是否為子類別(instanceOf無法判定)，需針對子類別再做查詢動作(orgDao.getOne(id))才可獲得子類別物件
		MemberInherit member = inheritService.findById(memberId); 
		if (member != null) {
			// 判斷是否為orgMember類別
			if (member instanceof OrgMemberInherit) {
				// 進行OrgMember類別的型態轉換
				OrgMemberInherit orgMember = (OrgMemberInherit) member;
				result += orgMember.toString();
				result += "<br><br>";
			} else {
				result += member.toString();
				result += "<br><br>";
			}
		} else {
			result += "無查詢結果";
		}
		result += "</p></html>";
		return result;

	}

	// 查詢Member表中所有個人及組織會員的資料
	@RequestMapping("/findAllMemberByInheriting")
	public String findAllMemberByInheriting() {
		String result = "<html><h3>Find All Members By Inheriting tables</h3><p>";
		Collection<MemberInherit> members = inheritService.findAll();
		if (members != null) {
			for (MemberInherit m : members) {
				// 判斷是否為orgMember類別
				if (m instanceof OrgMemberInherit) {
					// 進行OrgMember類別的型態轉換
					OrgMemberInherit orgMember = (OrgMemberInherit) m;
					result += orgMember.toString();
					result += "<br><br>";
				} else {
					result += m.toString();
					result += "<br><br>";
				}
				result += "<hr>";
			}

		}
		result += "</p></html>";
		return result;
	}

	// update會員資料: 先辨別id是否存在，再進行save
	@RequestMapping("/updateMemberByInheriting")
	public String updateMemberByInheriting() {
		String result = "<html><h3>Update Member By Inheriting tables</h3><p>";
		MemberInherit m = inheritService.findById(memberId); // 查詢id是否存在
		if (m != null) { // DB有此id的資料
			// 判斷是否為orgMember類別
			if (m instanceof OrgMemberInherit) { // orgMember類別
				// 進行OrgMember類別的型態轉換
				OrgMemberInherit orgMember = (OrgMemberInherit) m;
				// 設定其要改變的欄位屬性
				orgMember.setLoginAccount("Tom");
				orgMember.setName("Tom");
				orgMember.setCeo("Jim");
				orgMember.setFounder("Jack");
				orgMember = orgDao.save(orgMember); // 使用OrgMember的service進行save
				result += orgMember.toString(); // 更新結果
			} else { // Member類別
				// 設定其要改變的欄位屬性
				m.setLoginAccount("Frank");
				m.setPassword("asdf");
				m.setName("Frank");
				m = inheritService.save(m); // 使用Member的service進行save
				result += m.toString(); // 更新結果
			}
		} else { // DB無此id的資料
			result += "id不存在，無法變更資料";
		}

		result += "</p></html>";
		return result;
	}

	// insert組織會員資料(不須設定id)
	@RequestMapping("/insertOrgMemberByInheriting")
	public String insertOrgMemberByInheriting() {
		String result = "<html><h3>Insert OrgMember By Inheriting tables</h3><p>";
		// 組織會員的類別為OrgMember，type屬性為Type.O
		OrgMemberInherit orgMem = new OrgMemberInherit();
		orgMem.setType(Type.O);
		// 設定欄位(不設定則預設為null)
		orgMem.setLoginAccount("Sam");
		orgMem.setPassword("asdfasdf");
		orgMem.setEmail("anchor@gmail.com");
		orgMem.setName("anchor");
		// mem.setArea(2l);
		// 設定orgMember才有的欄位
		orgMem.setCeo("Jim");
		orgMem.setFounder("黃CATHY");
		orgMem = orgDao.save(orgMem);

		result += orgMem.toString(); // 新增結果
		result += "<br>";
		result += "</p></html>";
		return result;
	}

	// insert個人會員資料(不須設定id)
	@RequestMapping("/insertMemberByInheriting")
	public String insertMemberByInheriting() {
		String result = "<html><h3>Insert Member By Inheriting tables</h3><p>";
		// 個人會員的類別為Member，type屬性為Type.P
		MemberInherit mem = new MemberInherit();
		mem.setType(Type.P);
		// 設定欄位屬性(不設定則預設為null)
		mem.setLoginAccount("Sean");
		mem.setPassword("asdfasdf");
		mem.setEmail("Sean@gmail.com");
		mem.setName("Sean");
		// mem.setArea(2l);
		mem = inheritService.save(mem);

		result += mem.toString(); // 新增結果
		result += "<br>";
		result += "</p></html>";
		return result;
	}

}
