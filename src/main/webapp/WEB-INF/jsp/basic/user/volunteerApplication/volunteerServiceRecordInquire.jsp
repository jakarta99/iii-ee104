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
<meta charset="UTF-8">
<title>mission list(login)</title>
<style> 	
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
 
    </style>
</head>
<body>
	<!-- Top bar-->
	<jsp:include page="../../commons/commons_layout/commons_top-bar.jsp" />
	<!-- Navbar -->
	<jsp:include page="../../commons/commons_layout/commons_nav.jsp" />	
	<section class="bar">
        <div class="container">
        	<div class="row">
<%-- 			<jsp:include page="../user_layout/user_sidebar.jsp" /> --%>
        			<!-- 條件搜尋表單 -->
        		<div>
				<fieldset>
			    <button type="button" id="orderStatus7" class="btn btn-primary">媒合成功紀錄</button>
			    <button type="button" id="orderStatus3" class="btn btn-secondary">媒合失敗紀錄</button>
					<form>
						<div>基本查詢:</div>
						<label>住址:</label>
						<div role="tw-city-selector" ></div>
						<label>開始日期:</label>
						<input type="text"  id="startDate" name="startDate" autocomplete="off"/>
						<label>結束日期:</label>
						<input type="text"  id="endDate" name="endDate" autocomplete="off"/>
						<input type="button" value="搜尋" id="searchButt" />
						<input type="reset"  value="清除重填" />
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
		            { data: null, render: function ( data, type, row ) {
		            	if(data.orderStatus == "RequesterCancleActivityNoPunishMatchSuccess" || data.orderStatus.id == 9){
		            		var editButt = "<input type='button' class=\"btn btn-primary btn-sm\"  onclick=\"javascript:document.location.href='#?id="
								+ data.id + "'\" value='檢舉'  />";
		            		return editButt;
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
			$('#orderStatus7').attr('class','btn btn-primary')
			$('#orderStatus3').attr('class','btn btn-secondary')
			$('#orderStatus').html(Status7);
			dataTable.ajax.reload();
		})
		$('#orderStatus3').click(function(){
			orderStatusDetail = "MatchFail";
			$('#orderStatus7').attr('class','btn btn-secondary')
			$('#orderStatus3').attr('class','btn btn-primary')
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
		};
	</script>
</body>
</html>