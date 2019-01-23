package team.lala.timebank.service;

import java.security.Principal;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import team.lala.timebank.dao.MemberDao;
import team.lala.timebank.dao.OrderDao;
import team.lala.timebank.dao.SystemMessageDao;
import team.lala.timebank.entity.Member;
import team.lala.timebank.entity.Mission;
import team.lala.timebank.entity.Order;
import team.lala.timebank.entity.SystemMessage;
import team.lala.timebank.enums.SystemMessageType;
import team.lala.timebank.enums.YesNo;

@Service
@Slf4j
public class SystemMessageService {

	@Autowired
	private SystemMessageDao systemMessageDao;
	@Autowired
	private MemberDao memberDao;
	@Autowired
	private OrderDao orderDao;

	public SystemMessage save(SystemMessage s) {
		SystemMessage serviceType = systemMessageDao.save(s);
		return serviceType;
	}

	public List<SystemMessage> findAll() {
		List<SystemMessage> serviceTypeList = systemMessageDao.findAll();
		return serviceTypeList;
	}

	public SystemMessage getOne(Long id) {
		SystemMessage serviceType = systemMessageDao.getOne(id);
		return serviceType;
	}

	public void deleteById(Long id) {
		systemMessageDao.deleteById(id);
	}

	// Jasmine
	public Page<SystemMessage> findByReadStatusAndMemberAccount(YesNo readStatus, Principal principal, Pageable Pageable) {
//		Member member = memberDao.findByAccount(principal.getName());
		Page<SystemMessage> systemMessages = systemMessageDao.findByReadStatusAndMemberAccount(readStatus, principal.getName(), Pageable);
		return systemMessages;
	};

	// Jasmine
	//查詢全部系統訊息
	public Page<SystemMessage> findAllByPageAndMemberAccount(Principal principal, Pageable Pageable) {
//		Member member = memberDao.findByAccount(principal.getName());
		Page<SystemMessage> systemMessages = systemMessageDao.findByMemberAccount(principal.getName(), Pageable);
		return systemMessages;
	};

	// Jasmine
	// 將所有訊息狀態變更為已讀
	public List<SystemMessage> readAllMessage(Principal principal) {
//		Member member = memberDao.findByAccount(principal.getName());
		List<SystemMessage> systemMessages = systemMessageDao.findByMemberAccount(principal.getName());
		for(SystemMessage s : systemMessages) {
			s.setReadStatus(YesNo.Y);
			systemMessageDao.save(s);
		}
		
		return systemMessages;
	}
	
	// Jasmine
	// 讀單筆系統訊息後，變更狀態為已讀
	public SystemMessage changeReadStatusAndGetSystemMessage(Long id) {
		SystemMessage systemMessage = systemMessageDao.getOne(id);
		systemMessage.setReadStatus(YesNo.Y);
		SystemMessage result = systemMessageDao.save(systemMessage);
		return result;
	}
	// Jasmine
	//計算未讀之訊息數量
	public int countNotReadMessages(Principal principal) {
//		Member member = memberDao.findByAccount(principal.getName());
		List<SystemMessage> systemMessages = systemMessageDao.findByReadStatusAndMemberAccount(YesNo.N, principal.getName());
		int count = systemMessages.size();
		return count;
	};

	// 通知志工申請已被接受
	public SystemMessage volunteerVerify(SystemMessage systemMessage, Order order) {
		if (systemMessage.getMessageType() == SystemMessageType.MissionAccecpt) {
			systemMessage.setSenderAccount(order.getMission().getMember().getAccount());
			systemMessage.setReleaseTime(new Date());
			systemMessage.setReadStatus(YesNo.N);
			systemMessage.setMemberAccount(order.getVolunteer().getAccount());
			systemMessage.setMessage("您申請的志工活動:[<a href='https://localhost/commons/domesticVolunteer/apply?missionId=" + order.getMission().getId() + "'>" + order.getMission().getTitle() + "</a>]已被接受");
			systemMessage.setMessageType(systemMessage.getMessageType());

			return systemMessageDao.save(systemMessage);
		} else {
			systemMessage.setSenderAccount(order.getMission().getMember().getAccount());
			systemMessage.setReleaseTime(new Date());
			systemMessage.setReadStatus(YesNo.N);
			systemMessage.setMemberAccount(order.getVolunteer().getAccount());
			systemMessage.setMessage("您申請的志工活動:[<a href='https://localhost/commons/domesticVolunteer/apply?missionId=" + order.getMission().getId() + "'>" + order.getMission().getTitle() + "</a>]已被拒絕");
			systemMessage.setMessageType(systemMessage.getMessageType());

			return systemMessageDao.save(systemMessage);
		}

	}
	
