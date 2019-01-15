package team.lala.timebank.web.admin;

import java.awt.Color;
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JLabel;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import lombok.extern.slf4j.Slf4j;
import team.lala.timebank.commons.ajax.AjaxResponse;
import team.lala.timebank.commons.view.PdfViewForChart;
import team.lala.timebank.entity.Donation;
import team.lala.timebank.service.DonationService;
import team.lala.timebank.spec.DonationSpecification;
@Slf4j
@Controller
@RequestMapping("/admin/donation")
public class AdminDonationController {

	@Autowired
	private DonationService donationService;

	@RequestMapping("/edit")
	public String editPage(@RequestParam("id") Long id, Model model) {
		Donation donation = donationService.getOne(id);
		model.addAttribute("donation", donation);
		return "/admin/donation/donation_edit";
	}

	@RequestMapping("/add")
	public String addPage() {

		return "/admin/donation/donation_add";
	}

	@RequestMapping("/list")
	public String listPage(Model model) {
		List<Donation> donations = donationService.findAll();
		model.addAttribute("donations", donations);
		return "/admin/donation/donation_list";
	}

	@RequestMapping("/insert")
	@ResponseBody
	public AjaxResponse<Donation> insertDonation(Donation donation) {
		AjaxResponse<Donation> response = new AjaxResponse<Donation>();
		try {
			Donation insertDonation = donationService.insert(donation);
			response.setObj(insertDonation);
		} catch (Exception e) {
			response.addMessage("新增失敗");
			e.printStackTrace();
		}
		return response;
	}

	@RequestMapping("/delete")
	@ResponseBody
	public AjaxResponse<Donation> deleteDonation(@RequestParam("id") Long id) {
		AjaxResponse<Donation> response = new AjaxResponse<Donation>();
		try {
			donationService.deleteById(id);

		} catch (Exception e) {
			e.printStackTrace();
			response.addMessage("刪除失敗");
		}
		return response;
	}

	@RequestMapping("/update")
	@ResponseBody
	public AjaxResponse<Donation> updateDonation(Donation donation) {
		AjaxResponse<Donation> response = new AjaxResponse<Donation>();
		try {
			Donation updateDonation = donationService.update(donation);
			response.setObj(updateDonation);
		} catch (Exception e) {
			response.addMessage("更新失敗");
		}
		return response;
	}

	@RequestMapping("/queryPage")
	@ResponseBody
	public Page<Donation> queryDonation(Donation inputDonation,
			@RequestParam(name = "start", required = false) Optional<Integer> start,
			@RequestParam(name = "length", required = false) Optional<Integer> length) {
		//required 設為false會傳回null
		int page = start.orElse(0) / length.orElse(10);	
		log.debug("inputDonation={}, start={},length={}" , inputDonation, start, length);
		DonationSpecification donationSpecification = new DonationSpecification(inputDonation);
		Page<Donation> donations = donationService.findBySpecification(donationSpecification,
				PageRequest.of(page, length.orElse(10)));

//		System.out.println("PageRequest=" +PageRequest.of(page, length.orElse(10)));		
//		System.out.println("queryDonation=" +donations.getContent());
//		System.out.println("Total Element Number=" +donations.getTotalElements()+", total page=" + donations.getTotalPages());
		return donations;
	}

	@RequestMapping("/query")
	@ResponseBody
	public List<Donation> queryDonation(Donation inputDonation) {

		DonationSpecification donationSpec = new DonationSpecification(inputDonation);

		List<Donation> donations = donationService.findBySpecification(donationSpec);

		return donations;
	}
	

	@RequestMapping("/turnChartToPdf")
	public ModelAndView turnChartToPdf(HttpServletResponse response, @RequestParam("htmlStr") String htmlStr) throws IOException {
		Map<String, Object> pdfModel = new HashMap<String, Object>();

		//****************************************
//	    JLabel label = new JLabel(htmlStr);
//	    label.setSize(200, 120);
//
//	    BufferedImage image = new BufferedImage(
//	            label.getWidth(), label.getHeight(), 
//	            BufferedImage.TYPE_INT_ARGB);
//
//	    {
//	        // paint the html to an image
//	        Graphics g = image.getGraphics();
//	        g.setColor(Color.BLACK);
//	        label.paint(g);
//	        g.dispose();
//	    }
//
//	    // get the byte array of the image (as jpeg)
//	    ByteArrayOutputStream baos = new ByteArrayOutputStream();
//	    ImageIO.write(image, "jpg", baos);
//	    byte[] bytes = baos.toByteArray();
//	    ImageIO.write(image, "jpg", new File("D://test.png"));
	  //****************************************
		
		// 儲存htmlStr
		pdfModel.put("htmlStr", htmlStr);
		System.out.println(htmlStr);
		response.setHeader("Content-disposition", "attachment; filename=donationChart.pdf");
		
		PdfViewForChart pdfView = new PdfViewForChart();

		return new ModelAndView(pdfView);
	}
	
	
	
	
	@RequestMapping("/chart")
	public String chartPage() {
		return "/admin/others/donationCharts";
	}
	
