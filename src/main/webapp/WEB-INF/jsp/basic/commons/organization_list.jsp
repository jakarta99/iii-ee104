<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TimeBank - 公益團體</title>
<!-- css -->
<jsp:include page="commons_layout/commons_css_links.jsp"/>
<!-- Javascript files-->
<jsp:include page="commons_layout/commons_js_links.jsp" />

</head>
<body>
	<div id="all">
	 	<!-- Top bar-->
      	<jsp:include page="commons_layout/commons_top-bar.jsp"/>
 		<!-- Navbar -->
		<jsp:include page="commons_layout/commons_nav.jsp" />
		<!-- commons_heading_breadcrumbs -->
	    <jsp:include page="commons_layout/commons_heading_breadcrumbs.jsp"/>
     
      <div id="content">
        <div class="container">
          <div class="row bar">
     
     		<!--志工招募清單 -->
	         <div>
	              <div id="boxbox" class="row portfolio text-center">
	
	               </div>
	               
	               
	              <nav aria-label="Page navigation example">
	              	<ul id ="pagebox" class="pagination pagination-lg">
	              	</ul>
	              </nav>
	         </div>
     
			<!--查詢 -->
<!-- 	          <div class="panel panel-default sidebar-menu"> -->
<!-- 	          	<div class="panel-heading"> -->
<!-- 	            	<h2 class="h2 panel-title">志工招募</h2> -->
<!-- 	            </div> -->
<!-- 	            <div class="panel-body"> -->
<!-- 	            	<form role="search"> -->
<!-- 	                	<div class="input-group"> -->
	                                        
<!-- 	                    	<div  role="tw-city-selector"></div>                     -->
	                    
<!-- 		                    <div class="form-group"> -->
<!-- 			                    <select  id="serviceTypeDetail" name="serviceTypeDetail" class="form-control"> -->
<!-- 									<option value="">服務類型</option> -->
<!-- 									<option value="婦幼關懷">婦幼關懷</option> -->
<!-- 							        <option value="身心障礙">身心障礙</option> -->
<!-- 							        <option value="老人服務">老人服務</option> -->
<!-- 							        <option value="社會服務">社會服務</option> -->
<!-- 							        <option value="動物保護">動物保護</option> -->
<!-- 							        <option value="國際救援">國際救援</option> -->
<!-- 							        <option value="環境保護">環境保護</option> -->
<!-- 							        <option value="文教藝術">文教藝術</option> -->
<!-- 							        <option value="醫療服務">醫療服務</option> -->
<!-- 							        <option value="宗教信仰">宗教信仰</option> -->
<!-- 								</select> -->
<!-- 							</div> -->
						
<!-- 							<div class="form-group"> -->
<!-- 								<select  id="termType" name="termType" class="form-control"> -->
<!-- 									<option value="">長短期</option> -->
<!-- 									<option value="L">長期</option> -->
<!-- 							        <option value="S">短期</option> -->
<!-- 								</select> -->
<!-- 							</div> -->
						
<!-- 		                    <div class="form-group"> -->
<!-- 		                    	<input type="text" value="" placeholder="請輸入關鍵字" id="title" name="title" class="form-control"> -->
<!-- 		                    </div> -->
	                    
<!-- 		                    <span class="input-group-btn"> -->
		                    
<!-- 		                    	<input  type="button" value="搜尋" id="searchButt" class="btn btn-outline-primary" >                -->
<!-- 		                    	<button type="submit" class="btn btn-template-main"><i class="fa fa-search"></i></button> --> 
<!-- 		                    </span> -->
<!-- 	                    </div> -->
<!-- 	                  </form> -->
<!-- 	                </div> -->
<!-- 	              </div>  -->



				</div>
			</div>
		</div>
         
         
         
      </div>
 
     



	<jsp:include page="commons_layout/commons_footer.jsp"/>
	
	
	
	
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
	        	
	        	
	        	$.each(data.content,function(index, orgMember){
	        		var box1="<div class='col-lg-4 col-md-6'>";
	        		var box2="<div class='home-blog-post'><div class='product'>";
	        		var box3="<div class='image'><img src=../../img/"+orgMember.picture+" alt='...' class='img-fluid'  height='300'>";
	        		var box5="</div><div class='text'><h4><a href='/commons/domesticVolunteer/apply?missionId="+orgMember.id+"'>"+ orgMember.account + "</a></h4>";
	        		var box7="<p class='author-category'>活動地點:"+orgMember.county+orgMember.district+"</p>";        	
	        		var box9="</div></div></div></div>";   
	        		var boxbox=$("#boxbox").append([box1+box2+box3+box5+box7+box9]); 
	  
	        		
	        		var boxbox=$("#boxbox").append(box1); 
	        		
	        		
	        		
	        		
	        		
	        	})
	        	
	        		$("#pagebox").append("<li class='page-item' id='backli'><a name='backa' class='page-link'>«</a></li><li class='page-item' id='nextli'><a name='nexta' class='page-link'>»</a></li>");
	        	
	        	for (var index = 1; index <= totalPages ; index++) {
	        		$("#nextli").before("<li class='page-item'><a name='count' id="+index+" class='page-link'>"+index+"</a></li>")
				}
	    
	    
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