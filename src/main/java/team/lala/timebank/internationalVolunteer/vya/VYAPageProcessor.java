package team.lala.timebank.internationalVolunteer.vya;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import lombok.extern.slf4j.Slf4j;
import team.lala.timebank.internationalVolunteer.model.InternationalVolunteer;
import team.lala.timebank.internationalVolunteer.model.InternationalVolunteerService;
import us.codecraft.webmagic.Page;
import us.codecraft.webmagic.Site;
import us.codecraft.webmagic.processor.PageProcessor;
import us.codecraft.webmagic.selector.Html;

//PageProcessor負責解析頁面，抽取有用訊息，以及發現新的鍵接。
@Slf4j
@Component
public class VYAPageProcessor implements PageProcessor {

	@Autowired
	private InternationalVolunteerService internationalVolunteerService;
	
	// 抓取網站的相關配置，包括編碼、抓取間隔、重試次數等
	private Site site = Site.me().setRetryTimes(20).setSleepTime(100).setCharset("UTF-8");

	public Site getSite() {
		return site;
	}
	
	public void process(Page page) {
		log.debug("page url = {}", page.getUrl());
		//每個活動頁面結構不同
//		判斷其頁面url是否match此url:/volunteer-projects/care/...
		if (page.getUrl().regex("http://www.volunteermatch.org.tw/IW/Promotion/promotion_philippeans.htm").match()) {
			System.out.println("put field");
			String orgUrl = "https://www.projects-abroad.com.tw/";
			String title = page.getHtml().xpath("/html/body/table/tbody/tr[6]/td/table/tbody/tr/td[2]/p[2]/span/font/text()").toString();
			String roleDiscription = page.getHtml().xpath("/html/body/table/tbody/tr[6]/td/table/tbody/tr/td[2]/div[1]/table/tbody/tr[2]/td[3]/p[1]/span/text()").toString()
						+page.getHtml().xpath("/html/body/table/tbody/tr[6]/td/table/tbody/tr/td[2]/div[1]/table/tbody/tr[2]/td[3]/p[2]/span/text()").toString();
						
//			page.putField("logo", page.getHtml().xpath("//*[@id=\"logo-top\"]").toString());
			
//        	String img = page.getHtml().xpath("/html/body/table/tbody/tr[6]/td/table/tbody/tr/td[2]/p").links().regex(".*/images/.*").all();
//        	page.putField("picture", imgUrl);
        	
        	
        	
        	
    			InternationalVolunteer iVolunteer = new InternationalVolunteer();
//    			iVolunteer.setPicture(imgs.get(i));
//    			iVolunteer.setPlace(placeList.get(i));
    			// iVolunteer.setProjectLength("");
    			iVolunteer.setRequirement("無須經驗，沒有特別要求");
//    			iVolunteer.setRoleDiscription(discriptionList.get(i));
//    			iVolunteer.setStartDate(startDateList.get(i) + "到" + endDateList.get(i));
    			iVolunteer.setTitle(title);
    			iVolunteer.setOrganization("願景青年行動網協會");
    			iVolunteer.setOrgLogo(page.getHtml().xpath("/html/body/div[1]/header/nav/div/div[1]/a/img/@src")
    					.replace("images", "https://www.step30.org/images").toString());
    			iVolunteer.setOrgUrl("https://www.projects-abroad.com.tw/");
    			iVolunteer.setWebsiteUrl(page.getUrl().toString());
    			System.out.println(iVolunteer);
    			internationalVolunteerService.insert(iVolunteer);
    		
        	
  		
		}
		else if (page.getUrl().regex("https://www.projects-abroad.com.tw/volunteer-projects/[^0-9]{4,30}/").match()) {		
			System.out.println("add links");
			page.addTargetRequests(
					page.getHtml().css("div.box-project-row").links().all());		
		}
		// 列表頁 (加入新的url/頁面)
		else {
			System.out.println("項目url");
			// 項目url								
			List<String> paths = page.getHtml().xpath("/html/body/table/tbody/tr[6]/td/table/tbody/tr[1]/td[1]/table/tbody").links().all();
			
			page.addTargetRequests(paths);
			System.out.println(page.getTargetRequests());
			
		}
		
	}
	


	
	
	

	
	
}

