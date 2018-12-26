<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<!-- css -->
<jsp:include page="../../commons/commons_layout/commons_css_links.jsp"/>

<!-- Javascript files-->
<jsp:include page="../../commons/commons_layout/commons_js_links.jsp" />

<script defer
	src="https://use.fontawesome.com/releases/v5.0.6/js/all.js"></script>


<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.css">  
				
<!-- 台灣縣市地區選單	 -->
<script src="/js/tw-city-selector.min.js"></script>
<!-- date picker -->
<script type="text/javascript" src="/js/datepicker/moment.min.js"></script>
<script type="text/javascript" src="/js/datepicker/bootstrap-datepicker.js"></script>
<script src="/js/datepicker/bootstrap-datepicker.zh-TW.js"></script>
<link rel="stylesheet" href="/css/bootstrap-datepicker3.min.css" />

<!-- DateTimePicker -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.js"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.css" rel="stylesheet" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-ui-timepicker-addon/1.6.3/jquery-ui-timepicker-addon.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery-ui-timepicker-addon/1.6.3/i18n/jquery-ui-timepicker-zh-TW.js"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/jquery-ui-timepicker-addon/1.6.3/jquery-ui-timepicker-addon.min.css" rel="stylesheet" />

<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.js"></script>


<meta charset="UTF-8">
<title>志工審核</title>
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
      <jsp:include page="../../commons/commons_layout/commons_top-bar.jsp"/>
 	
	  <!-- Navbar -->
      <jsp:include page="../../commons/commons_layout/commons_nav.jsp"/>

	
	 <section class="bar">
        <div class="container">
          <div class="row">
            <jsp:include page="../user_layout/user_sidebar.jsp" />
    <div style="width:850px">
	<h1 class="s2">志工審核</h1>
	
	<fieldset >
	
<!-- 	<button class="btn btn-outline-secondary" id="status1Butt" >進行中</button> -->
<!-- 	<button class="btn btn-outline-secondary" id="status23Butt" >時數代核發</button> -->
<!-- 	<button class="btn btn-outline-secondary" id="status4Butt" >歷史紀錄</button> -->
	<table id="table" class="table table-hover">
	<thead>
	<tr>
		<th>選項</th>
		<th scope="col">招募編號</th>
		<th scope="col">志工名字</th>
		<th scope="col">聯絡方式</th>
		<th scope="col">評點分數</th>
		<th scope="col">申請時間</th>
		<th scope="col">志工審核</th>
		<th scope="col">活動狀態</th>
	</tr>
	 </thead>	
	 <tbody id="tbody">	
	 </tbody>
	</table>
		
	<button class="btn btn-outline-secondary" onclick="javascript:document.location.href='/'">回列表頁</button>
	
	</fieldset>
	</div>
	</div>
	</div>
	  </section>
	<jsp:include page="../../commons/commons_layout/commons_footer.jsp"/>
	
	<script>
	
	var dataTable;
	
	$(document).ready( function () {

		dataTable=$('#table').DataTable({
				pageResize: true,
				fixedHeader: true,
				pagingType: 'full_numbers',
	 			searching:false,
	 			processing:false,
	 			serverSide:true,
	 			"stateSave": true,
				"infoCallback": function( settings, start, end, max, total, pre ) {
		 			    var api = this.api();
		 			    var pageInfo = api.page.info();
		 			   	console.log(pageInfo);
		 			   api.rows( {page:'current'} ).data()
		 			    return '顯示第 '+(pageInfo.start+1)+' 筆到第  '+(pageInfo.end)+' 筆 共 '+ pageInfo.recordsTotal+' 筆資料 ';
		 			 },	
				"lengthMenu": [ 3, 6, 9, 12, ],
				ajax:{
					url:"/user/volunteerVerify/query",
					type: "get",
				    dataType : "json",
				    data: function(d){
		            	console.log(d);
		            	var start = d.start;
						var length = d.length;
						var request = $("form").serialize()+"&start="+start+"&length="+length;
		            	return request;
		            },

				    dataSrc:"content",
				    dataFilter: function(resp){
		                var json = jQuery.parseJSON( resp );
		                json.recordsTotal = json.totalElements;
		                json.recordsFiltered = json.totalElements;	     			
		                return JSON.stringify( json ); 
		            	},
					},
					columns:[						
						{"data":""},						
						{"data":"order.volunteer.name"},
						{"data":"order.volunteer.telephone"},
						{"data":"order.volunteer.averageScore"},
			            {"data":null, render: function ( data, type, row ) {
			                return new Date(data.volunteerApplyTime).toLocaleDateString();
			            } },	
									
						{"data": function (data, type, val) {
							 var editbutton="<button class='btn btn-outline-secondary' onclick=\"javascript:document.location.href='/user/volunteerRecruitment/edit?id="+data.id+"'\">接受</button>";     
							 var deletebutton="<button class='btn btn-outline-secondary' onclick=\"deleteMission("+data.id+")\">拒絕</button>"; 	
							 return editbutton + deletebutton;}
						},					 
					
			            {"data":"order.mission.missionStatus"},
									
					],
					 columnDefs: [{
			                "searchable": false,
			                "orderable": false,
			                "targets": [0],
			            }],
			            order: [[1, 'asc']]
					
					
					
				});		
		
		
	});
	</script>
	 <!-- FOOTER -->
   <jsp:include page="../../commons/commons_layout/commons_footer.jsp" />	
</body>
</html>