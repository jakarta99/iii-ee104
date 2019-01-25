<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<!-- Javascript files-->
<jsp:include page="../../commons/commons_layout/commons_js_links.jsp" />
<link rel="stylesheet" href="/css/bootstrap-datepicker3.min.css" />
	
<jsp:include page="../../commons/commons_layout/commons_css_links.jsp"/>
<!-- sweet alert -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.css">  
	


<meta charset="UTF-8">
<title>我的收藏 | TimeBank</title>
<style>
		a.ex1:hover,a.ex1:focus {
/* 		 	font-size:110%; */
		    text-decoration: none;
		    color: red; 
		}
		
		.s3{
	    color: #FF0000;
		}
		.bar_1 {
			margin-top:30px;
			margin-bottom:20px;
		  padding-top: 30px;
		  text-align:center;
		  background-color:#DDDDDD;
		  border-radius: 10px;
/* 		  width:500px; */
/* 		  height:50px; */
		}
		.input-group{
			width: 1100px;
	    	margin: auto;
		}
 		.form-group{ 
 			padding-bottom: 20px; 
/*  		    padding-left: 5px;  */
 		    margin: auto;
 		    width:150px 
 		} 
		
		
	 	
        fieldset {
            width: 100%;
            border-radius: 20px;
            padding: 20px;
            margin: 20px;
            border: 3px double #bebebe;
            margin: auto
        }
        .s2{
            text-align: center
        }
        .margintop{
			 margin-top:70px;
		}
		.form-control{
		display: block;
		    width: 100%;
		    padding: .375rem .75rem;
		    font-size: 1rem;
		    line-height: 1.5;
		    color: #495057;
		    background-color: #fff;
		    background-clip: padding-box;
		    border: 1px solid #ced4da;
		    border-radius: .25rem;
		    transition: border-color .15s ease-in-out,box-shadow .15s ease-in-out;
		}
		.county,.district {
			margin-left:25px;
			float:left;
			display: block;
		    width: 150px;
		    padding: .375rem .75rem;
		    font-size: 1rem;
		    line-height: 1.5;
		    color: #495057;
		    background-color: #fff;
		    background-clip: padding-box;
		    border: 1px solid #ced4da;
		    border-radius: .25rem;
		    transition: border-color .15s ease-in-out,box-shadow .15s ease-in-out;
		}
		.s4{
		margin-left:40px;
		margin-right:40px;
		}
 
    </style>
</head>
<body>

 	<!-- Top bar-->
    <jsp:include page="../../commons/commons_layout/commons_top-bar.jsp"/>
    <!-- Navbar -->
    <jsp:include page="../../commons/commons_layout/commons_nav.jsp"/>
	<!--heading crumbs-->
	<jsp:include page="../../commons/commons_layout/commons_heading_breadcrumbs_member_area.jsp" />
      <div id="content">
        <div class="container">
			<!--我的最愛清單 -->
	        <section class="post_1" >
		        <div id="boxbox" class="row">
		        </div>
		    	<nav aria-label="Page navigation example" class="d-flex justify-content-center">
		        <ul id ="pagebox" class="pagination pagination-lg">
		   		</ul>
		        </nav>
	        </section> 
        </div>
        </div>
