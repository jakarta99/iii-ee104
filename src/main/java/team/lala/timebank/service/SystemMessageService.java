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
	public Page<SystemMessage> findAllByPageAndMember(Principal principal, Pageable Pageable) {
		Member member = memberDao.findByAccount(principal.getName());
		Page<SystemMessage> systemMessages = systemMessageDao.findByMember(member, Pageable);
		return systemMessages;
	};

	// Jasmine
	// 讀系統訊息後，變更狀態為已讀
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
}