	//志工檢舉雇主，發送訊息告知
	public void reportMessage(Order order) {
		SystemMessage systemMessage = new SystemMessage();
		systemMessage.setMemberAccount(order.getVolunteer().getAccount());
		systemMessage.setSenderAccount(order.getMission().getMember().getAccount());
		systemMessage.setReleaseTime(new java.util.Date());
		systemMessage.setMessageType(SystemMessageType.Penalty);
		systemMessage.setMessage("你被檢舉了");
		systemMessage.setReadStatus(YesNo.N);
		systemMessageDao.save(systemMessage);
		
	}
	
	
	//志工對雇主評分後，發送系統訊息
	public void scoreMessage(Order order, Integer score) {
		SystemMessage systemMessage = new SystemMessage();
		systemMessage.setMemberAccount(order.getVolunteer().getAccount());
		systemMessage.setSenderAccount(order.getMission().getMember().getAccount());
		systemMessage.setReleaseTime(new java.util.Date());
		systemMessage.setMessageType(SystemMessageType.Score);
		systemMessage.setMessage("你在<a href='https://localhost/commons/domesticVolunteer/apply?missionId=" + order.getMission().getId() + "'>" + order.getMission().getTitle() + "</a>活動中獲得" + score + "分");
		systemMessage.setReadStatus(YesNo.N);
		systemMessageDao.save(systemMessage);
	}

	// 通知志工mission已被編輯
	public void missionEdit(List<Order> orders) {
		for (int i = 0; i < orders.size(); i++) {
			SystemMessage systemMessage = new SystemMessage();
			systemMessage.setSenderAccount(orders.get(i).getMission().getMember().getAccount());
			systemMessage.setReleaseTime(new Date());
			systemMessage.setReadStatus(YesNo.N);
			systemMessage.setMemberAccount(orders.get(i).getVolunteer().getAccount());
			systemMessage.setMessage("您申請的志工活動:[<a href='https://localhost/commons/domesticVolunteer/apply?missionId=" + orders.get(i).getMission().getId() + "'>" + orders.get(i).getMission().getTitle() + "</a>]活動資料已被變更，請再次確認內容並決定是否參加");
			systemMessage.setMessageType(SystemMessageType.MissionEdit);

			systemMessageDao.save(systemMessage);

		}
	}
	// 通知刊登者mission已到期
		public void missionFinish(Mission mission) {
			SystemMessage systemMessage = new SystemMessage();
			systemMessage.setSenderAccount(null);
			systemMessage.setReleaseTime(new Date());
			systemMessage.setReadStatus(YesNo.N);
			systemMessage.setMemberAccount(mission.getMember().getAccount());
			systemMessage.setMessage("您的志工活動:[<a href='https://localhost/commons/domesticVolunteer/apply?missionId="+mission.getId()+"'>" + mission.getTitle() + "</a>]已到期");
			systemMessage.setMessageType(SystemMessageType.MissionAccecpt);
			systemMessageDao.save(systemMessage);
		}
	// 通知刊登者mission已被取消
		public void missionCancel(Mission mission) {
			SystemMessage systemMessage = new SystemMessage();
			systemMessage.setSenderAccount(null);
			systemMessage.setReleaseTime(new Date());
			systemMessage.setReadStatus(YesNo.N);
			systemMessage.setMemberAccount(mission.getMember().getAccount());
			systemMessage.setMessage("您的志工活動:[<a href='https://localhost/commons/domesticVolunteer/apply?missionId="+ mission.getId() + "'>" + mission.getTitle() + "</a>]活動資料已被取消");
			systemMessage.setMessageType(SystemMessageType.MissionCancel);
			systemMessageDao.save(systemMessage);
		}
	
