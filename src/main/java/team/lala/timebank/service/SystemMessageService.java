package team.lala.timebank.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import team.lala.timebank.dao.SystemMessageDao;
import team.lala.timebank.entity.ServiceType;
import team.lala.timebank.entity.SystemMessage;

@Service
public class SystemMessageService {

	@Autowired
	private SystemMessageDao SystemMessageDao;

	public SystemMessage save(SystemMessage s) {
		SystemMessage serviceType = SystemMessageDao.save(s);
		return serviceType;
	}
	
	public List<SystemMessage> findAll(){
		List<SystemMessage> serviceTypeList = SystemMessageDao.findAll();
		return serviceTypeList;
	}
	
	public SystemMessage getOne(Long id) {
		SystemMessage serviceType = SystemMessageDao.getOne(id);
		return serviceType;
	}

	public void deleteById(Long id) {
		SystemMessageDao.deleteById(id);
	}

}
