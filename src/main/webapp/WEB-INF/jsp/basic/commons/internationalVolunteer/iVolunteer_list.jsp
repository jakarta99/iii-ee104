<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>	
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>TimeBank時間銀行-國際志工專區</title>
<!-- css -->
<jsp:include page="../commons_layout/commons_css_links.jsp" />
<!-- Javascript files-->
<jsp:include page="../commons_layout/commons_js_links.jsp" />
<!-- date picker -->
<script type="text/javascript" src="/js/datepicker/moment.min.js"></script>
<script type="text/javascript" src="/js/datepicker/bootstrap-datepicker.js"></script>
<script src="/js/datepicker/bootstrap-datepicker.zh-TW.js"></script>
<link rel="stylesheet" href="/css/bootstrap-datepicker3.min.css" />

<style>

.container-1{
 	background-color: rgba(234, 234, 234); 
	max-width: 1500px;
	border-radius: 3px;
	
}
.row{
	margin:auto;
}
.owl-dots {
    display: none;
}
.panel-body{
	background-color: rgba(200, 200, 200); 
	border-radius: 5px;
	margin-bottom:20px;

}
.input-group{
	width: 930px;
    margin: auto;
}
.form-group{
	padding:30px 0px;
	padding-left:20px;
	margin:auto;
}
.input-group .btn, .form-control{	
	border-radius: 3px;
	font-size: 16px;
    height: 52px !important;
}

.btn-outline-primary {
    color: #fff;
    background-color: #13B5AD;
    border-color: #13B5AD;  
}
.btn-outline-primary:hover {
/* 	color: #13b5b1; */
    background-color: transparent;
    background-image: none;
    border-color:rgb(19, 181, 177, 0.8);
    background-color: rgb(19, 181, 177, 0.8);
}
</style>
<script>
function doSpider(){
	$.get("/commons/InternationalVolunteer/spidertest", function(msg){
		alert(msg);
	})
}

function query(){
	$.ajax({
		url:"/commons/organization/query?page="+page+"&length="+length,
		type: "get",
	    dataType : "json",
	 }).done(function(data){
		 
	 })
}
</script>
</head>
<body>
	<div id="all">
		<!-- Top bar-->
		<jsp:include page="../commons_layout/commons_top-bar.jsp" />
		<!-- Navbar -->
		<jsp:include page="../commons_layout/commons_nav.jsp" />
		
<!-- 			Carousel Start -->
		<section>
			<div class="home-carousel">
				<div class="homepage owl-carousel" style="padding-top: 0;">
					<div class="item">
						<div class="row">
							<img class="ml-auto"
								src="https://media.goeco.org/_media/media/422/11924_1903_546.jpg" >					
						</div>
					</div>
					<div class="item">
						<div class="row">
							<img class="ml-auto" 
								src="https://media.goeco.org/_media/media/422/11950_1903_546.jpg" >

						</div>
					</div>
				</div>
			</div>
		</section>
