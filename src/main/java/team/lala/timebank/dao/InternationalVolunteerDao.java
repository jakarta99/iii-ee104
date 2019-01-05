package team.lala.timebank.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

import team.lala.timebank.entity.InternationalVolunteer;


public interface InternationalVolunteerDao extends JpaRepository<InternationalVolunteer,Long>, JpaSpecificationExecutor<InternationalVolunteer>{


}
