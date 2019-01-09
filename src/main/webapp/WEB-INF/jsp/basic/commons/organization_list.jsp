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

</head>
<body>
	<div id="all">
		<!-- Top bar-->
		<jsp:include page="commons_layout/commons_top-bar.jsp" />
		<!-- Navbar -->
		<jsp:include page="commons_layout/commons_nav.jsp" />
		<!-- heading-breadcrumbs -->
		<jsp:include page="commons_layout/commons_heading_breadcrumbs.jsp" />
		

		<div id="content" style='margin-top:50px'>
			<div class="container" id='searchbox'>
				<!--查詢 -->
	          <div class="panel panel-default sidebar-menu">
	            <div class="panel-body">
	            	<form role="search">
	                	<div class="input-group">                                        
	                    	<div  role="tw-city-selector"></div>                                       
		                    <div class="form-group">
			                    <select  id="serviceTypeDetail" name="serviceTypeDetail" class="form-control">
									<option value="">服務類型</option>
									<option value="婦幼關懷">婦幼關懷</option>
							        <option value="身心障礙">身心障礙</option>
							        <option value="老人服務">老人服務</option>
							        <option value="社會服務">社會服務</option>
							        <option value="動物保護">動物保護</option>
							        <option value="國際救援">國際救援</option>
							        <option value="環境保護">環境保護</option>
							        <option value="文教藝術">文教藝術</option>
							        <option value="醫療服務">醫療服務</option>
							        <option value="宗教信仰">宗教信仰</option>
								</select>
							</div>					
		                    <div class="form-group">
		                    	<input type="text" value="" placeholder="請輸入關鍵字" id="title" name="title" class="form-control">
		                    </div>
	                    
		                    <span class="input-group-btn form-group">
		                    
		                    	<input  type="button" value="搜尋" id="searchButt" class="btn btn-outline-primary" >               
		                    </span>
	                    </div>
	                  </form>
	                </div>
	              </div>
				
			</div>
			<div class="container container-1">
				<section class="bar">
					
					<div  id="boxbox" class="row portfolio text-center" >

					</div>
					<nav aria-label="Page navigation example" class="d-flex justify-content-center">
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
		        		 box+="<a href='"+org.orgWebsiteLink +"' class=\"btn \" >";
		        		 box+= "<img width='300px'  height='200px' src='/image/user/member/"+org.picture+"' style='border:2px solid rgb(19, 181, 177, 0.5)' class=\"image1\"></a></div>";
		        		 box+= "<div class=\"text\">";
		        		 box+= "<h4 style=\"width:270px; margin:auto; margin-bottom:10px\" >";
		        		 box+= "<a href='"+ org.orgWebsiteLink +"'>"+org.name+ "</a></h4>";	        		 
		        		 box+="<p><table style=\"margin:auto; \">";
		        		 box+= "<tr><td width=\"70px\">地區:</td><td width=\"100px\"> "+org.county + org.district +"</td></tr>";
		        		 box+= "<tr><td width=\"70px\">電話:</td><td width=\"100px\"> "+org.telephone +"</td></tr>";
		        		 box+= "</table></p>"
		        		 box+="</div></div></div>";   
		        		var boxbox=$("#boxbox").append(box); 
		        		
		        		
		        	})
		        	
		        	$("#pagebox").append("<li class='page-item' id='backli'><a name='backa' class='page-link'>«</a></li><li class='page-item' id='nextli'><a name='nexta' class='page-link'>»</a></li>");
		        	for (var index = 1; index <= totalPages ; index++) {
		        		$("#nextli").before("<li id='page"+index+"' class='page-item'><a name='count' id="+index+" class='page-link'>"+index+"</a></li>")
					}
		        	var pageNo = "#page" + (page+1);
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