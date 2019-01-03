package team.lala.timebank.internationalVolunteer.step30;

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


@Slf4j
@Component
public class Step30PageProcessor implements PageProcessor {

	@Autowired
	private InternationalVolunteerService internationalVolunteerService;

	// 抓取網站的相關配置，包括編碼、抓取間隔、重試次數等
	private Site site = Site.me().setRetryTimes(20).setSleepTime(100).setCharset("UTF-8");

	public Site getSite() {
		return site;
	}

	//此網站只有一個頁面包含想要的訊息
	//負責解析頁面，抽取有用訊息，以及抽取結果的處理(將資料存入資料庫)。
	public void process(Page page) {
		log.debug("page url = {}", page.getUrl());

		// 取得div內的所有標籤，以便取得所有項目的資訊(如地點、志工角色、開始日期等)
		String divRowsHtml = page.getHtml().xpath("div[@class=\"tab-content text-dark\"]/html()").toString();
		// 項目圖片
		List<String> imgs = new Html(divRowsHtml).xpath("//img/@src")
				.replace("/uploads", "https://www.step30.org/uploads").all();

		// 項目開始日期
		List<String> startDateList = new ArrayList<>();
		List<String> divHtmlList = new Html(divRowsHtml).xpath("div[@class=\"blog-date\"]/html()").all();
		for (String divDate : divHtmlList) {
			List<String> spanDates = new Html(divDate).xpath("//span/text()").all();
			startDateList.add(convertDateFormat(spanDates)); // 將日期格式化後存入startDateList
		}

		// 項目結束日期
		List<String> endDateList = new ArrayList<>();
		divHtmlList = new Html(divRowsHtml).xpath("div[@class=\"blog-end-date\"]/html()").all();
		for (String divDate : divHtmlList) {
			List<String> spanDates = new Html(divDate).xpath("//span/text()").all();
			endDateList.add(convertDateFormat(spanDates)); // 將日期格式化後存入startDateList
		}
		int index;
		// 項目標題
		List<String> titleList = new Html(divRowsHtml).xpath("div[@class=\"blog-title\"]/a/text()").all();
		for (int i = 0; i < titleList.size(); i ++) {
			if ((index = titleList.get(i).indexOf("愛"))!= -1) {
				titleList.set(i, titleList.get(i).substring(0, index+1)+".女孩團");
			}
		}
		// 項目敘述
		List<String> discriptionList = new Html(divRowsHtml)
				.xpath("div[@class=\"news-introtxt w-100 p-0 m-0\"]/p/text()").all();
		for (int i = 0; i < discriptionList.size(); i ++) {
			if ((index = discriptionList.get(i).indexOf("(男生也可報名)") )!= -1) {
				discriptionList.set(i, discriptionList.get(i).substring(0, index+1));
			}
		}
		// 項目地點
		List<String> placeList = new ArrayList<>();
		for (String title : titleList) {
			if (title.indexOf("月") != -1) {
				String place = title.split("月")[1].split("[舊愛宣]{1}")[0];
				placeList.add(place);
			}
		}

		for (int i = 0; i < imgs.size(); i++) {
			InternationalVolunteer iVolunteer = new InternationalVolunteer();
			iVolunteer.setPicture(imgs.get(i));
			iVolunteer.setPlace(placeList.get(i));
			// iVolunteer.setProjectLength("");
			iVolunteer.setRequirement("無須經驗，沒有特別要求");
			iVolunteer.setRoleDiscription(discriptionList.get(i));
			iVolunteer.setStartDate(startDateList.get(i) + " - " + endDateList.get(i));
			iVolunteer.setTitle(titleList.get(i));
			iVolunteer.setOrganization("Step30  舊鞋。救命");
			iVolunteer.setOrgLogo(page.getHtml().xpath("/html/body/div[1]/header/nav/div/div[1]/a/img/@src")
					.replace("images", "https://www.step30.org/images").toString());
			iVolunteer.setWebsiteUrl(page.getUrl().toString());
			System.out.println(iVolunteer);
			internationalVolunteerService.insert(iVolunteer);
		}

		System.out.println("put field end");
	}

	private String convertDateFormat(List<String> spanDates) {

		if (spanDates.get(1).equalsIgnoreCase("Jan")) {
			spanDates.set(1, "01");
		} else if (spanDates.get(1).equalsIgnoreCase("Feb")) {
			spanDates.set(1, "02");
		} else if (spanDates.get(1).equalsIgnoreCase("Mar")) {
			spanDates.set(1, "03");
		} else if (spanDates.get(1).equalsIgnoreCase("Apr")) {
			spanDates.set(1, "04");
		} else if (spanDates.get(1).equalsIgnoreCase("May")) {
			spanDates.set(1, "05");
		} else if (spanDates.get(1).equalsIgnoreCase("Jun")) {
			spanDates.set(1, "06");
		} else if (spanDates.get(1).equalsIgnoreCase("Jul")) {
			spanDates.set(1, "07");
		} else if (spanDates.get(1).equalsIgnoreCase("Aug")) {
			spanDates.set(1, "08");
		} else if (spanDates.get(1).equalsIgnoreCase("Sep")) {
			spanDates.set(1, "09");
		} else if (spanDates.get(1).equalsIgnoreCase("Oct")) {
			spanDates.set(1, "10");
		} else if (spanDates.get(1).equalsIgnoreCase("Nov")) {
			spanDates.set(1, "11");
		} else if (spanDates.get(1).equalsIgnoreCase("Dec")) {
			spanDates.set(1, "12");
		}
		String formattedDate = spanDates.get(2) + "/" + spanDates.get(1) + "/" + spanDates.get(0);
		return formattedDate;
	}

}
