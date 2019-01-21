<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>	
<!DOCTYPE html>
<html>
<head>
<!-- sweet alert -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.css">  
	
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>公益團體 | TimeBank</title>
<!-- css -->
<jsp:include page="commons_layout/commons_css_links.jsp" />
<!-- Javascript files-->
<jsp:include page="commons_layout/commons_js_links.jsp" />
<style>
	body{
		font-family: 微軟正黑體;
	}
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
	
	a.ex1:hover {
/* 	 	font-size:110%; */
	    text-decoration: none;
	    color: red; 
	}
	
	.s3{
    	color: #FF0000;
	}
</style>

</head>
<body>
	<div id="all">
		<!-- Top bar-->
		<jsp:include page="commons_layout/commons_top-bar.jsp" />
		<!-- Navbar -->
		<jsp:include page="commons_layout/commons_nav.jsp" />
		<!--heading crumbs-->
		<section style="background: url('/banner/1607281721280.jpg') center center repeat;padding:12rem 0" class="bar background-white relative-positioned">
			<div class="dark-mask "></div>
	       	<div class="container">
	         <div class="row d-flex align-items-center flex-wrap">
	             <h1 class="h2"  style="margin:auto;color:#fff;font-size:42px;">公益團體</h1>
	         </div>
	       </div>
	    </section> 

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
		
		function insertCollection(id) { 	
 				 $.ajax({
 					url : '/user/myCollection/insertOrganization?id=' + id,
 					type : 'get',
 					dataType : 'JSON',
 					success : function(cancelResult) {
 						if(cancelResult.status == "SUCCESS"){
 							swal("收藏成功!", "加入我的收藏成功!", "success");
 						}else{ 							
 						} 						
 						list();								
 					},
 				}).fail(function( jqXHR, textStatus){
					if(jqXHR.status == 200){
						$("#login-modal").addClass("modal fade show");
			    	   	$("#login-modal").css("display","block");
			    	   	$("#login-modal").css("padding-right","17px");
			    		$("#action").val("Id="+id);
			    	   	
					}
 					
 				}) 				   			   
		}
		
		function cancelCollection(id) { 		
			 $.ajax({
				url : '/user/myCollection/cancelOrganization?id=' + id,
				type : 'post',
				dataType : 'JSON',
				success : function(cancelResult) {
					if(cancelResult.status == "SUCCESS"){ 							
					}else{ 							
					} 						
					list();								
				},
			}) 				   			   
		}

	
	
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
		        		 if(org.isCollected=='Y'){
			        		 box+="<p><a name='box1' class='s3 ex1' href='javascript:void(0)' onclick=\"cancelCollection("+org.id+")\"><i name='pic1' class='fa fa-heart'></i>已收藏</a></p>"
			        		 }else{																										
			        		 box+="<p><a name='box2' class='s3 ex1' href='javascript:void(0)' onclick=\"insertCollection("+org.id+")\"><i name='pic2' class='far fa-heart'></i>收藏</a></p>"	 
			        		 }
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
		
			//將首頁的nav標籤標註
			$("#navbar .navbar-nav > li > a[href='/commons/organization/list']")
				.css("background","rgba(19, 181, 177, 0.9)")
				.css("color"," rgba(240, 240, 240)");
		   
	
		
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
	    	
	    	$("#boxbox").on("mouseover","a[name='box2']",function(){
				$(this).empty().append("<i name='pic1' class='fa fa-heart'></i>收藏")
			})
			
			$("#boxbox").on("mouseout","a[name='box2']",function(){
				$(this).empty().append("<i name='pic1' class='far fa-heart'></i>收藏")
			})
			
			if (${!empty Id}){
				console.log('${Id}')
				insertCollection('${Id}');
			}
	    	
	    	
		
		})
	</script>




</body>
</html>