<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
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
		
<jsp:include page="../../commons/commons_layout/commons_css_links.jsp"/>
<meta charset="UTF-8">
<title>mission list(login)</title>
<style>
	fieldset {
		width: 100%;
		margin: 20px;
		border: 3px solid rgba(0,0,0,0);
		margin: auto
	}
	table {
		padding: 20px;
	}
	.nav-link{
		font-weight: bold;
	}
	
    </style>
</head>
<body>
	<!-- Top bar-->
	<jsp:include page="../../commons/commons_layout/commons_top-bar.jsp" />
	<!-- Navbar -->
	<jsp:include page="../../commons/commons_layout/commons_nav.jsp" />
	
      <div id="heading-breadcrumbs" class="border-top-0 border-bottom-0">
        <div class="container">
          <div class="row d-flex align-items-center flex-wrap">
            <div class="col-md-7">
              <h1 id="webtitle" class="h2"></h1>
            </div>
          </div>
        </div>
      </div>

		<div class="container">
		<div class="row">
		<section class="bar_1">
			<ul id="pills-tab" role="tablist" class="nav nav-pills nav-justified">
                <li class="nav-item"><a id="orderStatus1" data-toggle="pill" href="#pills-home" role="tab" aria-controls="pills-home" aria-selected="true" class="nav-link active">申請中</a></li>
                <li class="nav-item"><a id="orderStatus2" data-toggle="pill" href="#pills-profile" role="tab" aria-controls="pills-profile" aria-selected="false" class="nav-link">機構接受服務</a></li>
                <li class="nav-item"><a id="orderStatus6" data-toggle="pill" href="#pills-contact" role="tab" aria-controls="pills-contact" aria-selected="false" class="nav-link">活動時間結束，未發時數</a></li>
             </ul>
		</section>
		<div class="row bar">
			<div id="blog-listing-medium" class="col-md-9">
			<section class="post_1">
			<div class="row" id="boxbox">
				<!--mission內容開始 -->                
			</div>
            </section>
           	<div>
            <nav aria-label="Page navigation example">
	            <ul id ="pagebox" class="pagination pagination-lg">
					<!--換頁控制開始 -->
	            </ul>
            </nav>
            </div>    
            </div>
