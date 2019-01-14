<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html style="height: 100%">
<head>
    <meta charset="utf-8">
    <script
  src="https://code.jquery.com/jquery-3.3.1.slim.js"
  integrity="sha256-fNXJFIlca05BIO2Y5zh1xrShK3ME+/lYZ0j+ChxX2DA="
  crossorigin="anonymous"></script>
</head>
<jsp:include page="../admin_layout/admin_css_js_links.jsp" />
<body style="height: 100%; margin: 0">
	<jsp:include page="../admin_layout/nav.jsp" />
    <div>
    	<c:forEach var="perData" items="${donationCalResult}">
			<c:forEach var="thing" items="${perData}" varStatus="status">
				<c:choose>
					  <c:when test="${status.index=='0'}">
					    <div name="month" style="display: none">${thing}</div>
					  </c:when>
					  <c:when test="${status.index=='1'}">
					    <div name="count" style="display: none">${thing}</div>
					  </c:when>
					  
				</c:choose>
			</c:forEach>
		</c:forEach>
		
<!-- 		Top3OrgDonateTimeByYearAndMonth -->
		<c:forEach var="perData" items="${Top3OrgDonateTimeByYearAndMonth}">
			<c:forEach var="thing" items="${perData}" varStatus="status">
				<c:choose>
					  <c:when test="${status.index=='0'}">
					    <div name="org" style="display: none">${thing}</div>
					  </c:when>
					  <c:when test="${status.index=='1'}">
					    <div name="orgMonth" style="display: none">${thing}</div>
					  </c:when>
					  <c:when test="${status.index=='2'}">
					    <div name="orgCount" style="display: none">${thing}</div>
					  </c:when>
				</c:choose>
			</c:forEach>
		</c:forEach>
    
    </div>
       <div id="container" style="height: 80%"></div>
       <div>捐款統計表(進資料庫查，只查2018)</div>
       <script type="text/javascript" src="http://echarts.baidu.com/gallery/vendors/echarts/echarts.min.js"></script>
       <script type="text/javascript" src="http://echarts.baidu.com/gallery/vendors/echarts-gl/echarts-gl.min.js"></script>
       <script type="text/javascript" src="http://echarts.baidu.com/gallery/vendors/echarts-stat/ecStat.min.js"></script>
       <script type="text/javascript" src="http://echarts.baidu.com/gallery/vendors/echarts/extension/dataTool.min.js"></script>
       <script type="text/javascript" src="http://echarts.baidu.com/gallery/vendors/echarts/map/js/china.js"></script>
       <script type="text/javascript" src="http://echarts.baidu.com/gallery/vendors/echarts/map/js/world.js"></script>
       <script type="text/javascript" src="https://api.map.baidu.com/api?v=2.0&ak=ZUONbpqGBsYGXNIYHicvbAbM"></script>
       <script type="text/javascript" src="http://echarts.baidu.com/gallery/vendors/echarts/extension/bmap.min.js"></script>
       <script type="text/javascript" src="http://echarts.baidu.com/gallery/vendors/simplex.js"></script>
       <script type="text/javascript">

			var dom = document.getElementById("container");
			var myChart = echarts.init(dom);
			var app = {};
			option = null;
			option = {
			    xAxis: {
			        type: 'category',
			        data: ['','', '', '', '','', '','', '', '', '', ''] //從Controller回傳資料填X軸
			    },
			    yAxis: {
			        type: 'value'
			    },
			    series: [{
			        data: [, , , , , , , , , , , , ],//從Controller回傳資料填值
			        type: 'line'
			    }]
			};
			
			var months = $("div[name='month']");
			var data0 = option.xAxis.data;
       		$.each(months,function(idx,value){
    			data0.push($(this).text());
    			data0.shift();
//        			console.log("年月：" + $(this).text()+",")
       			
       		})
       		
       		
       		var counts = $("div[name='count']");
			var data1 = option.series[0].data;
       		$.each(counts,function(idx,value){
    			data1.push(parseInt($(this).text()));
    			data1.shift();
//        			console.log("捐款：" + $(this).text()+",")
       		})
       		
			
			if (option && typeof option === "object") {
			    myChart.setOption(option, true);
			}
       		
       		
       		
       		//處理前三名機構資料
       		var orgs = $("div[name='org']");
       		$.each(orgs,function(idx,value){
    			
       			console.log("前三名機構:" + $(this).text()+",")
       			
       		})
       </script>
   </body>
</html>