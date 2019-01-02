package team.lala.timebank.internationalVolunteer.waker;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Component;

import lombok.extern.slf4j.Slf4j;
import us.codecraft.webmagic.Page;
import us.codecraft.webmagic.Request;
import us.codecraft.webmagic.Site;
import us.codecraft.webmagic.processor.PageProcessor;
import us.codecraft.webmagic.utils.UrlUtils;

//PageProcessor負責解析頁面，抽取有用訊息，以及發現新的鍵接。
@Slf4j
@Component
public class WakerPageProcessor implements PageProcessor {
	
	//抓不到url
	// 抓取網站的相關配置，包括編碼、抓取間隔、重試次數等
	private Site site = Site.me().setRetryTimes(20).setSleepTime(100).setCharset("UTF-8");

	public Site getSite() {
		return site;
	}
	
	public void process(Page page) {
		log.debug("page url = {}", page.getUrl());
		
//		判斷其頁面url是否match此url 
//		if (page.getUrl().toString().equals("https://www.waker.org.tw/LocationList.aspx?nowPage=1&id=&tid=8")) {
			System.out.println("putField");
			page.putField("organization", "微客公益行動協會");
			page.putField("orgUrl", "https://www.waker.org.tw/");
			page.putField("websiteUrl", page.getUrl().toString());
			page.putField("logo", page.getHtml().xpath("//*[@id=\"IMG_com_logo\"]").toString());

			
			//取得div class='country-facts-box'內的標籤，以便取得此項目的資訊(如地點、志工角色、開始日期等)，並將資料放入field內
//			page.putField("title", page.getHtml().xpath("//*[@id=\"content\"]/article/h1/text()").toString());
//			String countryFactsBox =  page.getHtml().xpath("//div[@class='country-facts-box']/ul/html()").toString();	        
//	        log.debug("countryFactsBox={}", countryFactsBox);
//			List<String> strongTextList = new Html(countryFactsBox).xpath("//li/strong/text()").all();
//	        List<String> spanTextList = new Html(countryFactsBox).xpath("//li/span/text()").all();
//	        for(int i = 0; i < strongTextList.size(); i++) {
//	        	page.putField(strongTextList.get(i), spanTextList.get(i));
//	        }
	        //取得div class='inner-text'內的標籤，以便取得此項目的相片Url，並將資料放入picture field   	
        	page.putField("picture", page.getHtml().xpath("//*[@id=\"form\"]/div[3]/div[2]/div[1]/div/div[1]/img/@src").toString());
        	System.out.println("put field end");
        	
//		}

		// 列表頁 (加入新的url/頁面)
//		else {
//			// 項目url		
//			System.out.println("項目url");
//			for (int i = 1; i <= 5; i++) {
//						
//				page.addTargetRequest(new Request(UrlUtils.canonicalizeUrl("?nowPage="+i+"&id=&tid=8", "https://www.waker.org.tw/LocationList.aspx")));
//			}
//			System.out.println("targetRequests=" + page.getTargetRequests());
//			
//		}
		
	}
	


	
	
	

	
	
}

