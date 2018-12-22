package team.lala.timebank.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import team.lala.timebank.entity.ServiceType;

public interface ServiceTypeDao extends JpaRepository<ServiceType, Long>, JpaSpecificationExecutor<ServiceType> {

}
