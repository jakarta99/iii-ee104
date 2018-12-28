package team.lala.timebank.webMagic;

import org.springframework.stereotype.Component;

import lombok.extern.slf4j.Slf4j;
import team.lala.timebank.web.admin.AdminMemberController;
import us.codecraft.webmagic.Page;
import us.codecraft.webmagic.Site;
import us.codecraft.webmagic.processor.PageProcessor;

@Component
public class HupuNewsSpider implements PageProcessor {

	// 抓取網站的相關配置，包括編碼、抓取間隔、重試次數等
	private Site site = Site.me().setRetryTimes(3).setSleepTime(100).setCharset("UTF-8");

	public Site getSite() {
		return site;
	}
	
	public void process(Page page) {
		// 文章頁，匹配 https://voice.hupu.com/nba/七位數字.html
		if (page.getUrl().regex("https://www.projects-abroad.com.tw/volunteer-projects/conservation-and-environment/african-bushveld-conservation/south-africa/").match()) {
			page.putField("Title", page.getHtml().xpath("//*[@id=\"content\"]/article/h1/text()").toString());
			page.putField("Place", page.getHtml().xpath("//*[@id=\"content\"]/article/div[2]/div/div/div[1]/ul/li[1]/span/text()").toString());
			page.putField("RoleDiscription", page.getHtml().xpath("//*[@id=\"content\"]/article/div[2]/div/div/div[1]/ul/li[2]/span/text()").toString());
			page.putField("ExperienceRequirement", page.getHtml().xpath("//*[@id=\"content\"]/article/div[2]/div/div/div[1]/ul/li[3]/span/text()").toString());
			page.putField("websiteUrl", page.getHtml().xpath("/html/head/meta[10]/@content").toString());
		
		}
		// 列表頁 (加入新的url/頁面)
		else {
			// 文章url
			page.addTargetRequests(
					page.getHtml().xpath("//*[@id=\"main-nav\"]/ul/li[3]/div/div[1]/div[0-2]{1}/div[0-9]{1}/ul/li[0-9]{1}/a/@href").all());
			// 翻頁url
//			page.addTargetRequests(
//					page.getHtml().xpath("/html/body/div[3]/div[1]/div[3]/a[@class='page-btn-prev']/@href").all());
		}
	}

}

