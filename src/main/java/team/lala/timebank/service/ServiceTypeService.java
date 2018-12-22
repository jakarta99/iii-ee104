package team.lala.timebank.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;

import team.lala.timebank.dao.ServiceTypeDao;
import team.lala.timebank.entity.ServiceType;

@Service
public class ServiceTypeService {

	@Autowired
	private ServiceTypeDao serviceTypeDao;

	public List<ServiceType> findBySpecification(Specification<ServiceType> specification) {
		return serviceTypeDao.findAll(specification);

	}

	public Page<ServiceType> findBySpecification(Specification<ServiceType> specification, PageRequest pageRequest) {
		return serviceTypeDao.findAll(specification, pageRequest);

	}

}