	// 通知志工mission已被取消
	public void missionCancel(List<Order> orders) {
		if(orders == null) {

		}else {
		for (int i = 0; i < orders.size(); i++) {
			SystemMessage systemMessage = new SystemMessage();
			systemMessage.setSenderAccount(orders.get(i).getMission().getMember().getAccount());
			systemMessage.setReleaseTime(new Date());
			systemMessage.setReadStatus(YesNo.N);
			systemMessage.setMemberAccount(orders.get(i).getVolunteer().getAccount());
			systemMessage.setMessage("您申請的志工活動:[<a href='https://localhost/commons/domesticVolunteer/apply?missionId=" + orders.get(i).getMission().getId() + "'>" + orders.get(i).getMission().getTitle() + "</a>]活動資料已被取消");
			systemMessage.setMessageType(SystemMessageType.MissionEdit);

			systemMessageDao.save(systemMessage);

		}}
	}
	
	//產生付款後收到的訊息
	public void pay(Member payer,Member volunteer,Integer hours, Mission mission) {
		SystemMessage pay = new SystemMessage();
		pay.setSenderAccount(payer.getAccount());
		pay.setReleaseTime(new Date());
		pay.setReadStatus(YesNo.N);
		pay.setMemberAccount(payer.getAccount());
		pay.setMessage("您因為志工活動:[<a href='https://localhost/commons/domesticVolunteer/apply?missionId="+ mission.getId() + "'>" + mission.getTitle() + "</a>]付款給:["
				+ "<a href='/commons/personal-info/list?memberId="+volunteer.getId()+ "'>" + volunteer.getName() + "</a>]共" + hours + "小時已成功");
		pay.setMessageType(SystemMessageType.PayTimeValue);
		systemMessageDao.save(pay);
	}
	//產生入賬後收到的訊息
	public void earn(Member payer,Member volunteer,Integer hours,Mission mission) {
		SystemMessage earn = new SystemMessage();
		earn.setSenderAccount(payer.getAccount());
		earn.setReleaseTime(new Date());
		earn.setReadStatus(YesNo.N);
		earn.setMemberAccount(volunteer.getAccount());
		earn.setMessage("您參加志工活動:[<a href='https://localhost/commons/domesticVolunteer/apply?missionId="+ mission.getId() +"'>" + mission.getTitle() + "</a>]獲得" + hours + "小時已入帳");
		earn.setMessageType(SystemMessageType.PayTimeValue);
		systemMessageDao.save(earn);
	}
	
	public void finishMission(Member payer,Mission mission) {
		SystemMessage finishMessage = new SystemMessage();
		finishMessage.setReleaseTime(new Date());
		finishMessage.setReadStatus(YesNo.N);
		finishMessage.setMemberAccount(payer.getAccount());
		finishMessage.setMessage("您刊登的志工活動:[<a href='https://localhost/commons/domesticVolunteer/apply?missionId=" + mission.getId() + "'>" + mission.getTitle() + "</a>]已結案");
		finishMessage.setMessageType(SystemMessageType.MissionFinish);
		systemMessageDao.save(finishMessage);
	}
	
	public void requesterReportVolunteer(Long orderId) {
		SystemMessage systemMessage = new SystemMessage();
		
		systemMessage.setSenderAccount(memberDao.getOne(6L).getAccount());
		systemMessage.setReleaseTime(new Date());
		systemMessage.setReadStatus(YesNo.N);
		systemMessage.setMemberAccount(orderDao.getOne(orderId).getMission().getMember().getAccount());
		systemMessage.setMessage("您已檢舉志工:[<a href='https://localhost/commons/personal-info/list?memberId="+ orderDao.getOne(orderId).getVolunteer().getId() +"'>" + orderDao.getOne(orderId).getVolunteer().getName() + "</a>]");
		systemMessage.setMessageType(SystemMessageType.Report);
		systemMessageDao.save(systemMessage);
		
	}
	


}
