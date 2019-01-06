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
		
		<a href="/commons/InternationalVolunteer/search" >國際志工專區-搜尋</a> 
		<div id="content">
			<div class="container">
				<section class="bar">
					<div class="row">
						<div class="col-md-12">
<!-- 							<div class="heading"> -->
<!-- 								<h2>國際志工專區</h2> -->
<!-- 							</div> -->
							 <h4 class="h4"><a href="#" onclick="doSpider()">若無資料，請按此進行爬蟲功能	</a>
							 	<span id="msg"></span></h4>
							<p class="lead">TimeBank時間銀行整理了多家機構招募國際志工的資訊，
								您可以在這裡選擇自己有興趣的範疇及時間，再到機構的官網報名參加和獲得更詳細的資訊。</p>
						</div>
					</div>
					<div class="row portfolio text-center" >
						<c:forEach items="${IVolunteers}" var="volunteer">
							<div class="col-lg-4">
								<div class="home-blog-post">
								<div class="product">
									<div class="image">
										<a href="${volunteer.websiteUrl}" class="btn btn-template-outlined-white">			
											<img src="${volunteer.picture}"  class="image1" width="300px"  height="230px" >
										</a>
										
									</div>
									</div>
									<div class="text">
										<h4 style="width:270px; margin:auto; margin-bottom:10px" >
											<a href="${volunteer.websiteUrl}">${volunteer.title} </a>
										</h4>
										<p class="author-category" >
											<span  style="color:#999">${volunteer.organization}</span>
										</p>
										<p>
											<table style="margin:auto;">
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
			
			$(".image img").click(function(){
				
				
			})
		})
	
	</script>


</body>
</html>