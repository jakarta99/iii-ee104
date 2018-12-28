package team.lala.timebank.enums;

public enum MissionStatus {
	A_New, // 新的mission 可審核志工 可取消mission
	A_VolunteerApproved, // 未到deadline 所有志工審核完畢 (審核志工按鈕消失)
	B_AccountsPayable, // 活動當天到發$之前 可發錢 出現發$按鈕
	C_Finish, // 發完$
	C_Cancel,// mission取消 reject orders(審核志工按鈕消失)

}
