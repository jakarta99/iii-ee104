package team.lala.timebank.enums;

public enum ReportStatus {
	Null,
	VolunteerReportRequester,				//志工檢舉雇主，處理中
	RequesterReportVolunteer,				//雇主檢舉志工，處理中
	BothReport,								//直接到finish，不會再有申訴
	TemporarilyEnd,							//做出單方結果，寄系統信給對方，對方可提申訴
	Finish;									//志工檢舉雇主，處理中
}