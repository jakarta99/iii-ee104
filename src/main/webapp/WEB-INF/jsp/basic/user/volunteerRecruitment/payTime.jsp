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
            <div class="col-md-5">
              <ul class="breadcrumb d-flex justify-content-end">
                <li class="breadcrumb-item"><a href="/">首頁</a></li>
                <li class="breadcrumb-item"><a href="/user/volunteerRecruitment/list?box=2">招募紀錄</a></li>
                <li class="breadcrumb-item active">時數審核</li>
              </ul>
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
                  <h2>已審核人數</h2>
                </div>
                <div class="row">
               		<div class="col-md-6">
                	<p class="lead" id="people"></p>
                	</div>
                	<div class="col-md-6" align="right">
                	<button class='btn btn-primary btn-lg_1' onclick="payAll()">一鍵核發</button>
                	</div>
                </div>
                
                <div id="boxbox" class="row text-center">
<!--                 志工名單開始 -->
                </div>
              </div>
            </div>
            
            <div>
              <nav aria-label="Page navigation example" class="d-flex justify-content-center">
                <ul id ="pagebox" class="pagination pagination-lg">
<!--                     換頁控制開始 -->
              	</ul>
              </nav>
            </div>    
            
          </section>
        </div>
        </div>
        
<div class="modal fade" id="reportModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
<div class="modal-dialog modal-dialog-centered" role="document">
<div class="modal-content">
    <div class="modal-header">
        <h5 class="modal-title" id="exampleModalCenterTitle">檢舉系統</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
        <span aria-hidden="true">&times;</span>
        </button>
    </div>
    <div class="modal-body">
        <form id="reportForm" enctype="multipart/form-data">
        	<input type='hidden' id='orderId' name='orderId' value='' />
            <h5>檢舉人名</h5>
            <p id="memberAccount"></p>
            <h5>檢舉原因</h5>
            <textarea cols='40' rows='5' id='description' name='description'></textarea>
            <input type="file" id="proofPic" name="proofPic" accept="image/*">
            <p>請選擇圖檔，如無佐證資料，則直接送出審核</p>
        </form>
    </div>
    <div class="modal-footer">
        <input type='button' class='btn btn-primary btn-sm' onclick='report()' value='檢舉' />
    </div>
</div>
</div>
</div>
	<jsp:include page="../../commons/commons_layout/commons_footer.jsp"/>
	
