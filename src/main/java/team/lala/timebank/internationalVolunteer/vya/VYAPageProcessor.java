package team.lala.timebank.internationalVolunteer.vya;

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
public class VYAPageProcessor implements PageProcessor {
	
	
	// 抓取網站的相關配置，包括編碼、抓取間隔、重試次數等
	private Site site = Site.me().setRetryTimes(20).setSleepTime(100).setCharset("UTF-8");

	public Site getSite() {
		return site;
	}
	
	public void process(Page page) {
		log.debug("page url = {}", page.getUrl());
		//每個活動頁面結構不同
//		判斷其頁面url是否match此url:/volunteer-projects/care/...
		if (page.getUrl().regex("http://www.volunteermatch.org.tw/IW/Promotion/promotion_[A-Za-z]{5,}").match()) {
			System.out.println("put field");
			page.putField("organization", "願景青年行動網協會");
			page.putField("orgUrl", "https://www.projects-abroad.com.tw/");
			page.putField("title", page.getHtml().xpath("/html/body/table/tbody/tr[6]/td/table/tbody/tr/td[2]/p[34]/span[1]/text()").toString()
						+page.getHtml().xpath("/html/body/table/tbody/tr[6]/td/table/tbody/tr/td[2]/p[34]/span[2]/text()").toString());
			page.putField("websiteUrl", page.getUrl().toString());
//			page.putField("logo", page.getHtml().xpath("//*[@id=\"logo-top\"]").toString());
			
        	page.getHtml().xpath("/html/body/table/tbody/tr[6]/td/table/tbody/tr/td[2]/p").links().regex(".*/images/.*").all();
//        	page.putField("picture", imgUrl);
  		
		}
		else if (page.getUrl().regex("https://www.projects-abroad.com.tw/volunteer-projects/[^0-9]{4,30}/").match()) {		
			System.out.println("add links");
			page.addTargetRequests(
					page.getHtml().css("div.box-project-row").links().all());		
		}
		// 列表頁 (加入新的url/頁面)
		else {
			System.out.println("項目url");
			// 項目url									/html/body/table/tbody/tr[6]/td/table/tbody/tr/td[1]/table/tbody/tr[6]
			
			List<String> paths = page.getHtml().xpath("/html/body/table/tbody/tr[6]/td/table/tbody/tr[1]/td[1]/table/tbody").links().all();
			
			page.addTargetRequests(paths);
			System.out.println(page.getTargetRequests());
			
		}
		
	}
	


	
	
	

	
	
}

