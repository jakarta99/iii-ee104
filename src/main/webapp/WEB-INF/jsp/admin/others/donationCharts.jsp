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
<body style="height: 100%; margin: 0; font-family: 微軟正黑體">
	<jsp:include page="../admin_layout/nav.jsp" />

       <div id="container" style="height: 60%; width:80%; margin-top: 150px;margin-left: auto; margin-right: auto;"></div>
       
       <form action="/admin/donation/turnChartToPdf" method="post" onsubmit="getHtmlStr()">
	       <input type="hidden" id="htmlStr" name="htmlStr" >
<!-- 	       <input type="submit" id="chartPDFbtn" value="產PDF檔"> -->
       </form>
       <div></div>
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
       
       
       		var totalDatas;
       		var firstOrg;
       		var secondOrg;
       		var thirdOrg;
       		var OrgsName;
       
       
			var dom = document.getElementById("container");
			var myChart = echarts.init(dom);
			var app = {};
			option = null;

       		
       		//用ajax取得前三名及總計資料
       		$.ajax({
  			url:"/admin/donation/donationDatasForChart",
  			method:"post",
  			dataType : "json",
  			success : function(result){
  				totalDatas=result[3];
  				firstOrg=result[0];
  				secondOrg=result[1];
  				thirdOrg=result[2];
  				OrgsName=result[4];
  				
  				myChart.setOption(
  				option = {
  					    title: {
  					        text: '2018年捐款統計圖'
  					    },
  					    tooltip : {
  					        trigger: 'axis',
  					        axisPointer: {
  					            type: 'cross',
  					            label: {
  					                backgroundColor: '#6a7985'
  					            }
  					        }
  					    },
  					    legend: {
  					        data:['總捐款時數',"全年第一名:" + OrgsName[0],'全年第二名:' + OrgsName[1],'全年第三名:' + OrgsName[2]]
  					    },
  					    toolbox: {
  					        feature: {
  					            saveAsImage: {}
  					        }
  					    },
  					    grid: {
  					        left: '3%',
  					        right: '4%',
  					        bottom: '3%',
  					        containLabel: true
  					    },
  					    xAxis : [
  					        {
  					            type : 'category',
  					            boundaryGap : false,
  					            data : ['2018/1','2018/2','2018/3','2018/4','2018/5','2018/6','2018/7','2018/8','2018/9','2018/10','2018/11','2018/12']
  					        }
  					    ],
  					    yAxis : [
  					        {
  					            type : 'value'
  					        }
  					    ],
  					  	series: [
  					        {
  					            name:'總捐款時數',
  					            type:'line',
  					            stack: '總量',
  					            areaStyle: {},
  					            data:totalDatas,
  					        },
  					        {
  					            name:"全年第一名:" + OrgsName[0],
  					            type:'line',
  					            stack: '總量',
  					            areaStyle: {},
  					            data:firstOrg,
  					        },
  					        {
  					            name:'全年第二名:' + OrgsName[1],
  					            type:'line',
  					            stack: '總量',
  					            areaStyle: {},
  					            data:secondOrg,
  					        },
  					        {
  					            name:'全年第三名:' + OrgsName[2],
  					            type:'line',
  					            stack: '總量',
  					            areaStyle: {},
  					            data:thirdOrg,
  					        }
  					    ]
  					}
  				
  				
  				)
  			},
  		})	
			
       	
		//將本頁html資料存到input
		function getHtmlStr(){
			var r = $("html").html();
			$("#htmlStr").val(r);
	  		console.log(r);
		}
       		
       </script>
   </body>
</html>