<!-- 			Carousel End -->

		
		<div id="content" >
			<div class="container" >
				<div class="panel-body" >
	            	<form action="/commons/InternationalVolunteer/list" method="get" role="search">
	                	<div class="input-group" >                                                                               
		                    <div class="form-group" >
								<select id="continent" 
									name="continent" class="form-control">
									<option value="東南亞">東南亞</option>
									<option value="中南亞">中南亞</option>
									<option value="東亞">東亞</option>
									<option value="東非">東非</option>
									<option value="西非">西非</option>
									<option value="南非">南非</option>
									<option value="北美洲">北美洲</option>
									<option value="中美洲">中美洲</option>
									<option value="南美洲">南美洲</option>
									<option value="歐洲">歐洲</option>
									<option value="大洋洲">大洋洲</option>
									
								</select>	
						</div>
					
						<div class="form-group">
								<input type="text" placeholder='出發日期' class="form-control" value="${param.dateChosenStart }"  id="dateChosenStart" name="dateChosenStart" autocomplete="off" style="width:200px;display:inline" />
						</div>
						<div class="form-group">	
								<input type="text" placeholder='返回日期'  class="form-control" value="${param.dateChosenEnd }" id="dateChosenEnd" name="dateChosenEnd" autocomplete="off" style="width:200px;display:inline"/>	
						</div>
					
	                    <div class="form-group">
	                    	<input type="text" value="" placeholder="請輸入關鍵字" id="title" name="title" class="form-control">
	                    </div>
                    
	                    <span class="input-group-btn form-group">
	                    
	                    	<input type="submit" value="搜尋" id="searchButt" class="btn btn-outline-primary" onclick="query()">               
	                    </span>
                    </div>
                  </form>
                </div>
			</div>
			<div class="container-1 container" >
			
				<section class="bar" style="padding: 30px 0;">
					<div class="row portfolio text-center" >
						<c:forEach items="${IVolunteers}" var="volunteer">
							<div class="col-lg-4">
								<div class="home-blog-post">
								<div class="product">
										<a href="${volunteer.websiteUrl}">			
											<img src="${volunteer.picture}"  class="image1" width="400px"  height="250px" >
										</a>
									</div>
									<div class="text">
										<h3 style="width:370px; margin:auto; margin-bottom:10px; "  >
											<a href="${volunteer.websiteUrl}">${volunteer.title} </a>
										</h3>
										<p class="author-category" >
											<span  >${volunteer.organization}</span>
										</p>
										<p>
											<table style="margin:auto;color:rgba(125, 125, 125)">
												<tr><td width="70px">服務地區: </td><td width="200px"> 
													<c:if test="${not empty volunteer.country}">${volunteer.country}
														<c:if test="${not empty volunteer.place}">${volunteer.place}</c:if>
													</c:if>
												</td></tr>
												<tr><td width="70px">服務時間: </td><td width="200px">
													<c:choose>
	  													<c:when test="${empty volunteer.startDate}">自由選擇，沒有限定</c:when>
	 													<c:otherwise>
	 														<fmt:formatDate value="${volunteer.startDate}" pattern="yyyy/MM/dd"/> - 
	 														<fmt:formatDate value="${volunteer.endDate}" pattern="yyyy/MM/dd"/>
	 													</c:otherwise>
													</c:choose>
												</td></tr>
											</table>
										</p>
										<a href="${volunteer.websiteUrl}" class="btn btn-template-outlined">更多資訊</a>
									</div>							
								</div>
							</div>
						</c:forEach>						
					</div>
				</section>
			</div>
		</div>
				<h4 class="h4"><a href="#" onclick="doSpider()">若無資料，請按此進行爬蟲功能	</a></h4>
	

		
				
			
		<!-- FOOTER -->
		<jsp:include page="../commons_layout/commons_footer.jsp" />
 		<jsp:include page="../commons_layout/back-to-top_button.jsp"/>
	</div>

  <script src="/js/voyage/jquery-migrate-3.0.1.min.js"></script>
  <script src="/js/voyage/jquery.easing.1.3.js"></script>
  <script src="/js/voyage/jquery.waypoints.min.js"></script>
  <script src="/js/voyage/jquery.stellar.min.js"></script>
  <script src="/js/voyage/owl.carousel.min.js"></script>
  <script src="/js/voyage/jquery.magnific-popup.min.js"></script>
  <script src="/js/voyage/aos.js"></script>
<!--   <script src="js/jquery.animateNumber.min.js"></script> -->
<!--   <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script> -->
<!--   <script src="js/google-map.js"></script> -->
  <script src="/js/voyage/main.js"></script>
	<script>
		$(document).ready(function(){
			
			var datePickerSetting = {
					format : "yyyy/mm/dd",
					autoclose : true,
					todayHighlight : true,
					language : 'zh-TW',
					clearBtn:true,
					startView:"2",
				};			
			$('#dateChosenStart').datepicker(datePickerSetting);
			$('#dateChosenEnd').datepicker(datePickerSetting);
			$("#continent").val('${IVolunteers[0].continent}');

			
			
			
		})
	

	</script>


</body>
</html>