	//Jasmine
	//待包Service
	@RequestMapping("/donationDatasForChart")
	@ResponseBody
	public List<Object> getDonationDatasForChart() {
		//**************每月捐款總數量統計**************
		//Query查詢每月捐款總數量
		List<Object[]> donateTimeCalByYearAndMonth = donationService.countDonateTimeByYearAndMonth();
		//邏輯:一定要有12筆資料才能畫圖表，然而可能部分月份無資料(無捐款月份無資料，然而圖表仍需顯示0)
		Integer[] totalDonation = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
		for(int i = 0; i < donateTimeCalByYearAndMonth.size(); i++) {
			//取月份
			String strMonth = String.valueOf(donateTimeCalByYearAndMonth.get(i)[0]).substring(4);
			Integer numMonth = Integer.valueOf(strMonth);
			//根據月份塞捐款數到陣列的對應位置
			totalDonation[numMonth-1] = (Integer) donateTimeCalByYearAndMonth.get(i)[1];

		}
		
		
		
		
		
		//**************前三名機構每月捐款數量統計**************
		//Query查詢:查出前三名機構每月捐款數量
		List<Object[]> Top3OrgDonateTimeByYearAndMonth = donationService.countTop3OrgDonateTimeByYearAndMonth();
		
		//Query查詢:只查出前三名機構名稱
		List<String> Top3Org = donationService.countTop3Org();
		
		//邏輯:一定要有12筆資料才能畫圖表，然而可能部分月份無資料(無捐款月份無資料，然而圖表仍需顯示0)
		Integer[] firstOrg = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
		Integer[] secondOrg = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
		Integer[] thirdOrg = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
		
		
		//2018每月X軸內容
		String[] months = new String[12];
		int firstMonth = 201801;
		for(int i = 0; i < months.length; i++) {
			months[i] = String.valueOf(firstMonth++);
		}
		List<String> monthArray = Arrays.asList(months);
		System.out.println(monthArray);
		
		//抓出前三名機構2018年全部資料集
		for(int i = 0; i < Top3OrgDonateTimeByYearAndMonth.size(); i++) {
			//資料集機構名稱
			String thisOrg = String.valueOf(Top3OrgDonateTimeByYearAndMonth.get(i)[0]);
			
			//取月份
			String strMonth = String.valueOf(Top3OrgDonateTimeByYearAndMonth.get(i)[1]).substring(4);
			Integer numMonth = Integer.valueOf(strMonth);
			System.out.println(strMonth + "月");
			System.out.println(numMonth + "月");
			
			//塞資料到前三名機構
			//根據機構、月份塞捐款數到陣列的對應位置
			if(thisOrg.equals(Top3Org.get(0))){
				firstOrg[numMonth-1] = (Integer) Top3OrgDonateTimeByYearAndMonth.get(i)[2];
			};

			if(thisOrg.equals(Top3Org.get(1))){
				secondOrg[numMonth-1] = (Integer) Top3OrgDonateTimeByYearAndMonth.get(i)[2];
			};
			
			if(thisOrg.equals(Top3Org.get(2))){
				thirdOrg[numMonth-1] = (Integer) Top3OrgDonateTimeByYearAndMonth.get(i)[2];
			};
			

		}
		
		//測試，印Console
		List<Integer> firstOrgArray = Arrays.asList(firstOrg);
		List<Integer> secondOrgArray = Arrays.asList(secondOrg);
		List<Integer> thirdOrgArray = Arrays.asList(thirdOrg);
		List<Integer> totalDonationArray = Arrays.asList(totalDonation);
		System.out.println("firstOrgArray=" + firstOrgArray);
		System.out.println("secondOrgArray=" + secondOrgArray);
		System.out.println("thirdOrgArray=" + thirdOrgArray);
		System.out.println("totalDonationArray=" + totalDonationArray);
		
		//**************回傳前端資料**************
		List<Object> result = new ArrayList<>();
		result.add(firstOrg);
		result.add(secondOrg);
		result.add(thirdOrg);
		result.add(totalDonation);
		result.add(Top3Org);
		
		return result;
	}
	
	

}
