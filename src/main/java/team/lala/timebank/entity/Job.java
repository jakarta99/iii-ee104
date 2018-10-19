package team.lala.timebank.entity;

import java.time.LocalDateTime;

public class Job {
	private long jobId;//工作ID

	private String requester; // 刊登者

	private LocalDateTime postedDay;// po文&徵人日期

	private LocalDateTime postedEndDay;// 徵人結束文日期

	private LocalDateTime jobStartDay;// 工作開始日期

	private LocalDateTime jobEndDay;// 工作結束日期

	private String jobLocation;// 工作地點

	private String serviceType;// 服務類別

	private String contactPerson;// 聯絡人

	private String contactTel;// 聯絡電話

	private String contactEmail;// 聯絡信箱
	
	

}
