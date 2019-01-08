<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Donation Record</title>
<!-- css -->
<jsp:include page="../../commons/commons_layout/commons_css_links.jsp" />
<!-- Javascript files -->
<jsp:include page="../../commons/commons_layout/commons_js_links.jsp" />
<script defer
	src="https://use.fontawesome.com/releases/v5.0.6/js/all.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.css">  
<!-- date picker -->
<script type="text/javascript" src="/js/datepicker/moment.min.js"></script>
<script type="text/javascript" src="/js/datepicker/bootstrap-datepicker.js"></script>
<script src="/js/datepicker/bootstrap-datepicker.zh-TW.js"></script>
<link rel="stylesheet" href="/css/bootstrap-datepicker3.min.css" />

<style>
        fieldset {
            width: 100%;
            border: 3px solid rgba(0,0,0,0);
            padding: 20px;
            margin: 20px;
            margin: auto
        }
        .s2{
            text-align: center
        }
        .margintop{
			 margin-top:70px;
		}
</style>
</head>
<body>
	<!-- Top bar-->
	<jsp:include page="../../commons/commons_layout/commons_top-bar.jsp"/>
	<!-- Navbar -->
	<jsp:include page="../../commons/commons_layout/commons_nav.jsp"/>
	<div id="heading-breadcrumbs">
    	<div class="container">
        	<div class="row d-flex align-items-center flex-wrap">
            	<div class="col-md-7">
              		<h1 class="h2">我的捐款</h1>
            	</div>
<!-- 	            <div class="col-md-5"> -->
<!-- 	              	<ul class="breadcrumb d-flex justify-content-end"> -->
<!-- 	                	<li class="breadcrumb-item"><a href="index.html">Home</a></li> -->
<!-- 	                	<li class="breadcrumb-item"><a href="team.html">Our Team</a></li> -->
<!-- 	                	<li class="breadcrumb-item active">Team Member</li> -->
<!-- 	              	</ul> -->
<!-- 	            </div> -->
        	</div>
        </div>
    </div>
	<!-- Sidebar -->
    <jsp:include page="../user_layout/user_sidebar.jsp"/>
	<section class="bar">
	<div class="container">
    	<div class="row">
            <article>
<!-- 				<div class="container"> -->
<!-- 					<h2 class="text-center text-uppercase text-secondary mb-0">我的交易紀錄</h2> -->
<!-- 			        <hr class="star-dark mb-5"> -->
<!-- 				</div> -->
				<div id="sideBar">
					<form>
						<fieldset style="width:1100px">
						<legend>Search</legend>
						<div>
<!-- 						    <label>id:</label> -->
<%-- 						    <input type="text" value="${param.id}" id="id" name="id"/> --%>
<!-- 						    <label>donator:</label> -->
<%-- 						    <input type="text" value="${param.donator}" id="donatorAccount" name="donatorAccount"/> --%>
						    <label>orgDonee :</label>
						    <input type="text" value="${param.orgDonee}" id="orgDoneeAccount" name="orgDoneeAccount"/>
						</div>
						<div>    
						    <label>Start Date :</label>
						    <input type="text" value="${param.donateTimeBegin}" id="donateTimeBegin" name="donateTimeBegin" autocomplete="off"/>
						    <label>End Date :</label>
						    <input type="text" value="${param.donateTimeEnd}" id="donateTimeEnd" name="donateTimeEnd" autocomplete="off"/>
					    	<input type="button" class="btn btn-outline-secondary" onclick="dataTable.ajax.reload()" value="search"  id="searchButt"/> 
							<input type="reset" class="btn btn-outline-secondary" onclick="dataTable.ajax.reload()" value="reset" id="resetButt"/>
<!-- 							<a class="btn btn-secondary" data-toggle="collapse" href="#collapse"  -->
<!-- 									role="button" aria-expanded="false" aria-controls="collapse">進階查詢</a> -->
					    </div>
