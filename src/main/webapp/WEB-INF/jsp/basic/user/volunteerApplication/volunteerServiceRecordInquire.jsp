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
<!-- 台灣縣市地區選單	 -->
<script src="/js/tw-city-selector.min.js"></script>
<!-- date picker -->
<script type="text/javascript" src="/js/datepicker/moment.min.js"></script>
<script type="text/javascript" src="/js/datepicker/bootstrap-datepicker.js"></script>
<script src="/js/datepicker/bootstrap-datepicker.zh-TW.js"></script>
<link rel="stylesheet" href="/css/bootstrap-datepicker3.min.css" />
	
<jsp:include page="../../commons/commons_layout/commons_css_links.jsp"/>
<meta charset="UTF-8">
<title>媒合紀錄查詢</title>
<style> 	
    .margintop{
		 margin-top:70px;
	}
	#blog-listing-big p.intro, #blog-listing-medium p.intro {
	  margin-top: 10px;
	  margin-right: 15px;
	  color: #777;
	  font-size: 15px;
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
		font-size: 20px;
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
	.box{
		margin: 15px;
	}
	.boxH{
		height: 100%;
	}
	.county,.district {
		padding: 0.375rem 0.75rem;
		font-size: 1rem;
		line-height: 1.5;
		color: #495057;
		background-color: #fff;
		background-image: none;
		background-clip: padding-box;
		border: 1px solid #ced4da;
		border-radius: 0.25rem;
		transition: border-color ease-in-out 0.15s, box-shadow ease-in-out 0.15s;
		margin-right: 30px;
		margin-bottom: 20px;
	}
	.smart-green {
		margin-left:auto;
		margin-right:auto;
		max-width: 430px;
		background: #F8F8F8;
		font: 12px Arial, Helvetica, sans-serif;
		color: #666;
		border-radius: 5px;
		-webkit-border-radius: 5px;
		-moz-border-radius: 5px;
	}
	.modal-header {
		background: #13b5b1;
		border-radius: 5px 5px 0px 0px;
	}
	.smart-green h4 {
		font: 24px "Trebuchet MS", Arial, sans-serif;	
		display: block;	
		text-shadow: 1px 1px 1px #949494;
		-webkit-border-radius: 5px 5px 0px 0px;
		-moz-border-radius: 5px 5px 0px 0px;
		margin-left: 3.6cm;
	
	}
	.modal-body {
		padding-bottom: 0;
	}
	.smart-green h4>span {
		display: block;
		font-size: 11px;
		color: #FFF;
	}
	
	.smart-green label {
		display: block;
		margin: 0px 0px 5px;
		font-size: 15px;
	}
	.smart-green label>span {
		float: left;
		margin-top: 10px;
		color: #5E5E5E;
	}
	.smart-green input[type="text"], .smart-green textarea {
		color: #555;
		height: 30px;
		line-height:15px;
		width: 80%;
		padding: 0px 0px 0px 10px;
		margin-top: 2px;
		border: 1px solid #b9aeae;
		background: #FBFBFB;
		outline: 0;
		box-shadow: inset 1px 1px 2px rgba(238, 238, 238, 0.2);
		font: normal 14px/14px Arial, Helvetica, sans-serif;
	}
	.smart-green input[type="file"]{
		margin-bottom: 10px;
	}
	.smart-green textarea{
		height:100px;
		padding-top: 10px;
		margin-bottom: 10px;
	}
	.smart-green .button {
		background-color: #9DC45F;
		border-radius: 5px;
		-webkit-border-radius: 5px;
		-moz-border-border-radius: 5px;
		border: none;
		padding: 10px 25px 10px 25px;
		color: #FFF;
		text-shadow: 1px 1px 1px #949494;
	}
	.smart-green .button:hover {
		background-color:#80A24A;
	}
	.modal-footer {
		padding: 0 1rem 1rem 0;
	}
	.container{
		margin-left:  500px;
	}
	.panel-title{
		margin-top: 20px;
	}
	.search {
	    position: absolute;
	    left: 0;
	    width: 370px;
	    background: #e2eae1db;
	    z-index: 10;
	    margin-top: 30px;
	}
	.search_item {
	    margin-bottom: 23px;
	}
	.search_button {
	    font-size: 13px;
	    font-weight: 700;
	    line-height: 33px;
	    padding-left: 26px;
	    padding-right: 26px;
	    background: #1cb4b1;
	    border: none;
	    outline: none;
	    cursor: pointer;
	    margin-top: 15px;
	    margin-left: 230px;
	}
	.panel-body label {
	    font-size: 18px;
	    font-weight: 700;
	    color: black;
	    margin-bottom: 14px;
	}
    </style>
    
