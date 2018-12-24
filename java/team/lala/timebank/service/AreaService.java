package team.lala.timebank.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import team.lala.timebank.dao.AreaDao;
import team.lala.timebank.entity.Area;

@Service
public class AreaService {
	
	@Autowired
	private AreaDao areaDao;
	
	
	public Area save(Area a) {
		Area area = areaDao.save(a);
		return area;
	}
	
	public List<Area> findAll(){
		List<Area> aList = areaDao.findAll();
		return aList;
	}
	
	public Area getOne(Long id) {
		Area area = areaDao.getOne(id);
		return area;
	}

	public void deleteById(Long id) {
		areaDao.deleteById(id);
	}
}