<!-- 					    <div class="collapse" id="collapse"> -->
<!-- 						    <label>orgDonee:</label> -->
<%-- 						    <input type="text" value="${param.orgDonee}" id="orgDoneeAccount" name="orgDoneeAccount"/> --%>
<!-- 						    <label>起始日期</label> -->
<%-- 						    <input type="text" value="${param.donateTimeBegin}" id="donateTimeBegin" name="donateTimeBegin" autocomplete="off"/> --%>
<!-- 						    <label>結束日期</label> -->
<%-- 						    <input type="text" value="${param.donateTimeEnd}" id="donateTimeEnd" name="donateTimeEnd" autocomplete="off"/> --%>
<!-- 					  	</div> -->
					  	</fieldset>
					</form>
					</div>
					
					<fieldset>
						<table id="table" class="table table-hover">
							<thead class="thead-dark">
								<tr>
									<th scope="col" width="130px"></th>
<!-- 									<th scope="col">id</th> -->
<!-- 									<th scope="col">donator</th> -->
									<th scope="col">orgDonee</th>
									<th scope="col">value</th>
									<th scope="col">donateTime</th>
								</tr>
							</thead>
							<tbody id="tableBody">
							</tbody>
						</table>
					</fieldset>
				</article>
			</div>
		</div>
	</section>
	<!-- FOOTER -->
	<jsp:include page="../../commons/commons_layout/commons_footer.jsp"/>
	<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.js"></script>
	<script>
	var dataTable;
	$(document).ready(function() {
		$("form").addClass("form-inline");
		$("form div[id!='collapse']").addClass("form-group mx-sm-3 mb-3");
		$("form input, select").addClass("form-control mx-3");
		$("#searchButt, #resetButt").addClass("btn btn-outline-secondary");
		
		dataTable = $('#table').DataTable({
			pageResize: true, 
			fixedHeader: true,
			pagingType: 'full_numbers',
			searching: false,				
		 	processing: true,
			serverSide: true,  //分頁、排序都交由伺服器處理
			lengthMenu: [ 3, 6, 9, 12, ],
			ajax:{
				url:'/user/donation-record/query',
				type:'get',
				dataType:'json',
				//傳送給伺服器的資料(datatable預設傳送的資料)
				data: function(d){
// 					console.log(d);
					return $("form").serialize() + "&start=" + d.start + "&length=" + d.length;
				},
				//dataTable需顯示表格的資料標籤(預設標籤為data:)
				dataSrc:"content",
				//對伺服器送來的資料進行修改
				dataFilter: function(resp){
//	 				console.log(resp);
//	 				alert(console.log(resp));
//	 				alert("resp="+resp);
					var respJson = $.parseJSON(resp);
					respJson.recordsTotal = respJson.totalElements;
					respJson.recordsFiltered = respJson.totalElements;
//	 				console.log(JSON.stringify(respJson));
					return JSON.stringify(respJson);
				}
			},
			drawCallback: function (d) {
//	 			console.log(d);
				var api = this.api();
				var pageNum = parseInt(d.json.pageable.pageNumber);
				var totalPages = d.json.totalPages;
				$('#table_info').html('Currently showing page '+(pageNum+1)+' of '+totalPages+' pages.');
			},
			//設定datatable要顯示的資訊，需與表頭<th>數量一致(可隨意串接資料內容)
			columns:[
				{data:null},
// 				{data:'id'},
// 				{data:"donator.account"},
				{data:"orgDonee.account"},
				{data:"value"},
				{data: null, render: function ( data, type, row ) {
	                return new Date(data.donateTime).toLocaleDateString();
	            }},
			],
			columnDefs: [{
	            "searchable": false,
	            "orderable": false,
	            "targets": [0],
	        }],
	        order:[[1, 'asc']]
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
		
		var datePickerSetting = {
				format : "yyyy/mm/dd",
				autoclose : true,
				todayHighlight : true,
				language : 'zh-TW',
				clearBtn:true,
				startView:"2",
				endDate:"0d",
			};
		$('#donateTimeBegin').datepicker(datePickerSetting);
		$('#donateTimeEnd').datepicker(datePickerSetting);
	})
		
	</script>
</body>
</html>