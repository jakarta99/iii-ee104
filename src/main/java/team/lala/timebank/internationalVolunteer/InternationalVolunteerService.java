package team.lala.timebank.internationalVolunteer;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class InternationalVolunteerService {
	@Autowired
	private InternationalVolunteerDao internationalVolunteerDao;
	
	public List<InternationalVolunteer> findAll(){
		return internationalVolunteerDao.findAll();
	}
	
	public InternationalVolunteer insert(InternationalVolunteer internationalVolunteer) {
		return internationalVolunteerDao.save(internationalVolunteer);
	}

	
}
