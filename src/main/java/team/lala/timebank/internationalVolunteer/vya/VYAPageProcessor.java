package team.lala.timebank.internationalVolunteer.vya;

import java.util.ArrayList;
import java.util.Arrays;
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
			String title = page.getHtml().xpath("/html/body/table/tbody/tr[6]/td/table/tbody/tr/td[2]/p[2]/span/font/text()").toString();
			String place = "菲律賓";			
			String websiteUrl = page.getUrl().toString();
			String orgLogo = null;
//			String orgLogo = page.getHtml().xpath("/html/body/div[1]/header/nav/div/div[1]/a/img/@src")
//					.replace("images", "https://www.step30.org/images").toString();
			List<String> imgs = page.getHtml().xpath("//img/@src").regex("../images/201[7-8]{1}S/.*").replace("../images", "http://www.volunteermatch.org.tw/IW/images").all();
			System.out.println("imgs="+imgs);
			
//			page.putField("logo", page.getHtml().xpath("//*[@id=\"logo-top\"]").toString());
			for (int i = 0; i < 3; i++) {
				String startDate = "2019/0"+page.getHtml().xpath("/html/body/table/tbody/tr[6]/td/table/tbody/tr/td[2]/div[1]/table/tbody/tr["+(i+2)+"]/td[2]/p[1]/span[1]/text()").replace("-", " - 2019/0").toString();
				String projectLength = page.getHtml().xpath("/html/body/table/tbody/tr[6]/td/table/tbody/tr/td[2]/div[1]/table/tbody/tr["+(i+2)+"]/td[2]/p[2]/span[1]/text()").toString().trim()+
						page.getHtml().xpath("/html/body/table/tbody/tr[6]/td/table/tbody/tr/td[2]/div[1]/table/tbody/tr["+(i+2)+"]/td[2]/p[2]/span[2]/text()").toString().trim();
				String roleDiscription = page.getHtml().xpath("/html/body/table/tbody/tr[6]/td/table/tbody/tr/td[2]/div[1]/table/tbody/tr["+(i+2)+"]/td[3]/p[1]/span/text()").toString().trim()
						+page.getHtml().xpath("/html/body/table/tbody/tr[6]/td/table/tbody/tr/td[2]/div[1]/table/tbody/tr[2]/td[3]/p[2]/span/text()").toString().trim();
			
				this.insertIVolunteer(title,place, websiteUrl, orgLogo, imgs.get(i),
						startDate, projectLength,  roleDiscription) ;				
			}       	
  		
		}
		else if (page.getUrl().regex("http://www.volunteermatch.org.tw/IW/Promotion/promotion_Nepal.htm").match()) {					
			String title = page.getHtml().xpath("/html/body/table/tbody/tr[7]/td/table/tbody/tr[1]/td[2]/p[2]/span/text()").toString();
			String place = "尼泊爾";			
			String websiteUrl = page.getUrl().toString();
			String orgLogo = null;
//			String orgLogo = page.getHtml().xpath("/html/body/div[1]/header/nav/div/div[1]/a/img/@src")
//					.replace("images", "https://www.step30.org/images").toString();
			List<String> imgs = page.getHtml().xpath("//img/@src").regex("../images/201[7-8]{1}W/.*").replace("../images", "http://www.volunteermatch.org.tw/IW/images").all();
			System.out.println("imgs="+imgs);
			
//			page.putField("logo", page.getHtml().xpath("//*[@id=\"logo-top\"]").toString());
			for (int i = 0; i < 3; i++) {													
				String startDate = "2019/0"+page.getHtml().xpath("/html/body/table/tbody/tr[7]/td/table/tbody/tr[1]/td[2]/div[1]/table/tbody/tr["+(i+2)+"]/td[2]/p[1]/span/text()").replace("-", " - 2019/0").toString().trim();
				String projectLength = page.getHtml().xpath("/html/body/table/tbody/tr[7]/td/table/tbody/tr[1]/td[2]/div[1]/table/tbody/tr["+(i+2)+"]/td[2]/p[2]/span[1]/text()").toString().trim()+
						page.getHtml().xpath("/html/body/table/tbody/tr[7]/td/table/tbody/tr[1]/td[2]/div[1]/table/tbody/tr["+(i+2)+"]/td[2]/p[2]/span[2]/text()").toString().trim();
				String roleDiscription = page.getHtml().xpath("/html/body/table/tbody/tr[7]/td/table/tbody/tr[1]/td[2]/div[1]/table/tbody/tr["+(i+2)+"]/td[2]/p[5]/span/text()").toString();
				this.insertIVolunteer(title,place, websiteUrl, orgLogo, imgs.get(i),
						startDate, projectLength,  roleDiscription) ;
				
			}
        	
		}
		else if (page.getUrl().regex("http://www.volunteermatch.org.tw/IW/Promotion/promotion_Combodia_CYA.htm").match()) {					
			String title = page.getHtml().xpath("/html/body/table/tbody/tr[6]/td/table/tbody/tr/td[2]/p[1]/span[2]/span/text()").toString();
			String place = "柬埔寨";			
			String websiteUrl = page.getUrl().toString();
			String orgLogo = null;
//			String orgLogo = page.getHtml().xpath("/html/body/div[1]/header/nav/div/div[1]/a/img/@src")
//					.replace("images", "https://www.step30.org/images").toString();
			List<String> imgs = page.getHtml().xpath("//img/@src").regex("../images/201[6-7]{1}W/.*").replace("../images", "http://www.volunteermatch.org.tw/IW/images").all();
			System.out.println("imgs="+imgs);
			
//			page.putField("logo", page.getHtml().xpath("//*[@id=\"logo-top\"]").toString());
			for (int i = 0; i < 2; i++) {																		
				String startDate = "2019/0"+page.getHtml().xpath("/html/body/table/tbody/tr[6]/td/table/tbody/tr/td[2]/div[1]/table/tbody/tr["+(i+2)+"]/td[2]/p[1]/span[1]/text()").replace("-", " - 2019/0").toString().trim();															
				String projectLength = page.getHtml().xpath("/html/body/table/tbody/tr[6]/td/table/tbody/tr/td[2]/div[1]/table/tbody/tr["+(i+2)+"]/td[2]/p[2]/span[1]/text()").toString().trim()+
						page.getHtml().xpath("/html/body/table/tbody/tr[6]/td/table/tbody/tr/td[2]/div[1]/table/tbody/tr["+(i+2)+"]/td[2]/p[2]/span[2]/text()").toString().trim();
				String roleDiscription = page.getHtml().xpath("/html/body/table/tbody/tr[6]/td/table/tbody/tr/td[2]/div[1]/table/tbody/tr[2]/td[3]/p[1]/span/text()").toString()
						+page.getHtml().xpath("/html/body/table/tbody/tr[6]/td/table/tbody/tr/td[2]/div[1]/table/tbody/tr[2]/td[3]/p[2]/span/text()").toString();
				this.insertIVolunteer(title,place, websiteUrl, orgLogo, imgs.get(i),
						startDate, projectLength,  roleDiscription) ;
				
			}
        	
		}
		else if (page.getUrl().regex("http://www.volunteermatch.org.tw/IW/Promotion/promotion_sri-lanka.htm").match()) {					
			String title = page.getHtml().xpath("/html/body/table/tbody/tr[6]/td/table/tbody/tr/td[2]/p[1]/span[3]/text()").replace("圖-", "").toString();
			String place = "斯里蘭卡";			
			String websiteUrl = page.getUrl().toString();
			String orgLogo = null;
//			String orgLogo = page.getHtml().xpath("/html/body/div[1]/header/nav/div/div[1]/a/img/@src")
//					.replace("images", "https://www.step30.org/images").toString();
			List<String> imgs = page.getHtml().xpath("//img/@src").regex("../images/201[7-8]{1}W/.*").replace("../images", "http://www.volunteermatch.org.tw/IW/images").all();
			System.out.println("imgs="+imgs);
			
//			page.putField("logo", page.getHtml().xpath("//*[@id=\"logo-top\"]").toString());
																										
			String startDate = "2019/0"+page.getHtml().xpath("/html/body/table/tbody/tr[6]/td/table/tbody/tr/td[2]/div[1]/div/table/tbody/tr[2]/td[2]/p[1]/span[1]/text()").replace("-", " - 2019/0").toString().trim();															
			String projectLength = page.getHtml().xpath("/html/body/table/tbody/tr[6]/td/table/tbody/tr/td[2]/div[1]/div/table/tbody/tr[2]/td[2]/p[2]/span[1]/text()").toString().trim()+
			page.getHtml().xpath("/html/body/table/tbody/tr[6]/td/table/tbody/tr/td[2]/div[1]/div/table/tbody/tr[2]/td[2]/p[2]/span[2]/text()").toString().trim();
			String roleDiscription = page.getHtml().xpath("/html/body/table/tbody/tr[6]/td/table/tbody/tr/td[2]/div[1]/div/table/tbody/tr[2]/td[3]/p/span/text()").toString();
			this.insertIVolunteer(title,place, websiteUrl, orgLogo, imgs.get(1),
						startDate, projectLength,  roleDiscription) ;	
		}
		else if (page.getUrl().regex("http://www.volunteermatch.org.tw/IW/Promotion/promotion_Japan.htm").match()) {					
			List<String> temp1 = page.getHtml().xpath("/html/body/table/tbody/tr[6]/td/table/tbody/tr/td[2]/p[2]/b/span/text()").all();
			String title ="";
			for (String t:temp1) {
				title +=t;
			}
			 
			String place = "日本";			
			String websiteUrl = page.getUrl().toString();
			String orgLogo = null;
//			String orgLogo = page.getHtml().xpath("/html/body/div[1]/header/nav/div/div[1]/a/img/@src")
//					.replace("images", "https://www.step30.org/images").toString();
			List<String> imgs = page.getHtml().xpath("//img/@src").regex("../images/201[7-8]{1}W/.*").replace("../images", "http://www.volunteermatch.org.tw/IW/images").all();
			System.out.println("imgs="+imgs);
			
//			page.putField("logo", page.getHtml().xpath("//*[@id=\"logo-top\"]").toString());
																										
			for (int i = 0; i < 2; i++) {		
				String[] temp = page.getHtml().xpath("/html/body/table/tbody/tr[6]/td/table/tbody/tr/td[2]/div[1]/table/tbody/tr["+(i+2)+"]/td[2]/p[1]/span/text()").toString().split("，");			
				String startDate = "2019/0"+temp[0].replace("-", " - 2019/0").toString().trim();															
				String projectLength = temp[1];
				String roleDiscription = page.getHtml().xpath("/html/body/table/tbody/tr[6]/td/table/tbody/tr/td[2]/div[1]/table/tbody/tr["+(i+2)+"]/td[3]/p/span/text()").toString().trim();
				this.insertIVolunteer(title, place, websiteUrl, orgLogo, imgs.get(i),
						startDate, projectLength,  roleDiscription) ;
				
			}
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
	
	
	
	private void insertIVolunteer(String title, String place, String websiteUrl, String orgLogo,String img,
			String startDate, String projectLength, String roleDiscription) {
		InternationalVolunteer iVolunteer = new InternationalVolunteer();
		iVolunteer.setTitle(title);
		iVolunteer.setPlace(place);
		iVolunteer.setWebsiteUrl(websiteUrl);
		iVolunteer.setOrgLogo(orgLogo);
		iVolunteer.setPicture(img);
		iVolunteer.setStartDate(startDate);
		 iVolunteer.setProjectLength(projectLength);
		iVolunteer.setRoleDiscription(roleDiscription);
		iVolunteer.setRequirement("無須經驗，沒有特別要求");
		iVolunteer.setOrganization("願景青年行動網協會");
		
		System.out.println(iVolunteer);
		internationalVolunteerService.insert(iVolunteer);
	}
	


	
	
	

	
	
}

