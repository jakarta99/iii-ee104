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
      <jsp:include page="../../commons/commons_layout/commons_top-bar.jsp"/>
 	
	  <!-- Navbar -->
      <jsp:include page="../../commons/commons_layout/commons_nav.jsp"/>

	
	 <section class="bar">
        <div class="container">
          <div class="row">
            <jsp:include page="../user_layout/user_sidebar.jsp" />
    <div style="width:850px">
	<h1 class="s2">mission list</h1>
	<fieldset>
	<form>
			<div>
			基本查詢:
			</div>
			
			<label>縣市:</label> 
			<div style='display:inline' role="tw-city-selector" ></div>
			
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
				
<!-- 			<label>狀態:</label>  -->
<!-- 				<select  id="status" name="status"> -->
<!-- 					<option value="">選擇狀態</option> -->
<!-- 					<option value="1">1</option> -->
<!-- 			        <option value="2">2</option> -->
<!-- 			        <option value="3">3</option> -->
<!-- 			        <option value="4">4</option> -->
<!-- 				</select>	 -->
				
			<label>startDate:</label>
			<input type="text"  id="startDate" name="startDate" autocomplete="off"/>
			<label>endDate:</label>
			<input type="text"  id="endDate" name="endDate" autocomplete="off"/>
			
			
			<input type="button" value="搜尋" id="searchButt" />
			<div>
			
			<a class="btn btn-outline-secondary" data-toggle="collapse" href="#collapse" role="button" aria-expanded="false" aria-controls="collapseExample">
			進階查詢:
  			</a>
  			</div> 
			<div class="collapse" id="collapse">
			
			<label>timeValue :</label> 
			<input type="text" value="" placeholder="timeValue" id="timeValue" name="timeValue"/>
			
			<label>title :</label> 
			<input type="text" value="" placeholder="title" id="title" name="title"/>
			
			
			<label>statusDetail :</label> 
			<input type="text" value="" placeholder="statusDetail" id="statusDetail" name="statusDetail"/>
			
			
			</div>
		</form>
	</fieldset>
	
	<fieldset >
	
	<button class="btn btn-outline-primary" id="status12Butt" >進行中</button>
	<button class="btn btn-outline-secondary" id="status3Butt" >時數代核發</button>
	<button class="btn btn-outline-secondary" id="status4Butt" >歷史紀錄</button>
	<table id="table" class="table table-hover">
	<thead>
	<tr>
		<th>選項</th>
		<th scope="col">活動名稱</th>
		<th scope="col">需求人數</th>
		<th scope="col">地點</th>
		<th scope="col">時間</th>
		<th scope="col">志工審核</th>
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
// 	<button class="btn btn-outline-primary" id="status1Butt" >進行中</button>
// 	<button class="btn btn-outline-secondary" id="status23Butt" >時數代核發</button>
// 	<button class="btn btn-outline-secondary" id="status4Butt" >歷史紀錄</button>
	
 	$("#searchButt").click(function(){
		
 		dataTable.ajax.reload();
	})
	
	$("#status12Butt").click(function(){
		$("#statusDetail").val("2");
		$("#status12Butt").attr('class',"btn btn-outline-primary")
		$("#status3Butt").attr('class',"btn btn-outline-secondary")
		$("#status4Butt").attr('class',"btn btn-outline-secondary")
		dataTable.ajax.reload();
		
	})
	
	$("#status3Butt").click(function(){
		$("#status12Butt").attr('class',"btn btn-outline-secondary")
		$("#status3Butt").attr('class',"btn btn-outline-primary")
		$("#status4Butt").attr('class',"btn btn-outline-secondary")
		$("#statusDetail").val('3');
		dataTable.ajax.reload();
		
	})
	
	$("#status4Butt").click(function(){
		$("#status12Butt").attr('class',"btn btn-outline-secondary")
		$("#status3Butt").attr('class',"btn btn-outline-secondary")
		$("#status4Butt").attr('class',"btn btn-outline-primary")
		$("#statusDetail").val('4');
		dataTable.ajax.reload();
		
	})
	
	
	function cancelMission(id) {
		$.ajax({
			url : '/user/volunteerRecruitment/cancel?id=' + id,
			type : 'post',
			dataType : 'JSON',
			success : function(cancelResult) {
 				alert(cancelResult);
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
		$("#statusDetail").val("2");
		
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
							 var editbutton="<button class='btn btn-outline-secondary' onclick=\"javascript:document.location.href='/user/volunteerRecruitment/edit?id="+data.id+"'\">編輯</button>";     
							 var cancelbutton="<button class='btn btn-outline-secondary' onclick=\"cancelMission("+data.id+")\">取消</button>"; 	
							 return editbutton + cancelbutton;}
						},					 
						{"data":"title"},
						{"data":"peopleNeeded"},						
						{"data": null, render: function ( data, type, row ) {
			                return data.county + data.district+ data.address;
			            }},						
						
			            {"data":null, render: function ( data, type, row ) {
			                return new Date(data.startDate).toLocaleDateString();
			            } },	
					
						{"data":function (data, type, val) {
							var vbutton="<button class='btn btn-outline-secondary' onclick=\"javascript:document.location.href='/user/volunteerVerify/list?id="+data.id+"'\">志工審核</button>";   
							return vbutton;}							 
						},
			            {"data":"status.missionStatus"},
									
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