</head>
<body>
	<!-- Top bar-->
	<jsp:include page="../../commons/commons_layout/commons_top-bar.jsp"/>
	<!-- Navbar -->
	<jsp:include page="../../commons/commons_layout/commons_nav.jsp"/>
	<div id="heading-breadcrumbs" class="border-top-0 border-bottom-0">
		<div class="container">
			<div class="row d-flex align-items-center flex-wrap">
			<div class="col-md-7">
			<h1 class="h2">媒合紀錄查詢</h1>
			</div>
			</div>
		</div>
	</div>
	<div id="content">
	<div class="col-md-3 search">
	<div class="panel panel-default sidebar-menu">
		<div class="panel-heading">
			<h4 class="h4 panel-title">條件查詢</h4>
		</div>
        <div class="panel-body">
        <form>
	        <div class="form-group mx-sm-3 mb-3">
				<label>縣市:</label> 	
				<div role="tw-city-selector"></div>
			</div>
			<div class="form-group mx-sm-3 mb-3 search_item">
				<label>活動名稱 :</label>
				<input type="text" value="" placeholder="" id="title" name="title" class="form-control"/>
			</div >
			<div class="form-group mx-sm-3 mb-3 search_item">
				<label>時數 :</label>
				<input type="text" value="" placeholder="" id="timeValue" name="timeValue" class="form-control"/>
			</div>
			<div class="form-group mx-sm-3 mb-3 search_item">
				<label>開始日期:</label>
				<input type="text"  id="startDate" name="startDate" autocomplete="off" class="form-control"/>
				<label>結束日期:</label>
				<input type="text"  id="endDate" name="endDate" autocomplete="off" class="form-control"/>
			</div>
			<input type="hidden" value="" placeholder="missionstatus" id="missionstatus" name="missionstatus"/>
			<input  type="button" value="搜尋" id="searchButt" class="btn btn-primary search_button" >			
		</form>
    </div>
    </div>
    </div>
    <div class="container">
	<section class="bar_1">
		<ul id="pills-tab" role="tablist" class="nav nav-pills nav-justified">
			<li class="nav-item"><a id="orderStatus7" data-toggle="pill" href="javascript: void(0)" role="tab" aria-controls="pills-home" aria-selected="true" class="nav-link active">媒合成功紀錄</a></li>
			<li class="nav-item"><a id="orderStatus3" data-toggle="pill" href="javascript: void(0)" role="tab" aria-controls="pills-profile" aria-selected="false" class="nav-link">媒合失敗紀錄</a></li>
		</ul>
	</section>
	<div class="row bar">
	<div id="blog-listing-medium" class="col-md-12">
			<div id="boxbox">
			<!--mission內容開始 -->
			</div>
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
<!--評分視窗 -->  
<!-- <div class="modal fade" id="scoreModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true"> -->
<!--     <div class="modal-dialog modal-dialog-centered" role="document"> -->
<!--         <div class="modal-content"> -->
<!--             <div class="modal-header"> -->
<!--                 <h5 class="modal-title" id="exampleModalCenterTitle">評分系統</h5> -->
<!--                 <button type="button" class="close" data-dismiss="modal" aria-label="Close"> -->
<!--                     <span aria-hidden="true">&times;</span> -->
<!--                 </button> -->
<!--             </div> -->
<!--             <div class="modal-body"> -->
<!--                 <label> -->
<!--                     <span>分數</span> -->
<!--                     <select id='score' name='score'> -->
<!--                         <option value=''>請評分</option> -->
<!--                         <option value='1'>1</option> -->
<!--                         <option value='2'>2</option> -->
<!--                         <option value='3'>3</option> -->
<!--                         <option value='4'>4</option> -->
<!--                         <option value='5'>5</option> -->
<!--                     </select> -->
<!--                 </label> -->
<!--             </div> -->
<!--             <div class="modal-footer"> -->
<!--                 <input type='button' class='btn btn-primary btn-sm' onclick='' value='評分' /> -->
<!--             </div> -->
<!--         </div> -->
<!--     </div> -->
<!-- </div> -->

