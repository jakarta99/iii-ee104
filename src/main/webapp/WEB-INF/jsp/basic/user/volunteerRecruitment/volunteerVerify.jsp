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
                
                 
                </div>
              </div>
            </div>
            
            <div>
              <nav aria-label="Page navigation example">
                <ul id ="pagebox" class="pagination pagination-lg">
<!--                     換頁控制開始 -->
              	</ul>
              </nav>
            </div>    
            
          </section>
        </div>
        </div>
      
      
      
	
	
	<jsp:include page="../../commons/commons_layout/commons_footer.jsp"/>
	
<script>	
	var length=8;
	var page=0;
	var first;
	var last;
	
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
						list()		
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
						list()
						
					},
				})

			  } else {
	 				swal("未接受"+name+"擔任您的志工");
	 			 }
	 		}); 	
	}
	
	
	function list(){
		$.ajax({
			url:"/user/volunteerVerify/query?"+"page="+page+"&length="+length+"&missionId="+${missionId},
			type: "get",
		    dataType : "json",
		    
	        }).done(function(orders){
	        	$("#boxbox").text("");
	        	$("#pagebox").text("");
// 	        	console.log(members);
	        	
	        	var totalElements=orders.totalElements;
	        	console.log(totalElements);
	        	
	        	var totalPages=orders.totalPages;
	        	console.log(totalPages);
	        	
	        	first=orders.first;
	        	console.log(first);
	        	
	        	last=orders.last;
	        	console.log(last);
	        	
	        	page=orders.number;
	        	
	        	
	        	$.each(orders.content,function(index, order){
	        		console.log(order)
	        		var box="<div class='col-md-3'>"
	        			box+="<div data-animate='fadeInUp' class='team-member'>"
	        			box+="<div class='image'><a href='team-member.html'><img src='/image/user/member/"+order.volunteer.picture+"' class='img-fluid rounded-circle'></a></div>"
	        			box+="<h3><a href='team-member.html'>"+order.volunteer.name+"</a></h3><div>"
	        			if(order.orderStatus=='VolunteerApply'){
	        			box+="<button class='btn btn-outline-primary' onclick=\"accept("+order.id+",'"+order.volunteer.name+"')\" >接受</button>"
	        			box+="<button class='btn btn-outline-danger' onclick=\"reject("+order.id+",'"+order.volunteer.name+"')\" >拒絕</button></div>"
	        			}else if(order.orderStatus=='RequesterAcceptService'){
	        			box+="<span class='badge badge-success'>已接受</span>"
	        			}else if(order.orderStatus=='RequesterRefuceServiceMatchFail'){
	        			box+="<span class='badge badge-danger'>已拒絕</span>"	
	        			}else {
	        			box+= "<p>不應該出現的狀態</p>";
						}
	        			box+="<p class='role_2'>申請時間:"+new Date(order.volunteerApplyTime).toLocaleDateString()+"</p>"		
	        			box+="<ul class='social list-inline'>"
	        			box+="<li class='s3'><a href='#' class='star'><i class='fa fa-star'></i></a>平均分數:"+order.volunteer.averageScore+"</li>"
	        			box+="<li class='s3'><a href='#' class='external twitter'><i class='fa fa-phone'></i></a>電話:"+order.volunteer.telephone+"</li>"
	        			box+="<li class='s3'><a href='#' class='email'><i class='fa fa-envelope'></i></a>Email:"+order.volunteer.telephone+"</li>"
	        			box+="</ul></div></div>"
	        		var boxbox=$("#boxbox").append(box)
	        		
 	        	
	        		
	        		
	        	
	        	})
	        	
	        		$("#pagebox").append("<li class='page-item' id='backli'><a name='backa' class='page-link'>«</a></li><li class='page-item' id='nextli'><a name='nexta' class='page-link'>»</a></li>");
	        	
	        	for (var index = 1; index <= totalPages ; index++) {
	        		$("#nextli").before("<li class='page-item'><a name='count' id="+index+" class='page-link'>"+index+"</a></li>")
				}
	    
	    
	        })
	        
			}
	
	
	
	
	
	
	$(document).ready( function () {
		list()
// 		dataTable=$('#table').DataTable({
// 				pageResize: true,
// 				fixedHeader: true,
// 				pagingType: 'full_numbers',
// 	 			searching:false,
// 	 			processing:false,
// 	 			serverSide:true,
// 	 			"stateSave": true,
// 				"infoCallback": function( settings, start, end, max, total, pre ) {
// 		 			    var api = this.api();
// 		 			    var pageInfo = api.page.info();
// 		 			   api.rows( {page:'current'} ).data()
// 		 			    return '顯示第 '+(pageInfo.start+1)+' 筆到第  '+(pageInfo.end)+' 筆 共 '+ pageInfo.recordsTotal+' 筆資料 ';
// 		 			 },	
// 				"lengthMenu": [  6, 9, 12, ],
// 				ajax:{
// 					url:"/user/volunteerVerify/query",
// 					type: "get",
// 				    dataType : "json",
// 				    data: function(d){
// 						var missionId = ${missionId}
// 		            	var start = d.start;
// 						var length = d.length;
// 						var request = "start=" + start + "&length=" + length + "&missionId=" + missionId;
// 		            	return request;
// 		            },

// 				    dataSrc:"content",
// 				    dataFilter: function(resp){
// 		                var json = jQuery.parseJSON( resp );
// 		                json.recordsTotal = json.totalElements;
// 		                json.recordsFiltered = json.totalElements;	     			
// 		                return JSON.stringify( json ); 
// 		            	},
// 					},
// 					columns:[						
// 						{"data":"mission.title"},	
// 						{"data":"volunteer.account"},
// 						{"data":"volunteer.name"},
// 						{"data":"volunteer.telephone"},
// 						{"data":"volunteer.averageScore"},
// 			            {"data":null, render: function (data, type, row ) {
// 			                return new Date(data.volunteerApplyTime).toLocaleDateString();
// 			            } },	
						
									
// 						{"data": function (data, type, val) {
// 							if(data.orderStatus=='VolunteerApply'){
// 								 var acceptbutton="<button class='btn btn-outline-primary' onclick=\"accept("+data.id+",'"+data.volunteer.name+"')\">接受</button>";     
// 								 var rejectbutton="<button class='btn btn-outline-danger' onclick=\"reject("+data.id+",'"+data.volunteer.name+"')\">拒絕</button>"; 	
// 								 return acceptbutton + rejectbutton;
// 							 }else if(data.orderStatus=='RequesterAcceptService'){
// 								 var vbutton="<span class='badge badge-success'>已接受</span>"
// 								 return vbutton;
								 
// 							 }else if(data.orderStatus=='RequesterRefuceServiceMatchFail'){
// 								 var vbutton="<span class='badge badge-danger'>已拒絕</span>"
// 								 return vbutton;
								 
// 							 }else {
// 								 return "不應該出現的狀態";
// 							 }
// 						}
// 						},					 
					
// 			            {"data":"mission.missionstatus"},
									
// 					],
// 					 columnDefs: [{
// 			                "searchable": false,
// 			                "orderable": false,
// 			                "targets": [0],
// 			            }],
// 			            order: [[1, 'asc']]
					
					
					
// 				});	
		
		
		$("#pagebox").on("click","li>a[name='backa']", function(){
			if(first == false){
				page = page - 1;
				list();
			}
			 $('body,html').animate({
                 scrollTop: 0 }, 1);
		}) 
		
		$("#pagebox").on("click","li>a[name='nexta']", function(){
				if(last == false){
					page = page + 1;
					list();
				}
				 $('body,html').animate({
	                 scrollTop: 0 }, 1);
		 })

    	$("#pagebox").on("click","li>a[name='count']", function(){			
    		page=$(this).text()-1;
    		list();
    		 $('body,html').animate({
                 scrollTop: 0 }, 1);
    	})
		
		
	});
</script>
</body>
</html>