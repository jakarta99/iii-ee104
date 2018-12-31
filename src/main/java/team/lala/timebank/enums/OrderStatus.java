package team.lala.timebank.enums;

public enum OrderStatus {
	VolunteerApply,							//志工已申請
	RequesterAcceptService, 				//requester 接受服務
	
	RequesterRefuceServiceMatchFail,		//requester 拒絕服務
	RequesterCancleTransactionMatchFail,  	//交易取消(Requester取消交易)(系統取消交易)
	VolunteerCancleTransactionMatchFail,	//交易取消(志工 取消交易)(系統取消交易)
	
	ServiceFinishNotPay,					//服務完未發時數
	
	ServiceFinishPayMatchSuccess,					//服務完，已發時數
	RequesterCancleActivityNoPunishMatchSuccess,	//Requester臨時取消活動(不懲罰)(手動取消 )
	RequesterCancleActivityPunishMatchSuccess,		//Requester臨時取消活動(要懲罰)(手動取消 )
	VolunteerCancleActivityNoPunishMatchSuccess,	//志工臨時請假(不懲罰)(手動取消交易)
	VolunteerCancleActivityPunishMatchSuccess;		//志工臨時不去(要懲罰)(手動取消交易)
//	ServiceFinishPayAndScoreMatchSuccess			服務完，已發時數，以評分完
//	VolunteerReportRequestMatchSuccess				志工檢舉雇主，處理中
}
