package team.lala.timebank.enums;

public enum ReportStatus {
	Null,
	VolunteerReportRequester,				//志工檢舉雇主，處理中
	RequesterReportVolunteer,				//雇主檢舉志工，處理中
	BothReport,								//互相檢舉
	
	TemporarilyEnd,							//審核確定要懲罰，則寄系統信，對方可提申訴
	Finish;									//審核後不懲罰，或申訴後不懲罰
}