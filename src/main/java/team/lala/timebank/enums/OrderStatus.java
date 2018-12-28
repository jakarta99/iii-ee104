package team.lala.timebank.enums;

public enum OrderStatus {
	VolunteerApply,			//志工已申請
	RequesterAcceptService,
	
	RequesterRefuceServiceMatchFail,
	RequesterCancleTransactionMatchFail,  	//交易取消(Requester取消交易)(系統取消交易)
	VolunteerCancleTransactionMatchFail,			//交易取消(志工 取消交易)(系統取消交易)
	
	ServiceFinishNotPay,		//服務完未發時數
	
	ServiceFinishPayMatchSuccess,
	RequesterCancleActivityNoPunishMatchSuccess,		//Requester臨時取消活動(不懲罰)(手動取消 )
	RequesterCancleActivityPunishMatchSuccess,		//Requester臨時取消活動(要懲罰)(手動取消 )
	VolunteerCancleActivityNoPunishMatchSuccess,		//志工臨時請假(不懲罰)(手動取消交易)
	VolunteerCancleActivityPunishMatchSuccess;		//志工臨時不去(要懲罰)(手動取消交易)
}
