package team.lala.timebank.internationalVolunteer.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class InternationalVolunteerService {
	@Autowired
	private InternationalVolunteerDao internationalVolunteerDao;
	
	public List<InternationalVolunteer> findAll(){
		return internationalVolunteerDao.findAll();
	}
	
	public List<InternationalVolunteer> findBySpecification(Specification<InternationalVolunteer> spec){		
		return internationalVolunteerDao.findAll(spec);
	}
	
	public InternationalVolunteer insert(InternationalVolunteer internationalVolunteer) {
		return internationalVolunteerDao.save(internationalVolunteer);
	}
	
	public void deleteAll() {
		internationalVolunteerDao.deleteAll();
	}

	
}
