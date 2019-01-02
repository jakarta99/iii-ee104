<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>	
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
	$.get("/commons/InternationalVolunteer/spidertest1", function(msg){
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
										<a href="#" class="btn btn-template-outlined-white">			
											<img src="${volunteer.picture}" alt="..." class="image1" width="300px"  height="230px" >
										</a>
										
									</div>
									</div>
									<div class="text">
										<h4>
											<a href="#">${volunteer.title} </a>
										</h4>
										<p class="author-category" >
											<a href="${volunteer.websiteUrl}" style="color:#999">${volunteer.organization}</a>
										</p>
										<p>
											<table style="margin:auto;">
												<tr><td width="70px">服務地點: </td><td width="200px"> ${volunteer.place}</td></tr>
											</table>
										</p>
										<a href="#" class="btn btn-template-outlined">更多資訊</a>
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
		<jsp:include page="../commons_layout/member_info_sidebar.jsp" />  
	</div>

	<script>
		$(document).ready(function(){
			$("#heading-breadcrumbs>div>div>div.col-md-7>h1").text("國際志工專區");
			
			
		})
	
	</script>


</body>
</html>