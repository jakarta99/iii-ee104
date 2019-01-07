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
import team.lala.timebank.dao.SystemMessageDao;
import team.lala.timebank.entity.Member;
import team.lala.timebank.entity.Order;
import team.lala.timebank.entity.SystemMessage;
import team.lala.timebank.enums.SystemMessageType;
import team.lala.timebank.enums.YesNo;
import team.lala.timebank.web.user.SystemMessageController;

@Service
@Slf4j
public class SystemMessageService {

	@Autowired
	private SystemMessageDao systemMessageDao;
	@Autowired
	private MemberDao memberDao;

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
	public Page<SystemMessage> findByReadStatusAndMember(YesNo readStatus, Principal principal, Pageable Pageable) {
		Member member = memberDao.findByAccount(principal.getName());
		Page<SystemMessage> systemMessages = systemMessageDao.findByReadStatusAndMember(readStatus, member, Pageable);
		return systemMessages;
	};

	// Jasmine
	//查詢全部系統訊息
	public Page<SystemMessage> findAllByPageAndMember(Principal principal, Pageable Pageable) {
		Member member = memberDao.findByAccount(principal.getName());
		Page<SystemMessage> systemMessages = systemMessageDao.findByMember(member, Pageable);
		return systemMessages;
	};

	// Jasmine
	// 將所有訊息狀態變更為已讀
	public List<SystemMessage> readAllMessage(Principal principal) {
		Member member = memberDao.findByAccount(principal.getName());
		List<SystemMessage> systemMessages = systemMessageDao.findByMember(member);
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
		Member member = memberDao.findByAccount(principal.getName());
		List<SystemMessage> systemMessages = systemMessageDao.findByReadStatusAndMember(YesNo.N, member);
		int count = systemMessages.size();
		return count;
	};

	// 通知志工申請已被接受
	public SystemMessage volunteerVerify(SystemMessage systemMessage, Order order) {
		if (systemMessage.getMessageType() == SystemMessageType.MissionAccecpt) {
			systemMessage.setSender(order.getMission().getMember());
			systemMessage.setReleaseTime(new Date());
			systemMessage.setReadStatus(YesNo.N);
			systemMessage.setMember(order.getVolunteer());
			systemMessage.setMessage("您申請的志工活動:[" + order.getMission().getTitle() + "]已被接受");
			systemMessage.setMessageType(systemMessage.getMessageType());

			return systemMessageDao.save(systemMessage);
		} else {
			systemMessage.setSender(order.getMission().getMember());
			systemMessage.setReleaseTime(new Date());
			systemMessage.setReadStatus(YesNo.N);
			systemMessage.setMember(order.getVolunteer());
			systemMessage.setMessage("您申請的志工活動:[" + order.getMission().getTitle() + "]已被拒絕");
			systemMessage.setMessageType(systemMessage.getMessageType());

			return systemMessageDao.save(systemMessage);
		}

	}

	// 通知志工mission已被編輯
	public void missionEdit(List<Order> orders) {
		for (int i = 0; i < orders.size(); i++) {
			SystemMessage systemMessage = new SystemMessage();
			systemMessage.setSender(orders.get(i).getMission().getMember());
			systemMessage.setReleaseTime(new Date());
			systemMessage.setReadStatus(YesNo.N);
			systemMessage.setMember(orders.get(i).getVolunteer());
			systemMessage.setMessage("您申請的志工活動:[" + orders.get(i).getMission().getTitle() + "]活動資料已被變更，請再次確認內容並決定是否參加");
			systemMessage.setMessageType(SystemMessageType.MissionEdit);

			systemMessageDao.save(systemMessage);

		}
	}

	// 通知志工mission已被取消
	public void missionCancel(List<Order> orders) {
		for (int i = 0; i < orders.size(); i++) {
			SystemMessage systemMessage = new SystemMessage();
			systemMessage.setSender(orders.get(i).getMission().getMember());
			systemMessage.setReleaseTime(new Date());
			systemMessage.setReadStatus(YesNo.N);
			systemMessage.setMember(orders.get(i).getVolunteer());
			systemMessage.setMessage("您申請的志工活動:[" + orders.get(i).getMission().getTitle() + "]活動資料已被取消");
			systemMessage.setMessageType(SystemMessageType.MissionEdit);

			systemMessageDao.save(systemMessage);

		}
	}
	
	//產生付款後收到的訊息
	public void pay(Member payer,Member volunteer,Integer hours,String missionTitle) {
		SystemMessage pay = new SystemMessage();
		pay.setSender(payer);
		pay.setReleaseTime(new Date());
		pay.setReadStatus(YesNo.N);
		pay.setMember(payer);
		pay.setMessage("您因為志工活動:[" + missionTitle + "]付款給:["
				+ volunteer.getName() + "]共" + hours + "小時已成功");
		pay.setMessageType(SystemMessageType.PayTimeValue);
		systemMessageDao.save(pay);
	}
	//產生入賬後收到的訊息
	public void earn(Member payer,Member volunteer,Integer hours,String missionTitle) {
		SystemMessage earn = new SystemMessage();
		earn.setSender(payer);
		earn.setReleaseTime(new Date());
		earn.setReadStatus(YesNo.N);
		earn.setMember(volunteer);
		earn.setMessage("您參加志工活動:[" + missionTitle + "]獲得" + hours + "小時已入帳");
		earn.setMessageType(SystemMessageType.PayTimeValue);
		systemMessageDao.save(earn);
	}
	
	public void finishMission(Member payer,String missionTitle) {
		SystemMessage finishMessage = new SystemMessage();
		finishMessage.setReleaseTime(new Date());
		finishMessage.setReadStatus(YesNo.N);
		finishMessage.setMember(payer);
		finishMessage.setMessage("您刊登的志工活動:[" + missionTitle + "]已結案");
		finishMessage.setMessageType(SystemMessageType.MissionFinish);
		systemMessageDao.save(finishMessage);
	}
	


}
