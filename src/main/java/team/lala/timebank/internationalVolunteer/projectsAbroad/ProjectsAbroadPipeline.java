package team.lala.timebank.internationalVolunteer.projectsAbroad;

import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import lombok.extern.slf4j.Slf4j;
import team.lala.timebank.commons.ContinentDistributor;
import team.lala.timebank.entity.InternationalVolunteer;
import team.lala.timebank.service.InternationalVolunteerService;
import us.codecraft.webmagic.ResultItems;
import us.codecraft.webmagic.pipeline.Pipeline;

//Pipeline負責結果的處理，包括計算、持久化到文件、資料庫等
@Slf4j
@Component 
@Transactional
public class ProjectsAbroadPipeline implements Pipeline {

	@Autowired
	private InternationalVolunteerService internationalVolunteerService;


	public ProjectsAbroadPipeline() {
	}

	@Override
	public void process(ResultItems resultitems, us.codecraft.webmagic.Task arg1) {
		//取出爬蟲得到的所有資料
		Map<String, Object> mapResults = resultitems.getAll();
		log.debug("mapResults={}",mapResults);
		
		if (mapResults.size() != 0) {
			Iterator<Entry<String, Object>> iter = mapResults.entrySet().iterator();			
			Map.Entry<String, Object> entry;
			
			// 將資料依照據field設定entity屬性並存到資料庫
			InternationalVolunteer bean = new InternationalVolunteer();
			while (iter.hasNext()) {
				entry = iter.next();
				String entryValue = (String)entry.getValue();
				if (entryValue== null) {
					entryValue = "";
				}
				
				int index;
				if (entry.getKey().equalsIgnoreCase("title")) {
					bean.setTitle(entryValue);
					String country = null;
					if ((index=entryValue.indexOf("的"))!= -1) {
						country = entryValue.substring(0,index);
					} else if ((index=entryValue.indexOf("社區"))!= -1){
						country = entryValue.substring(0,index);
					} else if ((index=entryValue.indexOf("體育"))!= -1){
						country = entryValue.substring(0,index);
					}
					String continent = ContinentDistributor.getContinentByCountry(country);
					if (continent != null) {
						bean.setCountry(country);						
					}
					bean.setContinent(continent);
				} else if (entry.getKey().indexOf("項目地點")!= -1) {
					if ((index = entryValue.indexOf("("))!= -1) {
						entryValue = entryValue.substring(0, index);
					}
					bean.setPlace(entryValue);		
				} else if (entry.getKey().indexOf("志工角色")!= -1) {
					bean.setRoleDiscription(entryValue);		
				} else if (entry.getKey().indexOf("經驗要求")!= -1 ||entry.getKey().indexOf("參加資格")!= -1 ) {					
					bean.setRequirement(entryValue);		
				} else if (entry.getKey().indexOf("項目長度")!= -1) {				
					bean.setProjectLength(entryValue);		
				} else if (entry.getKey().equalsIgnoreCase("websiteUrl")) {
					bean.setWebsiteUrl(entryValue);		
				} else if (entry.getKey().equalsIgnoreCase("picture")) {
					bean.setPicture(entryValue);		
				} else if (entry.getKey().equalsIgnoreCase("organization")) {
					bean.setOrganization(entryValue);		
				} 				
			}
			
			internationalVolunteerService.insert(bean);
			
		}
	

	}

}
