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
              <h1 class="h2">時數核發</h1>
            </div>
          </div>
        </div>
      </div>
      
     
      
      
      
<!--       <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal" data-whatever="@mdo">時數審核與評分</button> -->
<!--       <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true"> -->
<!--   <div class="modal-dialog" role="document"> -->
<!--     <div class="modal-content"> -->
<!--       <div class="modal-header"> -->
<!--         <h5 class="modal-title" id="exampleModalLabel">審核志工XXX的時數與評分</h5> -->
<!--         <button type="button" class="close" data-dismiss="modal" aria-label="Close"> -->
<!--           <span aria-hidden="true">&times;</span> -->
<!--         </button> -->
<!--       </div> -->
<!--       <div class="modal-body"> -->
<!--         <form> -->
<!--          <div class="form-group"> -->
<!--   <label for="amount">志工分數:</label> -->
<!--   <input type="text" id="amount" readonly style="border:0; color:#f6931f; font-weight:bold;"> -->
<!-- 	<div id="slider-range-max"></div> -->
<!-- 	</div> -->
          
<!--           <div class="form-group"> -->
<!--             <label for="recipient-name" class="col-form-label">Recipient:</label> -->
<!--             <input type="text" class="form-control" id="recipient-name"> -->
<!--           </div> -->
<!--           <div class="form-group"> -->
<!--             <label for="message-text" class="col-form-label">Message:</label> -->
<!--             <textarea class="form-control" id="message-text"></textarea> -->
<!--           </div> -->
<!--         </form> -->
<!--       </div> -->
<!--       <div class="modal-footer"> -->
<!--         <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button> -->
<!--         <button type="button" class="btn btn-primary">Send message</button> -->
<!--       </div> -->
<!--     </div> -->
<!--   </div> -->
<!-- </div> -->
      
      
      
      
      
      
      
      
      
      <div id="content">
        <div class="container">
          <section class="bar mb-0">
            <div class="row">
              <div class="col-md-12">
                <div class="heading">
                  <h2>時數核發</h2>
                </div>
                <p class="lead">以下是幫您完成服務的志工，您可以在此審核時數與評分</p>
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
      
	
<!-- 	 <section class="bar"> -->
<!--         <div class="container"> -->
<!--           <div class="row"> -->
<!--     <div > -->
	
<!-- 	<fieldset > -->
	
<!-- 	<input id='spinner' name='value'> -->
	
<!-- 	<button class="btn btn-outline-secondary" id="status1Butt" >進行中</button> -->
<!-- 	<button class="btn btn-outline-secondary" id="status23Butt" >時數代核發</button> -->
<!-- 	<button class="btn btn-outline-secondary" id="status4Butt" >歷史紀錄</button> -->
<!-- 	<table id="table" class="table table-hover"> -->
<!-- 	<thead> -->
<!-- 	<tr> -->
<!-- 		<th>活動名稱</th> -->
<!-- 		<th scope="col">志工帳號</th> -->
<!-- 		<th scope="col">志工名字</th> -->
<!-- 		<th scope="col">聯絡方式</th> -->
<!-- 		<th scope="col">申請時間</th> -->
<!-- 		<th scope="col">評點分數</th> -->
<!-- 		<th scope="col">時數核發</th> -->
<!-- 		<th scope="col">時數核發與評分</th> -->
<!-- 		<th scope="col">檢舉</th> -->
<!-- 	</tr> -->
<!-- 	 </thead>	 -->
<!-- 	 <tbody id="tbody">	 -->
<!-- 	 </tbody> -->
<!-- 	</table> -->
		
<!-- 	<button class="btn btn-outline-secondary" onclick="javascript:document.location.href='/'">回列表頁</button> -->
	
<!-- 	</fieldset> -->
<!-- 	</div> -->
<!-- 	</div> -->
<!-- 	</div> -->
<!-- 	  </section> -->
	<jsp:include page="../../commons/commons_layout/commons_footer.jsp"/>
	
<script>
	
// 	var dataTable;
	var length=8;
	var page=0;
	var first;
	var last;
	
	
