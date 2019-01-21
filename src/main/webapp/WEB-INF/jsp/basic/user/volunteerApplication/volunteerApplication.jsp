<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<!-- Javascript files-->
<jsp:include page="../../commons/commons_layout/commons_js_links.jsp" />
<!-- sweetalert -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<jsp:include page="../../commons/commons_layout/commons_css_links.jsp"/>
<meta charset="UTF-8">
<title>進行中任務 | TimeBank</title>
<style>
	.nav-link{
		font-weight: bold;
	}
	#blog-listing-big .author-category a, #blog-listing-medium .author-category_1 a {
	    font-weight: 500;
	    margin-bottom: 0;
	    font-size: 25px;
	}
	#blog-listing-big p.intro, #blog-listing-medium p.intro {
	  margin-top: 10px;
	  margin-right: 15px;
	  color: #777;
	  font-size: 20px;
	}
	.img{
		width: 90%;
		height: 90%;
 		position: absolute; 
	    top: 0;
	    bottom: 0;
	    left: 0;
	    border: 0;
	    border-radius: 5px;
	}
	.embed-responsive {
	    position: relative;
	    display: block;
	    width: 100%;
	    padding: 0;
	    overflow: hidden;
	    margin-left: 20px;
    }
    #blog-listing-big .date-comments a, #blog-listing-medium .date-comments_1 a {
		color: #999;
		margin-left: 25px;
		font-size: 25px;
		display: inline-block;
	}
	.title{
		color: #26ab7b;
	}
	#blog-listing-big .post, #blog-listing-medium .post {
  		margin-bottom: 30px;
	}
	.nav-pills .nav-link {
    	border-radius: 8px;
	}
	.a{
		background-color: #e2eae1db;
	}
    </style>
