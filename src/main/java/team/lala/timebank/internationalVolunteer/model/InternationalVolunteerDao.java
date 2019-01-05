package team.lala.timebank.internationalVolunteer.model;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;


public interface InternationalVolunteerDao extends JpaRepository<InternationalVolunteer,Long>, JpaSpecificationExecutor<InternationalVolunteer>{


}
