package team.lala.timebank.webMagic;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import lombok.extern.slf4j.Slf4j;
import team.lala.timebank.web.admin.AdminMemberController;
import us.codecraft.webmagic.Spider;

@RestController
public class TestBeanController {

	@Autowired
	private MysqlPipeline mysqlPipeline;

	@RequestMapping("/test")
	public String test() {
		Spider.create(new HupuNewsSpider())
		.addUrl("https://www.projects-abroad.com.tw/volunteer-projects/conservation-and-environment/african-bushveld-conservation/south-africa/")
		.addPipeline(mysqlPipeline).thread(3).run();
		return "程式成功執行";
	}

}