</head>
<body>
	<!-- Top bar-->
	<jsp:include page="../../commons/commons_layout/commons_top-bar.jsp" />
	<!-- Navbar -->
	<jsp:include page="../../commons/commons_layout/commons_nav.jsp" />
	<!--heading crumbs-->
	<jsp:include page="../../commons/commons_layout/commons_heading_breadcrumbs_member_area.jsp" />
	
	<div id="content">
		<div class="container a">
		<section class="bar_1">
			<ul id="pills-tab" role="tablist" class="nav nav-pills nav-justified">
               <li class="nav-item abc"><a id="orderStatus1" data-toggle="pill" href="#pills-home" role="tab" aria-controls="pills-home" aria-selected="true" class="nav-link active">申請中</a></li>
               <li class="nav-item abc"><a id="orderStatus2" data-toggle="pill" href="#pills-profile" role="tab" aria-controls="pills-profile" aria-selected="false" class="nav-link">機構接受服務</a></li>
               <li class="nav-item abc"><a id="orderStatus6" data-toggle="pill" href="#pills-contact" role="tab" aria-controls="pills-contact" aria-selected="false" class="nav-link">活動時間結束，未發時數</a></li>
            </ul>
		</section>
		<div class="row bar">
			<div id="blog-listing-medium" class="col-md-12">
			<div id="boxbox">
				<!--mission內容開始 -->                
	           	<div>
		            <nav aria-label="Page navigation example" class="d-flex justify-content-center">
			            <ul id ="pagebox" class="pagination pagination-lg">
						<!--換頁控制開始 -->
			            </ul>
		            </nav>
	            </div>
			</div>
            </div>
        </div>
		</div>
		</div>
	<!-- FOOTER -->
	<jsp:include page="../../commons/commons_layout/commons_footer.jsp" />
		<script>
		var orderStatusDetail = "VolunteerApply";
		var length=3;
		var page=0;
		var first;
		var last;
		//切換服務狀態
		$('#orderStatus1').click(function(){
			orderStatusDetail = "VolunteerApply";
			$("#webtitle").empty().append("申請中的任務");
			page=0;
			list();
		})
		$('#orderStatus2').click(function(){
			orderStatusDetail = "RequesterAcceptService";
			$("#webtitle").empty().append("等待開始的任務");
			page=0;
			list();
		})
		$('#orderStatus6').click(function(){
			orderStatusDetail = "ServiceFinishNotPay";
			$("#webtitle").empty().append("已完成");
			page=0;
			list();
		})
	 	//抓出會員資料
	 	function list(){
	 		$.ajax({
	 			url:"/user/volunteerApplication/queryApplication?orderStatusDetail="+orderStatusDetail+"&page="+page+"&length="+length,
				type:"get",
				dataType:"json",
	 		}).done(function(orders){
	 			$("#boxbox").text("");
	        	$("#pagebox").text("");
	        	var totalElements=orders.totalElements;
	        	var totalPages=orders.totalPages;
	        	first=orders.first;
	        	last=orders.last;
	        	page=orders.number;
	        	if(orders.content.length == 0){
	        		var box="<h2 style='text-align: center;margin-top:20px;'>目前沒有活動，快去申請吧</h2>"
	        		$("#boxbox").append(box);
	        	} else {
		        	$.each(orders.content, function(index, order){
		        	   var box="<section><div class='row'><div class='col-md-4'>"
	        		   box+="<div class='video'>"
	        		   box+="<div class='embed-responsive embed-responsive-4by3'>"	        	
	        		   box+=" <a href='/user/volunteerRecruitment/detail?id="+ order.mission.id +"'><img src=/image/user/mission/"+order.mission.missionPicName+" class='img'></img></a>"     
	        		   box+="</div></div></div>"
	                   box+="<div class='col-md-8'>"
	                   box+="<div class='d-flex flex-wrap justify-content-between'>"
	                   box+="<h3 class='h2 mt-0'><a href='/user/volunteerRecruitment/detail?id="+ order.mission.id +"'>"+ order.mission.title + "</a></h3>"
	                   if(order.orderStatus == "VolunteerApply"){
	                   		box+="<p class='date-comments_1'><a href='javascript: void(0)' onclick='deleteRow("+order.id+")' ><i class='fa fa-trash'></i>取消</a></p></div>"
					   } else if (order.orderStatus == "RequesterAcceptService"){
						   if(Date.parse(new Date()).valueOf() > Date.parse(order.mission.deadline).valueOf()){
							   box+="<p class='date-comments_1'><a id='cancel"+ order.id +"' href='javascript: void(0)' onclick='deleteRow("+order.id+")' ><i class='fa fa-trash'></i>取消</a></p></div>"
		           			} else {
		           				box+="</div>"
		           			}
					   } else {
						   box+="</div>"
		           	   }
	                   box+="<div class='d-flex flex-wrap justify-content-between text-xs'>"
	                   box+="<p class='author-category_1'><a href='#' class='title'>"+ order.mission.member.name + "</a></p></div>"
		        	   if(order.orderStatus == "VolunteerApply"){
		               		box+="<p class='intro'>申請時間:"+new Date(order.volunteerApplyTime).Format('yyyy-MM-dd hh:mm')+"</p>"
		               		box+="<p class='intro'>開始時間:"+new Date(order.mission.startDate).Format('yyyy-MM-dd hh:mm')+"</p>"
			           }else if(order.orderStatus == "RequesterAcceptService"){
			            	box+="<p class='intro'>開始時間:"+new Date(order.mission.startDate).Format('yyyy-MM-dd hh:mm')+"</p>"
			           }else if(order.orderStatus == "ServiceFinishNotPay"){
			            	box+="<p class='intro'>結束時間:"+new Date(order.mission.endDate).Format('yyyy-MM-dd hh:mm')+"</p>"
			           }
	                   box+="<p class='intro'>活動地點:"+order.mission.county + order.mission.district+"</p>"
	                   box+="</div></section>"
				       $("#boxbox").append(box);
		        	})
	        	}
	        	if(orders.content.length != 0){
	        		$("#pagebox").append("<li class='page-item' id='backli'><a name='backa' class='page-link'>«</a></li><li class='page-item' id='nextli'><a name='nexta' class='page-link'>»</a></li>");
		        	for (var index = 1; index <= totalPages ; index++) {
		        		$("#nextli").before("<li id='page"+index+"' class='page-item'><a name='count' id="+index+" class='page-link'>"+index+"</a></li>")
					}
		        	var pageNo = "#page" + (page+1);
		        	$(pageNo).addClass('page-item active');
	        	}
		 	})
	 	}
		//取消申請
		function deleteRow(orderId){
			swal({
	 			  title: "確定取消申請嗎",
	 			  text: "取消申請後將無法回復",
	 			  icon: "warning",
	 			  buttons: true,
	 			  dangerMode: true,
	 			}).then((willcancel) => {
	 				if (willcancel) {
	 					$.ajax({
	 						type: "get",
	 						dataType: "json",         
	 						url: "/user/volunteerApplication/delete",
	 						data: {"id":orderId}					
	 					})
	 					.done(function(response){
	 						if (response.status =="SUCCESS"){
	 							swal("取消成功", {icon: "success",});
	 							list();
	 						} else {
	 							swal("取消失敗，因為"+response.messages+"", {icon: "error",});
	 						}
	 					})
	 				} else {
	 					swal("任務仍繼續進行");
	 				}
	 			});
			}
		//自訂日期格式
		Date.prototype.Format = function (fmt) {
		    var o = {
		        "M+": this.getMonth() + 1, //月份
		        "d+": this.getDate(), //日
		        "h+": this.getHours(), //小时
		        "m+": this.getMinutes(), //分
		        "s+": this.getSeconds(), //秒
		        "q+": Math.floor((this.getMonth() + 3) / 3), //季度
		        "S": this.getMilliseconds() //毫秒
		    };
		    if (/(y+)/.test(fmt)) fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
		    for (var k in o)
		        if (new RegExp("(" + k + ")").test(fmt)) fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
		    return fmt;
		};
		$(document).ready(function() {
			
			$("#webTitle").empty().append("申請中的任務");
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
		})
	</script>
</body>
</html>