<jsp:include page="../../commons/commons_layout/commons_footer.jsp"/>
	<script>
	var length=9;
	var page=0;
	var first;
	var last;
	function cancelCollection(id) {			
		 $.ajax({
			url : '/user/myCollection/cancelMission?id=' + id,
			type : 'post',
			dataType : 'JSON',
			success : function(cancelResult) {
				list();								
				swal("取消收藏成功!", "取消我的收藏成功!", "success");
			}
		})
	}
	function cancleORG(id){
		 $.ajax({
				url : '/user/myCollection/cancelOrganization?id=' + id,
				type : 'post',
				dataType : 'JSON',
				success : function(cancelResult) {
					list();								
					swal("取消收藏成功!", "取消我的收藏成功!", "success");
				}
		}) 
	}
	function list(){
		$.ajax({
			url:"/user/myCollection/query?&page="+page+"&length="+length,
			type: "get",
		    dataType : "json",
	        }).done(function(collections){
	        	console.log(collections)
	        	if(collections.numberOfElements == 0){
	        		$("#boxbox").text("");
	        		$("#boxbox").append("<h2 style='text-align: center;margin-top:20px;'>目前沒有我的最愛，快去收藏吧</h2>");
	        	} else {
		        	$("#boxbox").text("");
		        	$("#pagebox").text("");
		        	var totalElements=collections.totalElements;
		        	var totalPages=collections.totalPages;
		        	first=collections.first;
		        	last=collections.last;
		        	page=collections.number;
		        	$.each(collections.content,function(index, collection){
		        		var box="<div class='col-lg-4 col-md-6'>";
		        		 box+="<div class='home-blog-post' style='border-radius:3px;box-shadow: 0 2px 10px 0 rgba(0, 0, 0, 0.5);'>";
		        		 if(collection.myCollectionType == 'MISSION'){
		        		 	box+="<div class='image' style='text-align:center'><a href='/commons/domesticVolunteer/apply?missionId="+collection.favoriteObjectId+"'><img width='350px' height='230px' style='border-radius:5px' src=/image/user/mission/"+collection.favoriteObjectPicName+" alt='...'></a>";
		        		 	box+="</div><div class='text'><div class='s4'><h4><a href='/commons/domesticVolunteer/apply?missionId="+collection.favoriteObjectId+"'>"+ collection.favoriteObjectTitle + "</a></h4>";
		        		 	box+="<p><a name='box1' class='s3 ex1' href='javascript:void(0)' onclick='cancelCollection("+collection.favoriteObjectId+")'><i name='pic1' class='fa fa-heart'></i>已收藏</a></p>"
		        		 } else {
		        			 box+="<div class='image' style='text-align:center'><a href='"+collection.favoriteObjectLink+"'><img width='350px' height='230px' style='border-radius:5px' src=/image/user/member/"+collection.favoriteObjectPicName+" alt='...'></a>";
		        			 box+="</div><div class='text'><div class='s4'><h2><a href='"+collection.favoriteObjectLink+"'>"+ collection.favoriteObjectTitle + "</a></h2>";
			        		 box+="<p><a name='box1' class='s3 ex1' href='javascript:void(0)' onclick='cancleORG("+collection.favoriteObjectId+")'><i name='pic1' class='fa fa-heart'></i>已收藏</a></p>"
		        		 }	        		 
		        		 box+="</div></div></div></div>";   
		        		var boxbox=$("#boxbox").append(box);
		        	})
		        	$("#pagebox").append("<li class='page-item' id='backli'><a name='backa' class='page-link'>«</a></li><li class='page-item' id='nextli'><a name='nexta' class='page-link'>»</a></li>");
		        	for (var index = 1; index <= totalPages ; index++) {
		        		$("#nextli").before("<li id='page"+index+"' class='page-item'><a name='count' id="+index+" class='page-link'>"+index+"</a></li>")
					}
		        	var pageNo = "#page" + (page+1);
		        	$(pageNo).addClass('page-item active');
	        	}
	        	})
		}

	$(document).ready(function(){
		$("#webTitle").empty().append("我的最愛");
		list();		
		$("#pagebox").on("click","li>a[name='backa']", function(){
			if(first == false){
				page = page - 1;
				list();
			}
			 $('body,html').animate({scrollTop: 0 }, 1);
		}) 		
		$("#pagebox").on("click","li>a[name='nexta']", function(){
			if(last == false){
				page = page + 1;
				list();
			}
			 $('body,html').animate({scrollTop: 0 }, 1);
		 })
    	$("#pagebox").on("click","li>a[name='count']", function(){			
    		page=$(this).text()-1;
    		list();
    		 $('body,html').animate({scrollTop: 0 }, 1);
    	})
    	$("#boxbox").on("mouseover","a[name='box2']",function(){
			$(this).empty().append("<i name='pic1' class='far fa-heart'></i>收藏")
		})		
		$("#boxbox").on("mouseout","a[name='box2']",function(){
			$(this).empty().append("<i name='pic1' class='fa fa-heart'></i>收藏")
		})		
		
	})
	</script>
</body>
</html>