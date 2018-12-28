package team.lala.timebank.webMagic;

import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import us.codecraft.webmagic.ResultItems;
import us.codecraft.webmagic.pipeline.Pipeline;
@Component
public class MysqlPipeline implements Pipeline {

	@Autowired
	private InternationalVolunteerDao dao;

	public MysqlPipeline() {
	}

	@Override
	public void process(ResultItems resultitems, us.codecraft.webmagic.Task arg1) {
		Map<String, Object> mapResults = resultitems.getAll();
		Iterator<Entry<String, Object>> iter = mapResults.entrySet().iterator();
		Map.Entry<String, Object> entry;
		// // 輸出到控制枱
		InternationalVolunteer bean = new InternationalVolunteer();
		while (iter.hasNext()) {
			entry = iter.next();
			System.out.println(entry.getKey() + "：" + entry.getValue());			
			if (entry.getKey().equalsIgnoreCase("Title")) {
				bean.setTitle((String) entry.getValue());				
			} else if (entry.getKey().equalsIgnoreCase("Place")) {
				bean.setPlace((String) entry.getValue());		
			} else if (entry.getKey().equalsIgnoreCase("RoleDiscription")) {
				bean.setRoleDiscription((String) entry.getValue());		
			} else if (entry.getKey().equalsIgnoreCase("ExperienceRequirement")) {
				bean.setExperienceRequirement((String) entry.getValue());		
			} else if (entry.getKey().equalsIgnoreCase("websiteUrl")) {
				bean.setWebsiteUrl((String) entry.getValue());		
			}
		}
		dao.save(bean);
	

	}

}