<script>
	var length=8;
	var page=0;
	var first;
	var last;
	var totalElements;
	var orderids=[];
	var vIds=[];
	
	function payAll(){
		var payDatas=[];
		var hour		
		for(var x = 0 ; x <totalElements ; x++){
			payDatas.push({"orderId":orderids[x],"hours":$("#"+vIds[x]+" option:selected").val(),"score":$("#score"+vIds[x]+" option:selected").val()})
		}
		swal({
			  title: "確定評點與審核本頁所有志工嗎?",
			  text: "確定後將進行付款與志工評點",
			  icon: "warning",
			  buttons: true,
			  dangerMode: true,
			})
			.then((willpay) => {
			  if (willpay) {
		$.ajax({ 
            type:"POST", 
            url:"/user/payTime/payAll", 
            dataType:"json",      
            contentType:"application/json",               
            data:JSON.stringify(payDatas), 
            success:function(data){ 
            	if(data.status == "SUCCESS"){
					 swal("付款與評點成功", {
		 			      icon: "success",
		 			 });
					
				}else{
					swal("付款與評點失敗，因為"+data.messages+"", {
		 			      icon: "error",
		 			});
				}
				list()
				
			},
		})
			  } else {
			    swal("取消付款與評點");
			  }
			}); 	
	}
	
	function pay(orderId,volunteerId,name) {
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
					 swal("付款與評點"+payResult.obj.volunteer.name+"成功", {
		 			      icon: "success",
		 			 });
					
				}else{
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
	
	
	
	function report() {
		swal({
			  title: "確定送出檢舉嗎?",
			  icon: "warning",
			  buttons: true,
			  dangerMode: true,
			})
			.then((willreport) => {
			  if (willreport) {
				  var data = new FormData($('#reportForm')[0]);
					$.ajax({
						url : '/user/payTime/report',
						type : 'post',
						cache: false,
						data : data,
						processData: false,
						contentType: false
					}).done(function(response){
						console.log(response)
						if (response.status =="SUCCESS"){
							 swal("檢舉成功", {icon: "success",});
						} else {
							swal("檢舉失敗", {icon: "error",});
						}
						$('#reportModalCenter').modal('hide')
						list();
					})	
	
			  } else {
			    swal("取消檢舉");
			  }
			}); 	
	}
		
		
		
		
		
		
		
	
	function list(){
		$.ajax({
			url:"/user/payTime/query?"+"page="+page+"&length="+length+"&missionId="+${missionId},
			type: "get",
		    dataType : "json",
	        }).done(function(orders){
	        	console.log(orders)
	        	$("#boxbox").text("");
	        	$("#pagebox").text("");
	        	$("#people").text("");
	        	totalElements=orders.totalElements;
	        	var totalPages=orders.totalPages;
	        	first=orders.first;
	        	last=orders.last;
	        	page=orders.number;
	        	console.log(orders.content)
	        	$("#people").append("目前已審核"+orders.content[0].mission.payedQuantity+"人")
	        	$.each(orders.content,function(index, order){
	        		orderids.push(order.id)
	        		vIds.push(order.volunteer.id)
	        		console.log(orderids)
	        		var box="<div class='col-md-4'>"
	        			box+="<div data-animate='fadeInUp' class='team-member'>"
	        			box+="<div class='image_1'><a href='team-member.html'><img src='/image/user/member/"+order.volunteer.picture+"' class='img-fluid rounded-circle'></a></div>"
	        			box+="<h1 style='font-family:Microsoft JhengHei'><a href='team-member.html'>"+order.volunteer.name+"</a></h1><div>"
	        			
	        			if(order.orderStatus=='ServiceFinishNotPay'){
	        			box+= "<div class='row' ><div class='col-md-6 center-block'><div class='input-group mb-3' ><div class='input-group-prepend'><label class='input-group-text'>分數:</label></div><select class='custom-select' id='score"+order.volunteer.id+"' name='timeValue' >"
	        			for(var x = 1 ; x <=5 ; x++){
							if(x==5){
								box += "<option selected='true' value='" + x + "'>"+ x + "</option>"	
							}else{
								box += "<option value='" + x + "'>"+ x + "</option>"
							}
						}	
	        			box +='</select></div></div>'
	        			
	        			box +="<div class='col-md-6 center-block'><div class='input-group mb-3' ><div class='input-group-prepend'><label class='input-group-text'>時數:</label></div><select class='custom-select'  id='"+order.volunteer.id+"' name='timeValue'>"
	        			for(var i = 0 ; i <= order.mission.timeValue ; i++){
								if(i==order.mission.timeValue){
									box += "<option selected='true' value='" + i + "'>"+ i + "</option>"	
								}else{
									box += "<option value='" + i + "'>"+ i + "</option>"
								}
							}
	        			box +='</select></div></div></div>'	
						
	        			var value=$("#"+order.volunteer.id+" option:selected").val()
	        			box+="<button class='btn btn-primary btn-lg_1' onclick=\"pay("+order.id+","+order.volunteer.id+",'"+order.volunteer.name+"')\">時數核發與評分</button>"
	        			box+="<button class='btn btn-danger btn-lg_1' data-toggle='modal' data-target='#reportModalCenter' id='" + order.id + "' name='" + order.volunteer.name+ "'>檢舉 </button></div>"
	        			}else if(order.orderStatus=='ServiceFinishPayMatchSuccess'){
	        			box+="<span class='badge badge-success_1'>已付款與評分</span>"
	        			}else if(order.orderStatus=='ServiceFinishNotPay'){
	        			box+="<span class='badge badge-danger'>已檢舉</span>"	
	        			}else {
	        			box+= "<p>不應該出現的狀態</p>";
						}
	        			box+="<ul class='social list-inline'>"
	        			box+="<li class='s3'><a href='#' class='external twitter'><i class='fa fa-phone'></i></a>電話:"+order.volunteer.telephone+"</li>"
	        			box+="<li class='s3'><a href='#' class='email'><i class='fa fa-envelope'></i></a>Email:"+order.volunteer.email+"</li>"
	        			box+="</ul></div></div>"
	        		var boxbox=$("#boxbox").append(box)
	        		
	        	})
	        	$("#pagebox").append("<li class='page-item' id='backli'><a name='backa' class='page-link'>«</a></li><li class='page-item' id='nextli'><a name='nexta' class='page-link'>»</a></li>");
	        	for (var index = 1; index <= totalPages ; index++) {
	        		$("#nextli").before("<li id='page"+index+"' class='page-item'><a name='count' id="+index+" class='page-link'>"+index+"</a></li>")
				}
	        		var pageNo = "#page" + (page+1);
	        		$(pageNo).addClass('page-item active');
	        })
			}
	
	$(document).ready( function () {
		list()
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
    	//彈出檢舉視窗時，修改裡面的值
		$("#boxbox").on('click', "[data-target='#reportModalCenter']", function (event) {
			$("#orderId").attr("value",event.target.id)
			$("#memberAccount").html(event.target.name)
		})
	});
</script>
</body>
</html>