// 	$( function() {
// 	    $( "#slider-range-max" ).slider({
// 	      range: "max",
// 	      min: 1,
// 	      max: 5,
// 	      value: 5,
// 	      slide: function( event, ui ) {
// 	        $( "#amount" ).val( ui.value );
// 	      }
// 	    });
// 	    $( "#amount" ).val( $( "#slider-range-max" ).slider( "value" ) );
// 	  } );
	
	
	
	function pay(orderId,volunteerId,name) {
		console.log(name)
		
		swal({
 			  title: "確定給予志工"+name+"	"+$("#"+volunteerId+" option:selected").val()+"小時與"+$("#score"+volunteerId+" option:selected").val()+"星評分嗎?",
 			  text: "確定後將進行付款與志工評點",
 			  icon: "warning",
 			  buttons: true,
 			  dangerMode: true,
 			})
 			.then((willcancel) => {
 			  if (willcancel) {
		
		$.ajax({
			url : '/user/payTime/pay?orderId=' + orderId+'&hours='+$("#"+volunteerId+" option:selected").val()+'&score='+$("#score"+volunteerId+" option:selected").val(),
			type : 'get',
			dataType : 'JSON',
			success : function(payResult) {
				if(payResult.status == "SUCCESS"){
// 					alert("審核編號" + payResult.obj.id + " " + payResult.status);	
					 swal("付款與評點"+payResult.obj.volunteer.name+"成功", {
		 			      icon: "success",
		 			 });
					
					
				}else{
// 					alert("審核編號" + payResult.obj.id + " " + payResult.status);
// 					alert("FAIL reason:" + payResult.messages);	
					
					swal("付款與評點"+payResult.obj.volunteer.name+"失敗，因為"+payResult.messages+"", {
		 			      icon: "error",
		 			});
				}
				list()
				
			},
		})
		
		   
 			  } else {
 			    swal("取消"+name+"的付款與評點");
 			  }
 			}); 	
	}
	
	
	
	
	function penalty(orderId) {
		$.ajax({
			url : '/penalty/report?orderId=' + orderId,
			type : 'post',
			dataType : 'JSON',
			success : function(penaltyResult) {
				if(penaltyResult.status == "SUCCESS"){
					alert("檢舉編號" + penaltyResult.obj.id + " " + penaltyResult.status);									
					
				}else{
					alert("檢舉編號" + penaltyResult.obj.id + " " + penaltyResult.status);
					alert("FAIL reason:" + penaltyResult.messages);	
				}
				dataTable.ajax.reload();
				
			},
		})
	}
	
	function list(){
		$.ajax({
			url:"/user/payTime/query?"+"page="+page+"&length="+length+"&missionId="+${missionId},
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
	        			
	        			if(order.orderStatus=='ServiceFinishNotPay'){
	        			box+= "<div class='form-row'><div class='form-group col-md-6'><label>分數:</label><select class='form-control' id='score"+order.volunteer.id+"' name='timeValue' >"
	        			for(var x = 1 ; x <=5 ; x++){
							if(x==5){
								box += "<option selected='true' value='" + x + "'>"+ x + "</option>"	
							}else{
								box += "<option value='" + x + "'>"+ x + "</option>"
							}
						}	
	        			box +='</select></div>'
	        			
	        			
	        			box +="<div class='form-group col-md-6'><label>時數:</label><select class='form-control' id='"+order.volunteer.id+"' name='timeValue'>"
	        			for(var i = 0 ; i <= order.mission.timeValue ; i++){
								if(i==order.mission.timeValue){
									box += "<option selected='true' value='" + i + "'>"+ i + "</option>"	
								}else{
									box += "<option value='" + i + "'>"+ i + "</option>"
								}
							}
	        			box +='</select></div></div>'	
						var value=$("#"+order	.volunteer.id+" option:selected").val()
	        			
	        			box+="<button class='btn btn-outline-primary' onclick=\"pay("+order.id+","+order.volunteer.id+",'"+order.volunteer.name+"')\">時數核發與評分</button>"
	        			box+="<button class='btn btn-outline-danger' onclick=\"reject("+order.id+",'"+order.volunteer.name+"')\" >檢舉</button></div>"
	        			}else if(order.orderStatus=='ServiceFinishPayMatchSuccess'){
	        			box+="<span class='badge badge-success'>已付款與評分</span>"
	        			}else if(order.orderStatus=='ServiceFinishNotPay'){
	        			box+="<span class='badge badge-danger'>已檢舉</span>"	
	        			}else {
	        			box+= "<p>不應該出現的狀態</p>";
						}
	        			box+="<ul class='social list-inline'>"
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
// 				"lengthMenu": [ 6, 9, 12, ],
// 				ajax:{
// 					url:"/user/payTime/query",
// 					type: "get",
// 				    dataType : "json",
// 				    data: function(d){
// // 		            	var mission = ${mission};
// // 		            	alert(mission);
// 						var missionId = ${missionId}
// 		            	var start = d.start;
// 						var length = d.length;
// 						var request = "page=" + start + "&length=" + length + "&missionId=" + missionId;
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
// 			            {"data":null, render: function (data, type, row ) {
// // 			            	console.log(data)
// 			                return new Date(data.volunteerApplyTime).toLocaleDateString();
// 			            } },	
// 						{"data":function (data, type, val) {
// 							if(data.orderStatus=="ServiceFinishNotPay"){
// 							var score = "<select id='score"+data.volunteer.id+"' name='timeValue' class='form-control'>"
// 							for(var x = 1 ; x <=5 ; x++){
// 								if(x==5){
// 									score += "<option selected='true' value='" + x + "'>"+ x + "</option>"	
// 								}else{
// 									score += "<option value='" + x + "'>"+ x + "</option>"
// 								}
// 							}
// 							score +='</select>'
							
// 							return score;
// 							}else if(data.orderStatus=="ServiceFinishPayMatchSuccess"){
// 								 var vbutton="<span class='badge badge-success'>已評分</span>"
// 									 return vbutton;
// 								 }else{
// 									 return "不應該出現的狀態";
// 								 }
							
						
// 					}
// 					},					
									
// 						{"data": function (data, type, val) {
							
// 							if(data.orderStatus=="ServiceFinishNotPay"){
								
// 								var select = "<select id='"+data.volunteer.id+"' name='timeValue' class='form-control'>"
// 								for(var i = 0 ; i <= data.mission.timeValue ; i++){
// 									if(i==data.mission.timeValue){
// 										select += "<option selected='true' value='" + i + "'>"+ i + "</option>"	
// 									}else{
// 										select += "<option value='" + i + "'>"+ i + "</option>"
// 									}
// 								}
// 								select +='</select>'
								
// 								var value=$("#"+data.volunteer.id+" option:selected").val()
// 								console.log("id="+data.volunteer.id)
// 								console.log(value)

// 								return select ;
								
							
// 							 }else if(data.orderStatus=="ServiceFinishPayMatchSuccess"){
// 								 var vbutton="<span class='badge badge-success'>已審核時數</span>"
// 								 return vbutton;
// 							 }else{
// 								 return "不應該出現的狀態";
// 							 }
// 						}
// 						},
						
						
// 						{"data":function (data, type, val) {
// 							if(data.orderStatus=="ServiceFinishNotPay"){
							
// 							var name=data.volunteer.name
// 							var paybutton="<button class='btn btn-outline-secondary' onclick=\"pay("+data.id+","+data.volunteer.id+",'"+name+"')\">時數核發與評分</button>";     
// 							return paybutton ;
// 							}else if(data.orderStatus=="ServiceFinishPayMatchSuccess"){
// 								 var vbutton="<span class='badge badge-success'>已審核時數與評分</span>"
// 									 return vbutton;
// 								 }else{
// 									 return "不應該出現的狀態";
// 								 }
							
						
// 					}
// 					},				
						
						
// 			            {"data":function (data, type, val) {
						
								
								
// 								var penaltybutton="<button class='btn btn-outline-secondary' onclick=\"javascript:document.location.href='/penalty/report?orderId="
// 									+ data.id + "'\"  >檢舉</button>";     
// 								return penaltybutton;
								
							
// 						}
// 						},					
									
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