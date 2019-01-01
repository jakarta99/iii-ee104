package team.lala.timebank.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import team.lala.timebank.dao.MemberDao;
import team.lala.timebank.dao.SystemMessageDao;
import team.lala.timebank.entity.ServiceType;
import team.lala.timebank.entity.SystemMessage;
import team.lala.timebank.enums.SystemMessageType;
import team.lala.timebank.enums.YesNo;

@Service
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

	// 通知志工申請已被接受
	public SystemMessage volunteerVerify(SystemMessage systemMessage, Long memberId, String title) {
		
		if (systemMessage.getMessageType() == SystemMessageType.MissionAccecpt) {
			systemMessage.setSender(null);
			systemMessage.setReleaseTime(new Date());
			systemMessage.setReadStatus(YesNo.N);
			systemMessage.setMember(memberDao.getOne(memberId));
			systemMessage.setMessage("您申請的志工活動:[" + title + "]已被接受");
			systemMessage.setMessageType(systemMessage.getMessageType());

			return systemMessageDao.save(systemMessage);
		} else {
			systemMessage.setSender(null);
			systemMessage.setReleaseTime(new Date());
			systemMessage.setReadStatus(YesNo.N);
			systemMessage.setMember(memberDao.getOne(memberId));
			systemMessage.setMessage("您申請的志工活動:[" + title + "]已被拒絕");
			systemMessage.setMessageType(systemMessage.getMessageType());

			return systemMessageDao.save(systemMessage);
		}

	}

}
