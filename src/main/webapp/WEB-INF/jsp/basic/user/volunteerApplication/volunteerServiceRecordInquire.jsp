<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- Javascript files-->
<jsp:include page="../../commons/commons_layout/commons_js_links.jsp" />

<!-- data table -->
<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.js"></script>
<script type="text/javascript" src="/js/dataTable_full_numbers_no_ellipses.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.css">  
<script src="https://cdn.datatables.net/buttons/1.5.4/js/dataTables.buttons.min.js"></script>	
<script src="https://cdn.datatables.net/select/1.2.7/js/dataTables.select.min.js"></script>
<!-- 台灣縣市地區選單	 -->
<script src="/js/tw-city-selector.min.js"></script>
<!-- date picker -->
<script type="text/javascript" src="/js/datepicker/moment.min.js"></script>
<script type="text/javascript" src="/js/datepicker/bootstrap-datepicker.js"></script>
<script src="/js/datepicker/bootstrap-datepicker.zh-TW.js"></script>
<link rel="stylesheet" href="/css/bootstrap-datepicker3.min.css" />
	
<jsp:include page="../../commons/commons_layout/commons_css_links.jsp"/>

<title>mission list(login)</title>
<style> 	
        fieldset {
            width: 100%;
            border-radius: 20px;
            padding: 20px;
            margin: 20px;
            border: 3px solid rgba(0,0,0,0);
            margin: auto
        }
        .s2{
            text-align: center
        }
        .margintop{
			 margin-top:70px;
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
	}
	.smart-green {
	margin-left:auto;
	margin-right:auto;
	max-width: 500px;
	background: #F8F8F8;
	padding: 30px 30px 20px 30px;
	font: 12px Arial, Helvetica, sans-serif;
	color: #666;
	border-radius: 5px;
	-webkit-border-radius: 5px;
	-moz-border-radius: 5px;
	}
	.smart-green h1 {
	font: 24px "Trebuchet MS", Arial, Helvetica, sans-serif;
	padding: 20px 0px 20px 40px;
	display: block;
	margin: -30px -30px 10px -30px;
	color: #FFF;
	background: #9DC45F;
	text-shadow: 1px 1px 1px #949494;
	border-radius: 5px 5px 0px 0px;
	-webkit-border-radius: 5px 5px 0px 0px;
	-moz-border-radius: 5px 5px 0px 0px;
	border-bottom:1px solid #89AF4C;
	
	}
	.smart-green h1>span {
	display: block;
	font-size: 11px;
	color: #FFF;
	}
	
	.smart-green label {
	display: block;
	margin: 0px 0px 5px;
	}
	.smart-green label>span {
	float: left;
	margin-top: 10px;
	color: #5E5E5E;
	}
	.smart-green input[type="text"], .smart-green input[type="email"], .smart-green textarea, .smart-green select {
	color: #555;
	height: 30px;
	line-height:15px;
	width: 100%;
	padding: 0px 0px 0px 10px;
	margin-top: 2px;
	border: 1px solid #E5E5E5;
	background: #FBFBFB;
	outline: 0;
	-webkit-box-shadow: inset 1px 1px 2px rgba(238, 238, 238, 0.2);
	box-shadow: inset 1px 1px 2px rgba(238, 238, 238, 0.2);
	font: normal 14px/14px Arial, Helvetica, sans-serif;
	}
	.smart-green textarea{
	height:100px;
	padding-top: 10px;
	}
	.smart-green select {
	background: url('down-arrow.png') no-repeat right, -moz-linear-gradient(top, #FBFBFB 0%, #E9E9E9 100%);
	background: url('down-arrow.png') no-repeat right, -webkit-gradient(linear, left top, left bottom, color-stop(0%,#FBFBFB), color-stop(100%,#E9E9E9));
	appearance:none;
	-webkit-appearance:none;
	-moz-appearance: none;
	text-indent: 0.01px;
	text-overflow: '';
	width:100%;
	height:30px;
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
    </style>
    <meta charset="UTF-8">
</head>
<body>
	<!-- Top bar-->
	<jsp:include page="../../commons/commons_layout/commons_top-bar.jsp" />
	<!-- Navbar -->
	<jsp:include page="../../commons/commons_layout/commons_nav.jsp" />
	 <div id="heading-breadcrumbs">
        <div class="container">
          <div class="row d-flex align-items-center flex-wrap">
            <div class="col-md-7">
              <h1 class="h2">媒合紀錄查詢</h1>
            </div>
          </div>
        </div>
      </div>
	<section class="bar">
        <div class="container">
        	<div class="row">
<%-- 			<jsp:include page="../user_layout/user_sidebar.jsp" /> --%>
        			<!-- 條件搜尋表單 -->
        		<div>
				<fieldset>
				<ul id="pills-tab" role="tablist" class="nav nav-pills nav-justified">
	                <li class="nav-item"><a id="orderStatus7" data-toggle="pill" href="#pills-home" role="tab" aria-controls="pills-home" aria-selected="true" class="nav-link active">媒合成功紀錄</a></li>
	                <li class="nav-item"><a id="orderStatus3" data-toggle="pill" href="#pills-profile" role="tab" aria-controls="pills-profile" aria-selected="false" class="nav-link">媒合失敗紀錄</a></li>
              	</ul>
					<form>
						<label><span>活動地址:</span><div role="tw-city-selector" ></div></label>						
						<label>開始日期:</label>
						<input type="text"  id="startDate" name="startDate" autocomplete="off"/>
						<label>結束日期:</label>
						<input type="text"  id="endDate" name="endDate" autocomplete="off"/>
						<input type="button" value="搜尋"  class="btn btn-outline-secondary" id="searchButt" />
						<input type="reset"  value="清除重填" class="btn btn-outline-secondary" />
						<div>	
						<a class="btn btn-outline-secondary" data-toggle="collapse" href="#collapse" role="button" aria-expanded="false" aria-controls="collapseExample">
						進階查詢:
			  			</a>
			  			</div> 
						<div class="collapse" id="collapse">		
							<label>獲得時間 :</label> 
							<input type="text" value="" id="memberScore" name="memberScore"/>
							<label>狀態 :</label> 
							<select  id="orderStatus" name="orderStatus">
								<option value="">選擇狀態</option>
								<option value='ServiceFinishPayMatchSuccess'>已完成</option>
								<option value='RequesterCancleActivityNoPunishMatchSuccess'>Requester 臨時取消活動(不懲罰)</option>
								<option value='RequesterCancleActivityPunishMatchSuccess'>Requester 臨時取消活動(要懲罰)</option>
								<option value='VolunteerCancleActivityNoPunishMatchSuccess'>志工 臨時請假(不懲罰)</option>
								<option value=''>志工 臨時不去(要懲罰)</option>
							</select>
						</div>
					</form>
				</fieldset>
				<fieldset>
					<table id="table" class="table table-striped table-bordered">
						<thead>
							<tr>
								<th scope="col"></th>
								<th scope="col">活動名稱</th>
								<th scope="col">地點</th>
								<th scope="col">活動開始時間</th>
								<th scope="col">活動結束時間</th>
								<th scope="col">時數</th>
								<th scope="col">狀態</th>
								<th scope="col">實際時數</th>
								<th scope="col">備註</th>
							</tr>
						</thead>
						<tbody id="tableBody">
							<!-- 會員資料 -->
						</tbody>
					</table>
				</fieldset>
				</div>
	 		</div>
	 	</div>
	</section>
	<!-- FOOTER -->
	<jsp:include page="../../commons/commons_layout/commons_footer.jsp" />
	<script>
		var dataTable;
		var orderStatusDetail = "MatchSuccess";
		$(document).ready(function() {
			
		dataTable = $('#table').DataTable({
				pageResize: true, 
				fixedHeader: true,
				pagingType: 'full_numbers',
				searching: false,				
			 	processing: true,
				serverSide: true,  //分頁、排序都交由伺服器處理
				ajax:{
					url:"/user/volunteerRecord/queryRecord",
					type:"get",
					dataType:"json",
					data:function(d){ 				//傳送給伺服器的資料(datatable預設會傳送d的資料)
						var start = d.start;
						var length = d.length;
						var request =  $("form").serialize() + "&orderStatusDetail=" + orderStatusDetail +
											"&start=" + start + "&length="+ length;
						return request;
					},
					dataSrc:"content",
					dataFilter:function(resp){		//對伺服器送來的資料進行修改
						 var json = jQuery.parseJSON( resp );
			             json.recordsTotal = json.totalElements;
			             json.recordsFiltered = json.totalElements;	     			
			             return JSON.stringify( json ); 
					},
				}, drawCallback:function(d){
						var api = this.api();
						var pageNum = parseInt(d.json.pageable.pageNumber) ;
						var totalPages = d.json.totalPages;
						$('#table_info').html('Currently showing page '+(pageNum+1)+' of '+totalPages+' pages.');
				}, columns: [ 		//設定datatable要顯示的資訊，需與表頭<th>數量一致(可隨意串接資料內容)
		     		{data:null},
		           	{data:"mission.title" },
		           	{ data: null, render: function ( data, type, row ) {
		                return data.mission.county + data.mission.district+ data.mission.address;
		            } },
		            { data: null, render: function ( data, type, row ) {
		            	return new Date(data.mission.startDate).Format('yyyy-MM-dd hh-mm');
		            } },
		            { data: null, render: function ( data, type, row ) {
		            	return new Date(data.mission.endDate).Format('yyyy-MM-dd hh-mm');
		            } },
					{data:"mission.timeValue"},
					{data:"orderStatus"},
					{ data: null, render: function ( data, type, row ) {
						if(data.memberScore == null){
							return 0;
						} else {
		            		return data.memberScore;							
						}
		            } },
		            { data: null, render: function(data, type, row ) {
		            	if(data.orderStatus == "RequesterCancleActivityNoPunishMatchSuccess") {
		            		var report = "<input type='button' class=\"btn btn-primary btn-sm\" onclick=report(" + data.id + ") value='檢舉'  />";
		            		var text = "<textarea cols='40' rows='5' id='text' name='text'></textarea>"
							var reportModal = '<div class="modal fade" id="reportModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">'+
											  '<div class="modal-dialog modal-dialog-centered" role="document">'+
									    '<div class="modal-content">'+
									     '<div class="modal-header">'+
									       '<h5 class="modal-title" id="exampleModalCenterTitle">檢舉系統</h5>'+
									        '<button type="button" class="close" data-dismiss="modal" aria-label="Close">'+
									          '<span aria-hidden="true">&times;</span>'+
									        '</button></div>'+
									      '<div class="modal-body">'+ 
									      '<form enctype="multipart/form-data" action="/user/volunteerRecord/score" method="post">' +
									      '<input type="hidden" id="orderId" name="orderId" value="' + data.id + '" /><p>' +
									      '<h5>檢舉人名<h5><p>' + data.mission.member.account + '</p>' +
 									      '<h5>檢舉原因</h5><p>' + text +'</p>' +
 									     '<input type="file" id="proofPic" name="proofPic"  accept="image/*"><p>請選擇圖檔，如無佐證資料，則直接送出審核<p></form>' +
									      '</div><div class="modal-footer">'+
									      report + '</div></div></div></div>';
									      
		            		var reportButt = '<button type="button" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#reportModalCenter">檢舉</button>'
		            		return reportButt + reportModal;
		            	} else if (data.orderStatus == "ServiceFinishPayMatchSuccess") {
							var score = "<input type='button' class='btn btn-primary btn-sm'  onclick=sendScore(" + data.id +") value='評分'  />"
		            		var select = "<select id='score' name='score'><option value=''>請評分</option><option value='1'>1</option><option value='2'>2</option><option value='3'>3</option><option value='4'>4</option><option value='5'>5</option></select>"
							var scoreModal = '<div class="modal fade" id="scoreModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">'+
											  '<div class="modal-dialog modal-dialog-centered" role="document">'+
									    '<div class="modal-content">'+
									     '<div class="modal-header">'+
									       '<h5 class="modal-title" id="exampleModalCenterTitle">評分系統</h5>'+
									        '<button type="button" class="close" data-dismiss="modal" aria-label="Close">'+
									          '<span aria-hidden="true">&times;</span>'+
									        '</button></div>'+
									      '<div class="modal-body">'+ 
								   			'<label><span>分數</span>' + select + '</label>' +
									      '</div><div class="modal-footer">'+
									       score + '</div></div></div></div>';
							var scoreButt = '<button type="button" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#scoreModalCenter">評分</button>'
		            		return scoreButt + scoreModal;		            		
		            	} else if (data.orderStatus == "ServiceFinishPayAndScoreMatchSuccess"){
		            		return '<button type="button" class="btn btn-primary btn-sm">已評分</button>'
		            	} else if (data.orderStatus == "VolunteerReportRequestMatchSuccess" || data.orderStatus == "RequesterCancleActivityPunishMatchSuccess"){
		            		return '<button type="button" class="btn btn-primary btn-sm">已檢舉</button>'
		            	} else {
		            		return null;
		            	}
		            } },
				], columnDefs:[{		//禁用第0123列的搜索和排序
					"searchable": false,
	                "orderable": false,
	                "targets": [0, 1, 2],
				}], order: [[1, 'asc']]   
			 });
			
			dataTable.on('draw.dt',function() {
				dataTable.column(0, {
	                search:'applied',
	                order:'applied'
	            }).nodes().each(function(cell, i) {
					 i = i+1;								//i從0開始，所以先加1
	                var pageinfo = dataTable.page.info();	//服務氣模式下，使用DT提供的API直接獲取分頁資訊
	                var pageno = pageinfo.page;				//当前第几页，从0开始
	                var length = pageinfo.length;			//每页数据
	                var columnIndex = (i+pageno*length);	//行号等于 页数*每页数据长度+行号
	                cell.innerHTML = columnIndex;
	            });
	        });
					
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
			
// 			$('#startDate').datetimepicker({
// 				dateFormat: "yy/mm/dd",
// 			    todayHighlight: true,
// 			    language: 'zh-TW',
// 			    startView:"years",
// 			})
			
// 			$('#endDate').datetimepicker({
// 				dateFormat: "yy/mm/dd",
// 			    todayHighlight: true,
// 			    language: 'zh-TW',
// 			    startView:"years",
// 			})
		//搜尋事件
		$("#searchButt").click(	function(){
			dataTable.ajax.reload();
			})

		})
		
		//評分
		function sendScore(orderId) {
			if ($('#score').val() == null || $('#score').val().length == 0){
				alert("請評分")
			} else {			
				$.ajax({
					url : '/user/volunteerRecord/score?orderId=' + orderId +'&score=' + $('#score').val(),
					type : 'get',
					dataType : 'JSON'
				}).done(function(response){
					if (response.status =="SUCCESS"){
						alert("評分成功");
					} else {
						alert("評分失敗");
					}			
					window.location.reload();
				})	
			}
		}
		
		//檢舉
		function report(orderId) {
			if(confirm("確認要送出檢舉嗎？")==true) {
				$.ajax({
					url : '/user/volunteerRecord/report?id='+ orderId+'&description=' + $('#text').val(),
					type : 'get',
					dataType : 'JSON'
				}).done(function(response){
					if (response.status =="SUCCESS"){
						alert("檢舉成功");
					} else {
						alert("檢舉失敗");
					}			
					window.location.reload();
				})	
			} else {
				return false;
			}
		}
		
		//切換服務狀態
		var Status7 = 
			"<option value=''>選擇狀態</option>"+
			"<option value='ServiceFinishPayMatchSuccess'>已完成</option>"+
			"<option value='RequesterCancleActivityNoPunishMatchSuccess'>Requester 臨時取消活動(不懲罰)</option>"+
			"<option value='RequesterCancleActivityPunishMatchSuccess'>Requester 臨時取消活動(要懲罰)</option>"+
			"<option value='VolunteerCancleActivityNoPunishMatchSuccess'>志工 臨時請假(不懲罰)</option>"+
			"<option value='VolunteerCancleActivityPunishMatchSuccess'>志工 臨時不去(要懲罰)</option>";
		var Status3 = 
			"<option value=''>選擇狀態</option>"+
			"<option value='RequesterRefuceServiceMatchFail'>requester 拒絕服務</option>"+
			"<option value='RequesterCancleTransactionMatchFail'>Requester 取消交易</option>"+
			"<option value='VolunteerCancleTransactionMatchFail'>志工 取消交易</option>";    
		$('#orderStatus7').click(function(){
			orderStatusDetail = "MatchSuccess";
			$('#orderStatus').html(Status7);
			dataTable.ajax.reload();
		})
		$('#orderStatus3').click(function(){
			orderStatusDetail = "MatchFail";
			$('#orderStatus').html(Status3);
			dataTable.ajax.reload();
		})
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

	</script>
</body>
</html>