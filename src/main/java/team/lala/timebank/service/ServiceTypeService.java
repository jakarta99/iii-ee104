package team.lala.timebank.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;

import team.lala.timebank.dao.ServiceTypeDao;
import team.lala.timebank.entity.Area;
import team.lala.timebank.entity.ServiceType;

@Service
public class ServiceTypeService {

	@Autowired
	private ServiceTypeDao serviceTypeDao;

	public ServiceType save(ServiceType s) {
		ServiceType serviceType = serviceTypeDao.save(s);
		return serviceType;
	}
	
	public List<ServiceType> findAll(){
		List<ServiceType> serviceTypeList = serviceTypeDao.findAll();
		return serviceTypeList;
	}
	
	public ServiceType getOne(Long id) {
		ServiceType serviceType = serviceTypeDao.getOne(id);
		return serviceType;
	}

	public void deleteById(Long id) {
		serviceTypeDao.deleteById(id);
	}

}
