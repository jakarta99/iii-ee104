package team.lala.timebank.internationalVolunteer.vya;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import lombok.extern.slf4j.Slf4j;
import team.lala.timebank.commons.ContinentDistributor;
import team.lala.timebank.internationalVolunteer.model.InternationalVolunteer;
import team.lala.timebank.internationalVolunteer.model.InternationalVolunteerService;
import us.codecraft.webmagic.Page;
import us.codecraft.webmagic.Site;
import us.codecraft.webmagic.processor.PageProcessor;

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
		if (page.getUrl().regex("http://www.volunteermatch.org.tw/IW/Promotion/promotion_philippeans.htm").match()) {			
			String title = page.getHtml().xpath("/html/body/table/tbody/tr[6]/td/table/tbody/tr/td[2]/p[2]/span/font/text()").toString();
			String country = "菲律賓";	
			String place = page.getHtml().xpath("/html/body/table/tbody/tr[6]/td/table/tbody/tr/td[2]/p[34]/span[2]/text()").toString();	
			String websiteUrl = page.getUrl().toString();

			List<String> imgs = page.getHtml().xpath("//img/@src").regex("../images/201[7-8]{1}S/.*").replace("../images", "http://www.volunteermatch.org.tw/IW/images").all();
			for (int i = 0; i < 3; i++) {
				String[] activityDate = ("2019/0"+page.getHtml().xpath("/html/body/table/tbody/tr[6]/td/table/tbody/tr/td[2]/div[1]/table/tbody/tr["+(i+2)+"]/td[2]/p[1]/span[1]/text()").replace("-", " - 2019/0").toString()).split(" - ");
				String projectLength = page.getHtml().xpath("/html/body/table/tbody/tr[6]/td/table/tbody/tr/td[2]/div[1]/table/tbody/tr["+(i+2)+"]/td[2]/p[2]/span[1]/text()").toString().trim()+
						page.getHtml().xpath("/html/body/table/tbody/tr[6]/td/table/tbody/tr/td[2]/div[1]/table/tbody/tr["+(i+2)+"]/td[2]/p[2]/span[2]/text()").toString().trim();
				String roleDiscription = page.getHtml().xpath("/html/body/table/tbody/tr[6]/td/table/tbody/tr/td[2]/div[1]/table/tbody/tr["+(i+2)+"]/td[3]/p[1]/span/text()").toString().trim()
						+page.getHtml().xpath("/html/body/table/tbody/tr[6]/td/table/tbody/tr/td[2]/div[1]/table/tbody/tr[2]/td[3]/p[2]/span/text()").toString().trim();
			
				this.insertIVolunteer(title, country, place, websiteUrl, imgs.get(i),
						activityDate[0], activityDate[1], projectLength,  roleDiscription) ;				
			}       	  		
		}
		else if (page.getUrl().regex("http://www.volunteermatch.org.tw/IW/Promotion/promotion_Nepal.htm").match()) {					
			String title = page.getHtml().xpath("/html/body/table/tbody/tr[7]/td/table/tbody/tr[1]/td[2]/p[2]/span/text()").toString();
			String country = "尼泊爾";			
			String place = "";			
			String websiteUrl = page.getUrl().toString();
			List<String> imgs = page.getHtml().xpath("//img/@src").regex("../images/201[7-8]{1}W/.*").replace("../images", "http://www.volunteermatch.org.tw/IW/images").all();			

			for (int i = 0; i < 3; i++) {													
				String[] activityDate = ("2019/0"+page.getHtml().xpath("/html/body/table/tbody/tr[7]/td/table/tbody/tr[1]/td[2]/div[1]/table/tbody/tr["+(i+2)+"]/td[2]/p[1]/span/text()").replace("-", " - 2019/0").toString().trim()).split(" - ");
				String projectLength = page.getHtml().xpath("/html/body/table/tbody/tr[7]/td/table/tbody/tr[1]/td[2]/div[1]/table/tbody/tr["+(i+2)+"]/td[2]/p[2]/span[1]/text()").toString().trim()+
						page.getHtml().xpath("/html/body/table/tbody/tr[7]/td/table/tbody/tr[1]/td[2]/div[1]/table/tbody/tr["+(i+2)+"]/td[2]/p[2]/span[2]/text()").toString().trim();
				String roleDiscription = page.getHtml().xpath("/html/body/table/tbody/tr[7]/td/table/tbody/tr[1]/td[2]/div[1]/table/tbody/tr["+(i+2)+"]/td[2]/p[5]/span/text()").toString();
				this.insertIVolunteer(title, country, place, websiteUrl, imgs.get(i),
						activityDate[0], activityDate[1], projectLength,  roleDiscription) ;				
			}
        	
		}
		else if (page.getUrl().regex("http://www.volunteermatch.org.tw/IW/Promotion/promotion_Combodia_CYA.htm").match()) {					
			String title = page.getHtml().xpath("/html/body/table/tbody/tr[6]/td/table/tbody/tr/td[2]/p[1]/span[2]/span/text()").toString();
			String country = "柬埔寨";
			String place="";
			String websiteUrl = page.getUrl().toString();
			List<String> imgs = page.getHtml().xpath("//img/@src").regex("../images/201[6-7]{1}W/.*").replace("../images", "http://www.volunteermatch.org.tw/IW/images").all();
			for (int i = 0; i < 2; i++) {																		
				String[] activityDate = ("2019/0"+page.getHtml().xpath("/html/body/table/tbody/tr[6]/td/table/tbody/tr/td[2]/div[1]/table/tbody/tr["+(i+2)+"]/td[2]/p[1]/span[1]/text()").replace("-", " - 2019/0").toString().trim()).split(" - ");															
				String projectLength = page.getHtml().xpath("/html/body/table/tbody/tr[6]/td/table/tbody/tr/td[2]/div[1]/table/tbody/tr["+(i+2)+"]/td[2]/p[2]/span[1]/text()").toString().trim()+
						page.getHtml().xpath("/html/body/table/tbody/tr[6]/td/table/tbody/tr/td[2]/div[1]/table/tbody/tr["+(i+2)+"]/td[2]/p[2]/span[2]/text()").toString().trim();
				String roleDiscription = page.getHtml().xpath("/html/body/table/tbody/tr[6]/td/table/tbody/tr/td[2]/div[1]/table/tbody/tr[2]/td[3]/p[1]/span/text()").toString()
						+page.getHtml().xpath("/html/body/table/tbody/tr[6]/td/table/tbody/tr/td[2]/div[1]/table/tbody/tr[2]/td[3]/p[2]/span/text()").toString();
				this.insertIVolunteer(title, country, place, websiteUrl, imgs.get(i),
						activityDate[0], activityDate[1], projectLength,  roleDiscription) ;
				
			}
        	
		}
		else if (page.getUrl().regex("http://www.volunteermatch.org.tw/IW/Promotion/promotion_sri-lanka.htm").match()) {					
			String title = page.getHtml().xpath("/html/body/table/tbody/tr[6]/td/table/tbody/tr/td[2]/p[1]/span[3]/text()").replace("圖-", "").toString();
			String country = "斯里蘭卡";	
			String place = "";	
			String websiteUrl = page.getUrl().toString();
			List<String> imgs = page.getHtml().xpath("//img/@src").regex("../images/201[7-8]{1}W/.*").replace("../images", "http://www.volunteermatch.org.tw/IW/images").all();
																													
			String[] activityDate = ("2019/0"+page.getHtml().xpath("/html/body/table/tbody/tr[6]/td/table/tbody/tr/td[2]/div[1]/div/table/tbody/tr[2]/td[2]/p[1]/span[1]/text()").replace("-", " - 2019/0").toString().trim()).split(" - ");															
			String projectLength = page.getHtml().xpath("/html/body/table/tbody/tr[6]/td/table/tbody/tr/td[2]/div[1]/div/table/tbody/tr[2]/td[2]/p[2]/span[1]/text()").toString().trim()+
			page.getHtml().xpath("/html/body/table/tbody/tr[6]/td/table/tbody/tr/td[2]/div[1]/div/table/tbody/tr[2]/td[2]/p[2]/span[2]/text()").toString().trim();
			String roleDiscription = page.getHtml().xpath("/html/body/table/tbody/tr[6]/td/table/tbody/tr/td[2]/div[1]/div/table/tbody/tr[2]/td[3]/p/span/text()").toString();
			this.insertIVolunteer(title,country, place, websiteUrl, imgs.get(1),
					activityDate[0], activityDate[1], projectLength,  roleDiscription) ;	
		}
		else if (page.getUrl().regex("http://www.volunteermatch.org.tw/IW/Promotion/promotion_Japan.htm").match()) {					
			List<String> temp1 = page.getHtml().xpath("/html/body/table/tbody/tr[6]/td/table/tbody/tr/td[2]/p[2]/b/span/text()").all();
			String title ="";
			for (String t:temp1) {
				title +=t;
			}
			String country = "日本";	
			String place = "";			
			String websiteUrl = page.getUrl().toString();
			List<String> imgs = page.getHtml().xpath("//img/@src").regex("../images/201[7-8]{1}W/.*").replace("../images", "http://www.volunteermatch.org.tw/IW/images").all();
																										
			for (int i = 0; i < 2; i++) {		
				String[] temp = page.getHtml().xpath("/html/body/table/tbody/tr[6]/td/table/tbody/tr/td[2]/div[1]/table/tbody/tr["+(i+2)+"]/td[2]/p[1]/span/text()").toString().split("，");			
				String[] activityDate = ("2019/0"+temp[0].replace("-", " - 2019/0").toString().trim()).split(" - ");															
				String projectLength = temp[1];
				String roleDiscription = page.getHtml().xpath("/html/body/table/tbody/tr[6]/td/table/tbody/tr/td[2]/div[1]/table/tbody/tr["+(i+2)+"]/td[3]/p/span/text()").toString().trim();
				this.insertIVolunteer(title, country, place, websiteUrl, imgs.get(i),
						activityDate[0], activityDate[1], projectLength,  roleDiscription) ;
				
			}
		}		
		// 列表頁 (加入新的url/頁面)
		else {
			List<String> paths = page.getHtml().xpath("/html/body/table/tbody/tr[6]/td/table/tbody/tr[1]/td[1]/table/tbody").links().all();		
			page.addTargetRequests(paths);			
		}
		
	}
	
	private SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
	
	private void insertIVolunteer(String title, String country, String place, String websiteUrl,String img,
			String startDate, String endDate, String projectLength, String roleDiscription) {
		InternationalVolunteer iVolunteer = new InternationalVolunteer();
		iVolunteer.setTitle(title);
		iVolunteer.setCountry(country);
		iVolunteer.setPlace(place);
		iVolunteer.setContinent(ContinentDistributor.getContinentByCountry(country));
		iVolunteer.setWebsiteUrl(websiteUrl);
		iVolunteer.setPicture(img);
		try {
			iVolunteer.setStartDate(sdf.parse(startDate));
			iVolunteer.setEndDate(sdf.parse(endDate));
		} catch (ParseException e) {
			e.printStackTrace();
		}
		iVolunteer.setProjectLength(projectLength);
		iVolunteer.setRoleDiscription(roleDiscription);
		iVolunteer.setRequirement("無須經驗，沒有特別要求");
		iVolunteer.setOrganization("願景青年行動網協會 VYA Taiwan");
		internationalVolunteerService.insert(iVolunteer);
	}
	


	
	
	

	
	
}

