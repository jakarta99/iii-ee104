package team.lala.timebank.internationalVolunteer.projectsAbroad;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Component;

import lombok.extern.slf4j.Slf4j;
import us.codecraft.webmagic.Page;
import us.codecraft.webmagic.Site;
import us.codecraft.webmagic.processor.PageProcessor;
import us.codecraft.webmagic.selector.Html;

//PageProcessor負責解析頁面，抽取有用訊息，以及發現新的鍵接。
@Slf4j
@Component
public class ProjectsAbroadPageProcessor implements PageProcessor {
	
	
	// 抓取網站的相關配置，包括編碼、抓取間隔、重試次數等
	private Site site = Site.me().setRetryTimes(20).setSleepTime(100).setCharset("UTF-8");

	public Site getSite() {
		return site;
	}
	
	public void process(Page page) {
		log.debug("page url = {}", page.getUrl());
		
//		判斷其頁面url是否match此url:/volunteer-projects/care/...
		if (page.getUrl().regex("https://www.projects-abroad.com.tw/volunteer-projects/[^0-9]{4,40}/[^0-9]{5,40}/[^0-9]{4,30}/").match()) {
			page.putField("organization", "Projects Abroad");
			page.putField("title", page.getHtml().xpath("//*[@id=\"content\"]/article/h1/text()").toString());
			page.putField("websiteUrl", page.getUrl().toString());
			//取得div class='country-facts-box'內的標籤，以便取得此項目的資訊(如地點、志工角色、開始日期等)，並將資料放入field內
			String countryFactsBox =  page.getHtml().xpath("//div[@class='country-facts-box']/ul/html()").toString();	        
			List<String> strongTextList = new Html(countryFactsBox).xpath("//li/strong/text()").all();
	        List<String> spanTextList = new Html(countryFactsBox).xpath("//li/span/text()").all();
	        for(int i = 0; i < strongTextList.size(); i++) {
	        	page.putField(strongTextList.get(i), spanTextList.get(i));
	        }
	        //取得div class='inner-text'內的標籤，以便取得此項目的相片Url，並將資料放入picture field
	        
        	String imgUrl = new Html(page.getHtml().xpath("//*[@id=\"content\"]/article/div[2]/div/html()").toString())
        			.xpath("//img/@src").regex("https://photos1.projects-abroad.com.tw/projects/.*").get().toString();      	
        	page.putField("picture", imgUrl);
  		
		}
		else if (page.getUrl().regex("https://www.projects-abroad.com.tw/volunteer-projects/[^0-9]{4,30}/").match()) {		
			page.addTargetRequests(
					page.getHtml().css("div.box-project-row").links().all());		
		}
		// 列表頁 (加入新的url/頁面)
		else {
			// 項目url	
			String url = "https://www.projects-abroad.com.tw/volunteer-projects";
			List<String> targetRequest = new ArrayList<>();
			targetRequest.add(url+"/conservation-and-environment/");
			targetRequest.add(url+"/sports/");
			targetRequest.add(url+"/building/");
			targetRequest.add(url+"/agriculture-and-farming/");
			targetRequest.add(url+"/culture-and-community/");
			targetRequest.add(url+"/creative-and-performing-arts/");		
			targetRequest.add(url+"/archaeology/");
			page.addTargetRequests(targetRequest);
			
		}
		
	}
	


	
	
	

	
	
}

