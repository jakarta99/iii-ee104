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
	margin-top:30px;max-width: 1500px;
	border-top-left-radius:3px;
	border-top-right-radius:3px;
	border-bottom-left-radius:3px;
	border-bottom-right-radius:3px;
	
}

.form-group{
	padding-left:20px;
}
.form-control{
border-radius: 3px;
}

</style>
<script>
function doSpider(){
	$.get("/commons/InternationalVolunteer/spidertest", function(msg){
		alert(msg);
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
		<!-- heading-breadcrumbs -->
		<jsp:include page="../commons_layout/commons_heading_breadcrumbs.jsp" />
<!-- 		<h4 class="h4"><a href="#" onclick="doSpider()">若無資料，請按此進行爬蟲功能	</a></h4> -->
<!-- 		<a href="/commons/InternationalVolunteer/search" >國際志工專區-搜尋</a>  -->
		<div id="content" style='margin-top:50px'>
			<div class="container" >
				<div class="panel-body">
            	<form role="search">
                	<div class="input-group">                                                                               
	                    <div class="form-group" >
							<select id="continent" 
									name="continent" class="form-control">
									<option>東非</option>
									<option>西非</option>
									<option>南非</option>
									<option>東亞</option>
									<option>東南亞</option>
									<option>中南亞</option>
									<option>北美洲</option>
									<option>中美洲</option>
									<option>南美洲</option>
									<option>歐洲</option>
									<option>大洋洲</option>
									
								</select>	
						</div>
					
						<div class="form-group">
								<input type="text" placeholder='出發時間' class="form-control" value="${param.dateChosenStart }"  id="dateChosenStart" name="dateChosenStart" autocomplete="off" style="width:200px;display:inline" />
						</div>
						<div class="form-group">	
								<input type="text" placeholder='回來時間'  class="form-control" value="${param.dateChosenEnd }" id="dateChosenEnd" name="dateChosenEnd" autocomplete="off" style="width:200px;display:inline"/>	
						</div>
					
	                    <div class="form-group">
	                    	<input type="text" value="" placeholder="請輸入關鍵字" id="title" name="title" class="form-control">
	                    </div>
                    
	                    <span class="input-group-btn form-group">
	                    
	                    	<input type="button" value="搜尋" id="searchButt" class="btn btn-outline-primary">               
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
		
	

		
				
			
		<!-- FOOTER -->
		<jsp:include page="../commons_layout/commons_footer.jsp" />
 		<jsp:include page="../commons_layout/back-to-top_button.jsp"/>
	</div>

	<script>
		$(document).ready(function(){
			$("#heading-breadcrumbs>div>div>div.col-md-7>h1").text("國際志工專區");	
			
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
		})
	

	</script>


</body>
</html>