<!-- 檢舉視窗 -->
<div class="modal fade" id="reportModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
<div class="modal-dialog modal-dialog-centered" role="document">
<div class="modal-content smart-green">
    <div class="modal-header">
        <h4 class="modal-title" id="exampleModalCenterTitle"><font color="white">檢舉系統</font></h4>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
        <span aria-hidden="true">&times;</span>
        </button>
    </div>
    <div class="modal-body">
        <form id="reportForm" enctype="multipart/form-data">
        	<input type='hidden' id='orderId' name='orderId' value='' />
            <label>檢舉人名</label>
            <p id="memberAccount"></p>
            <label>檢舉原因</label>
            <textarea cols='40' rows='5' id='description' name='description'></textarea>
            <input type="file" id="proofPic" name="proofPic" accept="image/*">
            <p>請選擇圖檔，如無佐證資料，則直接送出審核</p>
        </form>
    </div>
    <div class="modal-footer">
        <input type='button' class='btn btn-primary btn-sm' onclick='report()' value='檢舉' />
    </div>
</div>
</div>
</div>
	<jsp:include page="../../commons/commons_layout/commons_footer.jsp"/>
	<script>
	var length=3;
	var page=0;
	var first;
	var last;
	//切換服務狀態
	$('#orderStatus7').click(function(){
		orderStatusDetail = "MatchSuccess";
		page=0;
		list();
	})
	$('#orderStatus3').click(function(){
		orderStatusDetail = "MatchFail";
		page=0;
		list();
	})
	//抓出會員資料
 	function list(){
 		$.ajax({
 			url:"/user/volunteerRecord/queryRecord?"+$('form').serialize()+"&orderStatusDetail="+orderStatusDetail+"&page="+page+"&length="+length,
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
        		var box="<h2>目前沒有活動，快去申請吧</h2>"
        		$("#boxbox").append(box);
        	} else {
	        	$.each(orders.content, function(index, order){
	        	   var box="<section><div class='row box'><div class='col-md-4 boxH'>"
        		   box+="<div class='video'>"
        		   box+="<div class='embed-responsive embed-responsive-4by3'>"	        	
        		   box+=" <a href='/user/volunteerRecruitment/detail?id="+ order.mission.id +"'><img src=/image/user/mission/"+order.mission.missionPicName+" class='embed-responsive-item img'></img></a>"     
        		   box+="</div></div></div>"
                   box+="<div class='col-md-8 boxH'>"
                   box+="<div class='d-flex flex-wrap justify-content-between'>"
                   box+="<h3 class='h2 mt-0'><a href='/user/volunteerRecruitment/detail?id="+ order.mission.id +"'>"+ order.mission.title + "</a></h3>"
                   if(order.orderStatus == "ServiceFinishPayMatchSuccess" && order.ReportStatus == null || order.orderStatus == "ServiceFinishPayMatchSuccess" && order.ReportStatus == 'RequesterReportVolunteer'){
                   	   box+="<p class='date-comments_1'><a href='javascript: void(0)' data-toggle='modal' data-target='#reportModalCenter' id='" + order.id + "' name='" + order.mission.member.account + "'><i class='fa fa-trash'></i>檢舉</a></p></div>"
                   } else if(order.ReportStatus == 'VolunteerReportRequester' || order.ReportStatus == 'BothReport'){
	            	   box+="<p class='date-comments_1'><i class='fa fa-trash'></i>已檢舉</a></p></div>"
	               } else {
                	   box+="</div>"
                   }
                   box+="<p class='author-category_1'><a href='#'>"+ order.mission.member.name + "</a></p>"
                   if(order.orderStatus == 'RequesterRefuceServiceMatchFail'){
                	   box+="<p class='intro'>失敗原因:申請被拒絕</p>"
                   }
                   if(order.orderStatus == 'RequesterCancleTransactionMatchFail'){
                	   box+="<p class='intro'>失敗原因:雇主取消活動</p>"
                   }
				   if(order.orderStatus == 'VolunteerCancleTransactionMatchFail'){
					   box+="<p class='intro'>失敗原因:志工取消活動</p>"
                   }
                   if(order.orderStatus == 'ServiceFinishNotPay'){
                	   box+="<p class='intro'>結束時間:"+new Date(order.mission.endDate).Format('yyyy-MM-dd hh:mm')+"</p>"
                   	   box+="<p class='intro'>活動地點:"+order.mission.county + order.mission.district+"</p>"					   
	                   box+="<p class='intro'>獲得時數:尚未收到</p>"
                   }
				   if(order.orderStatus == 'ServiceFinishPayMatchSuccess'){
		           	   box+="<p class='intro'>結束時間:"+new Date(order.mission.endDate).Format('yyyy-MM-dd hh:mm')+"</p>"
                   	   box+="<p class='intro'>活動地點:"+order.mission.county + order.mission.district+"</p>"					   
	                   box+="<p class='intro'>獲得時數:"+order.memberScore+"</p>"
				   }
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
	new TwCitySelector();
		
	//日期選擇器
	var datePickerSetting = {
		format : "yyyy/mm/dd",
		autoclose : true,
		todayHighlight : true,
		language : 'zh-TW',
		clearBtn : true,
		startView : "2",
		endDate : "0d",
	};
	$("#startDate").datepicker(datePickerSetting);
	$("#endDate").datepicker(datePickerSetting);
	//搜尋事件
 	$("#searchButt").click(function(){
 		list();
	})
	//呼叫評分視窗

	//評分
// 	function score(orderId) {
// 		if ($('#score').val() == null || $('#score').val().length == 0){
// 			swal({title: "請評分"})
// 		} else {			
// 			$.ajax({
// 				url : '/user/volunteerRecord/score?orderId=' + orderId +'&score=' + $('#score').val(),
// 				type : 'get',
// 				dataType : 'JSON'
// 			}).done(function(response){
// 				if (response.status =="SUCCESS"){
// 					swal({title: "評分成功"})
// 				} else {
// 					swal({title: "評分失敗"})
// 				}
// 				$('#scoreModalCenter').modal('hide')
// 				list();
// 			})	
// 		}
// 	}		
	//檢舉
	function report() {
		swal({
			  title: "確認要送出檢舉嗎？",
			  icon: "warning",
			  buttons: true,
			  dangerMode: true,
			}).then((willcancel) => {
				if (willcancel) {
					var data = new FormData($('#reportForm')[0]);
					$.ajax({
						url : '/user/volunteerRecord/report',
		 				type : 'post',
		 				cache: false,
		 				data : data,
		 				processData: false,
		 				contentType: false
					})
					.done(function(response){
						if (response.status =="SUCCESS"){
							swal("檢舉成功", {icon: "success",});
						} else {
							swal("檢舉失敗，因為"+response.messages+"", {icon: "error",});
						}
						list();
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
	}
	$(document).ready(function() {
		orderStatusDetail = "MatchSuccess";
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
    	//彈出評分視窗時，修改裡面的值
	    $("#boxbox").on('click', "[data-target='#scoreModalCenter']", function (event) {
			$("[value='評分']").attr("onclick", "score("+ event.target.id +")")
		})
		//彈出檢舉視窗時，修改裡面的值
		$("#boxbox").on('click', "[data-target='#reportModalCenter']", function (event) {
			$("#orderId").attr("value", event.target.id)
			$("#memberAccount").html(event.target.name)
		})
	});
	</script>
</body>
</html>