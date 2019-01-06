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

<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.js"></script>
<!-- sweetalert -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>


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
            text-align: center;
        }
        .s3{
            margin: 5px;
            text-align: left;
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
              <h1 class="h2">志工審核</h1>
            </div>
          </div>
        </div>
      </div>
      
       <div id="content">
        <div class="container">
          <section class="bar mb-0">
            <div class="row">
              <div class="col-md-12">
                <div class="heading">
                  <h2>志工審核</h2>
                </div>
                <p class="lead">以下是對您的招募有興趣的志工，您可以接受或拒絕</p>
                <div id="boxbox" class="row text-center">
<!--                 志工名單開始 -->
                
                  <div class="col-md-3">
                    <div data-animate="fadeInUp" class="team-member">
                      <div class="image"><a href="team-member.html"><img src="../../img/person-1.jpg" alt="" class="img-fluid rounded-circle"></a></div>
                      <h3><a href="team-member.html">志工名稱</a></h3>
                      <p class="role_1">申請時間</p>
                      <ul class="social list-inline">
                       	<li class="s3"><a href="#" class="star"><i class="fa fa-star"></i></a>平均XXX分</li>
<!--                         <li class="s3"><a href="#" class="external facebook"><i class="fa fa-facebook"></i></a>7878787878787878787</li> -->
<!--                         <li class="s3"><a href="#" class="external gplus"><i class="fa fa-google-plus"></i></a>787878787878787878</li> -->
                        <li class="s3"><a href="#" class="external twitter"><i class="fa fa-phone"></i></a>87878787878</li>
                        <li class="s3"><a href="#" class="email"><i class="fa fa-envelope"></i></a>8787878787878</li>
                      </ul>
                      
                    </div>
                  </div>
                  <!-- /.team-member-->
                  <div data-animate="fadeInUp" class="col-md-3">
                    <div class="team-member">
                      <div class="image"><a href="team-member.html"><img src="../../img/person-2.jpg" alt="" class="img-fluid rounded-circle"></a></div>
                      <h3><a href="team-member.html">Luke Skywalker</a></h3>
                      <p class="role">CTO</p>
                      <ul class="social list-inline">
                        <li class="list-inline-item"><a href="#" class="external facebook"><i class="fa fa-facebook"></i></a></li>
                        <li class="list-inline-item"><a href="#" class="external gplus"><i class="fa fa-google-plus"></i></a></li>
                        <li class="list-inline-item"><a href="#" class="external twitter"><i class="fa fa-twitter"></i></a></li>
                        <li class="list-inline-item"><a href="#" class="email"><i class="fa fa-envelope"></i></a></li>
                      </ul>
                      <div class="text">
                        <p>Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.</p>
                      </div>
                    </div>
                  </div>
                  <!-- /.team-member-->
                  <div data-animate="fadeInUp" class="col-md-3">
                    <div class="team-member">
                      <div class="image"><a href="team-member.html"><img src="../../img/person-3.png" alt="" class="img-fluid rounded-circle"></a></div>
                      <h3><a href="team-member.html">Princess Leia</a></h3>
                      <p class="role">Team Leader</p>
                      <ul class="social list-inline">
                        <li class="list-inline-item"><a href="#" class="external facebook"><i class="fa fa-facebook"></i></a></li>
                        <li class="list-inline-item"><a href="#" class="external gplus"><i class="fa fa-google-plus"></i></a></li>
                        <li class="list-inline-item"><a href="#" class="external twitter"><i class="fa fa-twitter"></i></a></li>
                        <li class="list-inline-item"><a href="#" class="email"><i class="fa fa-envelope"></i></a></li>
                      </ul>
                      <div class="text">
                        <p>Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.</p>
                      </div>
                    </div>
                  </div>
                  <!-- /.team-member-->
                  <div data-animate="fadeInUp" class="col-md-3">
                    <div class="team-member">
                      <div class="image"><a href="team-member.html"><img src="../../img/person-4.jpg" alt="" class="img-fluid rounded-circle"></a></div>
                      <h3><a href="team-member.html">Jabba Hut</a></h3>
                      <p class="role">Lead Developer</p>
                      <ul class="social list-inline">
                        <li class="list-inline-item"><a href="#" class="external facebook"><i class="fa fa-facebook"></i></a></li>
                        <li class="list-inline-item"><a href="#" class="external gplus"><i class="fa fa-google-plus"></i></a></li>
                        <li class="list-inline-item"><a href="#" class="external twitter"><i class="fa fa-twitter"></i></a></li>
                        <li class="list-inline-item"><a href="#" class="email"><i class="fa fa-envelope"></i></a></li>
                      </ul>
                      <div class="text">
                        <p>Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.</p>
                      </div>
                    </div>
                  </div>
                </div>
                    </div>
            </div>
          </section>
        </div>
        </div>
      
      
      
	
	 <section class="bar">
        <div class="container">
          <div class="row">
    <div style="width:850px">

	
	<fieldset >
	
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
	
	function accept(id,name) {
		swal({
			  title: "確定招募"+name+"擔任志工?",
			  text: "招募後"+name+"將成為您的志工",
			  icon: "warning",
			  buttons: true,
			  dangerMode: true,
			})
			.then((willaccept) => {
			  if (willaccept) {
				
				$.ajax({
					url : '/user/volunteerVerify/accept?id=' + id,
					type : 'post',
					dataType : 'JSON',
					success : function(acceptResult) {
						if(acceptResult.status == "SUCCESS"){
							
							swal("接受"+acceptResult.obj.volunteer.name+"的志工申請成功", {
				 			      icon: "success",
				 			 });
							
						}else{
							
							swal("接受"+acceptResult.obj.name+"失敗，因為"+acceptResult.messages+"", {
				 			      icon: "error",
				 			});
							
						}
						dataTable.ajax.reload();				
					},
				})
			
			  } else {
	 				swal("未接受"+name+"成為您的志工");
	 			 }
	 		}); 	
	}
	
	function reject(id,name) {
		
		swal({
			  title: "確定拒絕"+name+"擔任您的志工?",
			  text: "拒絕後"+name+"將無法為您服務",
			  icon: "warning",
			  buttons: true,
			  dangerMode: true,
			})
			.then((willreject) => {
			  if (willreject) {
				
				$.ajax({
					url : '/user/volunteerVerify/reject?id=' + id,
					type : 'post',
					dataType : 'JSON',
					success : function(rejectResult) {
						if(rejectResult.status == "SUCCESS"){
// 							alert("拒絕編號" + rejectResult.obj.id + " " + rejectResult.status);									
							swal("拒絕"+rejectResult.obj.volunteer.name+"的志工申請成功", {
				 			      icon: "success",
				 			 });
							
						}else{
// 							alert("拒絕編號" + rejectResult.obj.id + " " + rejectResult.status);
// 							alert("FAIL reason:" + rejectResult.messages);
							swal("拒絕"+rejectResult.obj.volunteer.name+"失敗，因為"+rejectResult.messages+"", {
				 			      icon: "error",
				 			});
						}
						dataTable.ajax.reload();
						
					},
				})

			  } else {
	 				swal("未接受"+name+"擔任您的志工");
	 			 }
	 		}); 	
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
				"lengthMenu": [  6, 9, 12, ],
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
							if(data.orderStatus=='VolunteerApply'){
								 var acceptbutton="<button class='btn btn-outline-primary' onclick=\"accept("+data.id+",'"+data.volunteer.name+"')\">接受</button>";     
								 var rejectbutton="<button class='btn btn-outline-danger' onclick=\"reject("+data.id+",'"+data.volunteer.name+"')\">拒絕</button>"; 	
								 return acceptbutton + rejectbutton;
							 }else if(data.orderStatus=='RequesterAcceptService'){
								 var vbutton="<span class='badge badge-success'>已接受</span>"
								 return vbutton;
								 
							 }else if(data.orderStatus=='RequesterRefuceServiceMatchFail'){
								 var vbutton="<span class='badge badge-danger'>已拒絕</span>"
								 return vbutton;
								 
							 }else {
								 return "不應該出現的狀態";
							 }
						}
						},					 
					
			            {"data":"mission.missionstatus"},
									
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