<!-- 			<table id="table" class="table table-bordered table-hover"> -->
<!-- 				<thead class="thead-light"> -->
<!-- 					<tr> -->
<!-- 						<th scope="col"></th> -->
<!-- 						<th scope="col">活動名稱</th> -->
<!-- 						<th scope="col">地點</th> -->
<!-- 						<th scope="col">活動開始時間</th> -->
<!-- 						<th scope="col">活動結束時間</th> -->
<!-- 						<th scope="col">時數</th> -->
<!-- 						<th scope="col">申請時間</th> -->
<!-- 						<th scope="col">狀態</th> -->
<!-- 						<th scope="col" width="50px">備註</th> -->
<!-- 					</tr> -->
<!-- 				</thead> -->
<!-- 				<tbody id="tableBody" class="table table-striped"> -->
<!-- 					會員資料 -->
<!-- 				</tbody> -->
<!-- 			</table> -->
		</div>
 		</div>
		</div>

	<!-- FOOTER -->
	<jsp:include page="../../commons/commons_layout/commons_footer.jsp" />
		<script>
		var length=3;
		var start=0;
		var first;
		var last;
		var orderStatusDetail = "VolunteerApply";
		//切換服務狀態
		$('#orderStatus1').click(function(){
			orderStatusDetail = "VolunteerApply";
			dataTable.ajax.reload();
		})
		$('#orderStatus2').click(function(){
			orderStatusDetail = "RequesterAcceptService";
			dataTable.ajax.reload();
		})
		$('#orderStatus6').click(function(){
			orderStatusDetail = "ServiceFinishNotPay";
			dataTable.ajax.reload();
		})
		
		function mouseover(id){
			$('#cancel'+id).css('text-decoration','underline')
		}
	 	function mouseout(id){
	 		$("#cancel"+id).css('text-decoration','none')
	 	}
	 	
	 	//抓出會員資料
	 	function list(){
	 		$.ajax({
	 			url:"/user/volunteerApplication/queryApplication?"+"orderStatusDetail="+orderStatusDetail+"&start="+start+"&length="+length,
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
	        	$.each(orders.content, function(index, order){
	        	   var box="<div class='col-md-4'>"
        		   box+="<div class='video'>"
        		   box+="<div class='embed-responsive embed-responsive-4by3'>"	        	
        		   box+=" <a href='#'><img src=../../img/"+order.mission.missionPicName+" class='embed-responsive-item'></img></a>"     
        		   box+="</div></div></div>"
                   box+="<div class='col-md-8'>"
                   box+="<h1 class='h1 mt-0'><a href='post.htmls'>"+ order.mission.title + "</a></h1>"
                   box+="<div class='d-flex flex-wrap justify-content-between text-xs'>"
                   box+="<p class='author-category_1'><a href='#'>"+ order.mission.member.name + "</a></p>"
                   if(order.orderStatus == "VolunteerApply"){
                   		box+="<p class='date-comments_1'><a id='deleteButt"+ order.id +"' onmouseover='mouseover("+order.id+")' onmouseout='mouseout("+order.id+")' onclick='deleteRow("+order.id+")' ><i class='fa fa-trash'></i>取消</a></p></div>"
				   } else if (order.orderStatus == "RequesterAcceptService"){
					   if(Date.parse(new Date()).valueOf() > Date.parse(order.mission.deadline).valueOf()){
		           			return cancelButt;
	           			} else {
	           				box+="</div>"
	           			}
				   } else {
					   box+="</div>"
	           	   }
                   box+="<p class='intro_1'>活動地點:"+order.mission.county + order.mission.district+"</p>"
  
                   var boxbox=$("#boxbox").append(box)
	        	})
	        	
	        	$("#pagebox").append("<li class='page-item' id='backli'><a name='backa' class='page-link'>«</a></li><li class='page-item' id='nextli'><a name='nexta' class='page-link'>»</a></li>");
	        	for (var index = 1; index <= totalPages ; index++) {
	        		$("#nextli").before("<li class='page-item'><a name='count' id="+index+" class='page-link'>"+index+"</a></li>")
				}
		 	})
	 	}
		$(document).ready(function() {
			list()
/*
			dataTable = $('#table').DataTable({
				pageResize: true, 
				fixedHeader: true,
				pagingType: 'full_numbers',
				searching: false,				
			 	processing: true,
				serverSide: true,  //分頁、排序都交由伺服器處理
				ajax:{
					url:"/user/volunteerApplication/queryApplication",
					type:"get",
					dataType:"json",
					data:function(d){ 				//傳送給伺服器的資料(datatable預設會傳送d的資料)
						var start = d.start;
						var length = d.length;
						var request = "orderStatusDetail=" + orderStatusDetail + "&start=" + start + "&length="+ length;
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
					{ data: null, render: function ( data, type, row ) {
		            	return new Date(data.volunteerApplyTime).Format('yyyy-MM-dd hh-mm');
		            } },
					{data:"orderStatus"},
		           	{data: function (data, type, row ) {
		           		var cancelButt="<input type='button' class=\"btn btn-outline-danger btn-sm\" onclick=\"deleteRow("+data.id+")\" id='deleteButt"+ data.id +"' value='取消' />"
		           		if(data.orderStatus == "VolunteerApply"){
		           			return cancelButt;
			           		} else if (data.orderStatus == "RequesterAcceptService"){
			           			if(Date.parse(new Date()).valueOf() > Date.parse(data.mission.deadline).valueOf()){
				           			return cancelButt;
			           			} else {
			           				return null;
			           			}
			           		} else {
			           			return null;
			           		}
		           		}
		           	},							
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
*/
		})
		//刪除事件方法
		function deleteRow(orderId){
			$.ajax({
				type: "get",
				dataType: "json",         
				url: "/user/volunteerApplication/delete",
				data: {"id":orderId}					
			})
			.done(function(response){			
				if (response.status =="SUCCESS"){
					alert("申請已取消");
				} else {
					$.each(response.messages, function(idx, message) {
						alert("the "+idx+"th ERROR, because "+message);
					});
				}			
				dataTable.draw('page');
				if ($("table tbody tr").length < 2){
				} 
			})	
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
	</script>
</body>
</html>