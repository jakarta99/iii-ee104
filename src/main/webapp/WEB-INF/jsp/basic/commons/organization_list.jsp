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
<jsp:include page="commons_layout/commons_css_links.jsp" />
<!-- Javascript files-->
<jsp:include page="commons_layout/commons_js_links.jsp" />

</head>
<body>
	<div id="all">
		<!-- Top bar-->
		<jsp:include page="commons_layout/commons_top-bar.jsp" />
		<!-- Navbar -->
		<jsp:include page="commons_layout/commons_nav.jsp" />
		<!-- heading-breadcrumbs -->
		<jsp:include page="commons_layout/commons_heading_breadcrumbs.jsp" />
		

		<div id="content">
			<div class="container">
				<section class="bar">
					
					<div  id="boxbox" class="row portfolio text-center" >
<%-- 						<c:forEach items="${orgMembers}" var="org"> --%>
<!-- 							<div class="col-lg-4"> -->
<!-- 								<div class="home-blog-post"> -->
<!-- 								<div class="product"> -->
<!-- 									<div class="image"> -->
<%-- 										<a href="${org.orgWebsiteLink}" class="btn btn-template-outlined-white">			 --%>
<%-- 											<img src="${org.picture}"  class="image1" width="300px"  height="230px" > --%>
<!-- 										</a> -->
										
<!-- 									</div> -->
<!-- 									</div> -->
<!-- 									<div class="text"> -->
<!-- 										<h4 style="width:270px; margin:auto; margin-bottom:10px" > -->
<%-- 											<a href="${org.orgWebsiteLink}">${org.account} </a> --%>
<!-- 										</h4> -->
<!-- 										<p class="author-category" > -->
<%-- 											<span  style="color:#999">${org.account}</span> --%>
<!-- 										</p> -->
<%-- 										<a href="${org.orgWebsiteLink}" class="btn btn-template-outlined">更多資訊</a> --%>
<!-- 									</div>							 -->
<!-- 								</div> -->
<!-- 							</div> -->
<%-- 						</c:forEach>						 --%>
					</div>
					<nav aria-label="Page navigation example">
	                    <ul id ="pagebox" class="pagination pagination-lg">
	              		</ul>
                  </nav>
				</section>
			</div>
		</div>
		
	

		
				
			
		<!-- FOOTER -->
		<jsp:include page="commons_layout/commons_footer.jsp" />
 		<jsp:include page="commons_layout/back-to-top_button.jsp"/>
	</div>

	<script>
		var length=9;
		var page=0;
		var first;
		var last;
	
		$("#searchButt").click(function(){
			list();
 		
		})

	
	
		function list(){
			$.ajax({
				url:"/commons/organization/query?page="+page+"&length="+length,
				type: "get",
			    dataType : "json",
			    
		        }).done(function(data){
		        	$("#boxbox").text("");
		        	$("#pagebox").text("");
		        	console.log(data);
		        	
		        	var totalElements=data.totalElements;
		        	console.log(totalElements);
		        	
		        	var totalPages=data.totalPages;
		        	console.log(totalPages);
		        	
		        	first=data.first;
		        	console.log(first);
		        	
		        	last=data.last;
		        	console.log(last);
		        	
		        	page=data.number;
		        	
		        	
		        	$.each(data.content,function(index, org){
		        		var box="<div class='col-lg-4'>";
		        		 box+="<div class='home-blog-post'><div class=\"product\">";
		        		 box+="<div class='image'><a href='"+org.orgWebsiteLink +"' class=\"btn btn-template-outlined-white\">";
		        		 box+= "<img width='250px' height='200px' src='/image/user/member/"+org.picture+"' class=\"image1\"></a></div></div>";
		        		 box+= "<div class=\"text\">";
		        		 box+= "<h4 style=\"width:270px; margin:auto; margin-bottom:10px\" >";
		        		 box+= "<a href='"+ org.orgWebsiteLink +"'>"+org.name+ "</a></h4>";
		        		 
		        		 box+="<p><table style=\"margin:auto; \">";
		        		 box+= "<tr><td width=\"70px\">地區:</td><td width=\"100px\"> "+org.county + org.district +"</td></tr>";
		        		 box+= "<tr><td width=\"70px\">電話:</td><td width=\"100px\"> "+org.telephone +"</td></tr>";

		        		 
		        		 box+= "</table></p>"
		        		 box+="</div></div></div>";   
		        		var boxbox=$("#boxbox").append(box); 
		        		
	
			
// 		        		<p>
// 						<table style="margin:auto;">
// 							<tr><td width="70px">服務地區: </td><td width="200px"> 
// 								${volunteer.country}${volunteer.place}
// 							</td></tr>
							
// 						</table>
// 					</p>
		        		
		        		
		        		
		        		

		        		
		        		
		        		
		        	})
		        	
		        		$("#pagebox").append("<li class='page-item' id='backli'><a name='backa' class='page-link'>«</a></li><li class='page-item' id='nextli'><a name='nexta' class='page-link'>»</a></li>");
		        	for (var index = 1; index <= totalPages ; index++) {
		        		$("#nextli").before("<li id='page"+index+"' class='page-item'><a name='count' id="+index+" class='page-link'>"+index+"</a></li>")
					}
		        	var pageNo = "#page" + (page+1);
		        	console.log(pageNo)
		        	$(pageNo).addClass("page-item active")
		    
		    
		        })
		        
		}
	

		$(document).ready( function () {	
			$("#heading-breadcrumbs>div>div>div.col-md-7>h1").text("公益團體");	
			list();
			
			$("#pagebox").on("click","li>a[name='backa']", function(){
				if(first == false){
					page = page - 1;
					list();
				}
				 $('body,html').animate({
	                 scrollTop: 0 }, 1);
			}) 
			
			$("#pagebox").on("click","li>a[name='nexta']", function(){
					if(last == false){
						page = page + 1;
						list();
					}
					 $('body,html').animate({
		                 scrollTop: 0 }, 1);
			 })
	
	    	$("#pagebox").on("click","li>a[name='count']", function(){			
	    		page=$(this).text()-1;
	    		list();
	    		 $('body,html').animate({
	                 scrollTop: 0 }, 1);
	    	})
	    	
	    	
	    	
		
		})
	</script>




</body>
</html>