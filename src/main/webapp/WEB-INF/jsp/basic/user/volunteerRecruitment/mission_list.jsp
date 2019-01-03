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
<!-- 台灣縣市地區選單	 -->
<script src="/js/tw-city-selector.min.js"></script>
<!-- date picker -->
<script type="text/javascript" src="/js/datepicker/moment.min.js"></script>
<script type="text/javascript" src="/js/datepicker/bootstrap-datepicker.js"></script>
<script src="/js/datepicker/bootstrap-datepicker.zh-TW.js"></script>
<link rel="stylesheet" href="/css/bootstrap-datepicker3.min.css" />
	
<jsp:include page="../../commons/commons_layout/commons_css_links.jsp"/>
<!-- DateTimePicker -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.js"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.css" rel="stylesheet" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-ui-timepicker-addon/1.6.3/jquery-ui-timepicker-addon.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery-ui-timepicker-addon/1.6.3/i18n/jquery-ui-timepicker-zh-TW.js"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/jquery-ui-timepicker-addon/1.6.3/jquery-ui-timepicker-addon.min.css" rel="stylesheet" />



<meta charset="UTF-8">
<title>mission list(login)</title>
<style>
		
        fieldset {
        	background-color:#CCEEFF;
            width: 100%;
            border-radius: 20px;
            padding: 20px 20px 0px 20px;
            margin: auto;
            margin-top: 10px;
            margin-bottom: 20px;
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
	<div id="heading-breadcrumbs">
       <div class="container">
          <div class="row d-flex align-items-center flex-wrap">
            <div class="col-md-7">
              <h1 class="h2">招募清單</h1>
            </div>
          </div>
        </div>
      </div>
	
	 <section class="bar">
        <div class="container">
          <div class="row">
            
    <div>
	
	<form>
	<fieldset>
		<legend>基本查詢</legend>
			<div class="form-group mx-sm-3 mb-3">
			<label>活動名稱 :</label> 
			<input type="text" value="" placeholder="" id="title" name="title"/>
			
			<input type="button" value="搜尋" id="searchButt" />
			<div>
			
			<a class="btn btn-outline-secondary" data-toggle="collapse" href="#collapse" role="button" aria-expanded="false" aria-controls="collapseExample">
			進階查詢:
  			</a>
  			</div> 
			<div class="collapse" id="collapse">
			<div class="form-group mx-sm-3 mb-3">
					<label>縣市:</label> 	
					<div role="tw-city-selector"></div>
				</div>
			<label>會員類型 :</label> 
				<select  id="serviceTypeDetail" name="serviceTypeDetail">
					<option value="">選擇服務類型</option>
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
				
			<label>長短期 :</label> 
				<select  id="termType" name="termType">
					<option value="">選擇長短期</option>
					<option value="L">長期</option>
			        <option value="S">短期</option>
				</select>
			<label>時數 :</label> 
			<input type="text" value="" placeholder="timeValue" id="timeValue" name="timeValue"/>
			<div>	
				<label>開始日期:</label>
				<input type="text"  id="startDate" name="startDate" autocomplete="off"/>
				<label>結束日期:</label>
				<input type="text"  id="endDate" name="endDate" autocomplete="off"/>
			</div>
			
			
			
			<input type="hidden" value="" placeholder="missionstatus" id="missionstatus" name="missionstatus"/>
			
			
			</div>
			</div>
			</fieldset>
		</form>
	
	
	<fieldset >
	<ul  id="pills-tab" role="tablist" class="nav nav-pills nav-justified">
       <li class="nav-item"><a id="status12Butt" data-toggle="pill" href="#pills-home" role="tab" aria-controls="pills-home" aria-selected="true" class="nav-link active">未開始</a></li>
       <li class="nav-item"><a id="status3Butt" data-toggle="pill" href="#pills-profile" role="tab" aria-controls="pills-profile" aria-selected="false" class="nav-link">時數未核發</a></li>
       <li class="nav-item"><a id="status4Butt" data-toggle="pill" href="#pills-contact" role="tab" aria-controls="pills-contact" aria-selected="false" class="nav-link">歷史紀錄</a></li>
    </ul>
	
	<table id="table" class="table table-hover">
	<thead class="thead-dark">
	<tr>
		<th>選項</th>
		<th scope="col">活動名稱</th>
		<th scope="col">需求人數</th>
		<th scope="col">地點</th>
		<th id="time" scope="col">開始時間</th>
		<th id="statusField" scope="col">志工審核</th>
		<th scope="col">狀態</th>
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
	<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.js"></script>
	
	<script>
	
	var dataTable;

	
 	$("#searchButt").click(function(){
		
 		dataTable.ajax.reload();
	})
	
	$("#status12Butt").click(function(){
		$("#time").empty().append("開始時間");
		$("#statusField").empty().append("志工審核");
		$("#missionstatus").val("A_VolunteerApproved");
		dataTable.ajax.reload();
		
	})
	
	$("#status3Butt").click(function(){
		$("#time").empty().append("結束時間");
		$("#statusField").empty().append("時數核發");
		$("#missionstatus").val('B_AccountsPayable');
		dataTable.ajax.reload();
		
	})
	
	$("#status4Butt").click(function(){
		$("#time").empty().append("結案時間");
		$("#statusField").empty().append("結案紀錄");
		$("#missionstatus").val('C_Finish');
		dataTable.ajax.reload();
		
	})
	
	
	function cancelMission(id) {
		$.ajax({
			url : '/user/volunteerRecruitment/cancel?id=' + id,
			type : 'post',
			dataType : 'JSON',
			success : function(cancelResult) {
//  				alert(cancelResult);
				if(cancelResult.status == "SUCCESS"){
					alert("取消編號" + cancelResult.obj.id + " " + cancelResult.status);									
					
				}else{
					alert("取消編號" + cancelResult.obj.id + " " + cancelResult.status);
					alert("FAIL reason:" + cancelResult.messages);	
				}
				dataTable.ajax.reload();
				
			},
		})
	}
		
	

	$(document).ready( function () {

		new TwCitySelector();
		
		$('#startDate').datetimepicker({
			dateFormat: "yy/mm/dd",
		    todayHighlight: true,
		    language: 'zh-TW',
		    startView:"years",
		})
		
		$('#endDate').datetimepicker({
			dateFormat: "yy/mm/dd",
		    todayHighlight: true,
		    language: 'zh-TW',
		    startView:"years",
		})
		
		$("#missionstatus").val("A_VolunteerApproved");
		
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
				"lengthMenu": [  6, 9, 12, ],
				ajax:{
					url:"/user/volunteerRecruitment/query",
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
						{"data": function (data, type, val) {
							if(data.missionstatus=="A_New"||data.missionstatus=="A_VolunteerApproved"){
							 var editbutton="<button class='btn btn-outline-primary' onclick=\"javascript:document.location.href='/user/volunteerRecruitment/edit?id="+data.id+"'\">編輯</button>";     
							 var cancelbutton="<button class='btn btn-outline-danger' onclick=\"cancelMission("+data.id+")\">取消</button>"; 	
							 return editbutton + cancelbutton;
							 }else if(data.missionstatus == "B_AccountsPayable"){
								 return "待核發" ;
							 }else if(data.missionstatus == "C_Finish" || data.missionstatus == "C_Cancel"){
								 return "結案活動" ;
							 }
						}
						},					 
						{"data":"title"},
						{"data":"peopleNeeded"},						
						{"data": null, render: function ( data, type, row ) {
			                return data.county + data.district+ data.address;
			            }},						
						
			            {"data":null, render: function ( data, type, row ) {
			            	if(data.missionstatus == "A_New" || data.missionstatus == "A_VolunteerApproved"){
			            		return new Date(data.startDate).toLocaleDateString();
			            	}else if(data.missionstatus == "B_AccountsPayable"){
			            		return new Date(data.endDate).toLocaleDateString();
			            	}else if(data.missionstatus == "C_Finish" || data.missionstatus == "C_Cancel"){
			            		return new Date(data.finishDate).toLocaleDateString();
			            	}
			            	return new Date(data.startDate).toLocaleDateString();
			                
			            }},	
					
						{"data":function (data, type, val) {
							if(data.missionstatus=="A_New"){
							var vbutton="<button class='btn btn-outline btn-primary' onclick=\"javascript:document.location.href='/user/volunteerVerify/list?id="+data.id+"'\">志工審核</button>";   
								return vbutton;
								
							}else if(data.missionstatus=="B_AccountsPayable"){
								var vbutton="<button class='btn btn-outline-secondary' onclick=\"javascript:document.location.href='/user/payTime/list?id="+data.id+"'\">核發時數</button>";   
								return vbutton;

							}else if(data.missionstatus=="C_Cancel"){
								var vbutton="<button class='btn btn-outline-secondary' onclick=\"javascript:document.location.href='/user/closed/list?id="+data.id+"'\">取消紀錄</button>";   
								return vbutton;	
							
							}else if(data.missionstatus=="C_Finish"){
								var vbutton="<button class='btn btn-outline-secondary' onclick=\"javascript:document.location.href='/user/closed/list?id="+data.id+"'\">結案紀錄</button>";   
								return vbutton;	
							
							}else{
								var vbutton="<span class='badge badge-success'>已審核</span>"
								return vbutton;
							}
							
							}							 
						},
			            
						{"data":function (data, type, val) {
							if(data.missionstatus=="A_New"){
								return "未開始";
								
							}else if(data.missionstatus=="B_AccountsPayable"){
								return "進行中";

							}else if(data.missionstatus=="C_Cancel"){
								return "已取消";	
							
							}else if(data.missionstatus=="C_Finish"){
								return "已結案";	
							
							}else{
								return "未開始已審核";
							}
							
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
</body>
</html>