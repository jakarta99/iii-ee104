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
	<h1 class="s2">時數核發</h1>
	
	<fieldset >
	
<!-- 	<input id='spinner' name='value'> -->
	
<!-- 	<button class="btn btn-outline-secondary" id="status1Butt" >進行中</button> -->
<!-- 	<button class="btn btn-outline-secondary" id="status23Butt" >時數代核發</button> -->
<!-- 	<button class="btn btn-outline-secondary" id="status4Butt" >歷史紀錄</button> -->
	<table id="table" class="table table-hover">
	<thead>
	<tr>
		<th>活動名稱</th>
		<th scope="col">志工帳號</th>
		<th scope="col">志工名字</th>
		<th scope="col">聯絡方式</th>
		<th scope="col">評點分數</th>
		<th scope="col">申請時間</th>
		<th scope="col">時數核發</th>
		<th scope="col">檢舉</th>
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
	
	
	
	
	function accept(id) {
		$.ajax({
			url : '/user/volunteerVerify/accept?id=' + id,
			type : 'post',
			dataType : 'JSON',
			success : function(acceptResult) {
				if(acceptResult.status == "SUCCESS"){
					alert("接受編號" + acceptResult.obj.id + " " + acceptResult.status);									
					
				}else{
					alert("接受編號" + acceptResult.obj.id + " " + acceptResult.status);
					alert("FAIL reason:" + acceptResult.messages);	
				}
				dataTable.ajax.reload();
				
			},
		})
	}
	
	function reject(id) {
		$.ajax({
			url : '/user/volunteerVerify/reject?id=' + id,
			type : 'post',
			dataType : 'JSON',
			success : function(rejectResult) {
				if(rejectResult.status == "SUCCESS"){
					alert("拒絕編號" + rejectResult.obj.id + " " + rejectResult.status);									
					
				}else{
					alert("拒絕編號" + rejectResult.obj.id + " " + rejectResult.status);
					alert("FAIL reason:" + rejectResult.messages);	
				}
				dataTable.ajax.reload();
				
			},
		})
	}
	
	
	
	
	
	
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
		 			   api.rows( {page:'current'} ).data()
		 			    return '顯示第 '+(pageInfo.start+1)+' 筆到第  '+(pageInfo.end)+' 筆 共 '+ pageInfo.recordsTotal+' 筆資料 ';
		 			 },	
				"lengthMenu": [ 3, 6, 9, 12, ],
				ajax:{
					url:"/user/volunteerVerify/query",
					type: "get",
				    dataType : "json",
				    data: function(d){
// 		            	var mission = ${mission};
// 		            	alert(mission);
						var missionId = ${missionId}
		            	var start = d.start;
						var length = d.length;
						var request = "start=" + start + "&length=" + length + "&missionId=" + missionId;
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
						{"data":"mission.title"},	
						{"data":"volunteer.account"},
						{"data":"volunteer.name"},
						{"data":"volunteer.telephone"},
						{"data":"volunteer.averageScore"},
			            {"data":null, render: function (data, type, row ) {
			                return new Date(data.volunteerApplyTime).toLocaleDateString();
			            } },	
						
									
						{"data": function (data, type, val) {
							
							if(data.orderStatus=="ServiceFinishNotPay"){
								var select = "<select id='timeValue' name='timeValue' class='form-control'>"
								for(var i = 0 ; i <= data.mission.timeValue ; i++){
									select += "<option value='" + i + "'>"+ i + "</option>"
								}
								select +='</select>'
								var paybutton="<button class='btn btn-outline-secondary' onclick=\"accept("+data.id+")\">時數核發</button>";     
								return select + paybutton;
								
							
							 }else {
								 return "不應該出現的狀態";
							 }
						}
						},					 
					
			            {"data":function (data, type, val) {
						
								
								
								var paybutton="<button class='btn btn-outline-secondary' onclick=\"accept("+data.id+")\">檢舉</button>";     
								return paybutton;
								
							
						}
						},					
									
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