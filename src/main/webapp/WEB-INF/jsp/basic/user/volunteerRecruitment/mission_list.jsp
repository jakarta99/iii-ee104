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
<!-- sweetalert -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<script type="text/javascript" src="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"></script>

<meta charset="UTF-8">
<title>志工招募紀錄 | TimeBank</title>
<style>
		.container-1{
		 	
			max-width: 1500px;
			border-radius: 3px;
			 background-color: #f7f7f7;
			
		}
		.container-1>.row{
			margin-top: 30px;
		}
		.s3{
			width:100%;
			margin-bottom:40px;
			margin-left:60px;
			margin-right:60px;
		}
		.s4{
			width:100%;
			margin: auto;
/* 			padding-top:40px; */
			font-size: 20px;
		}
		.s5{
/* 			background-color: #e9ecef; */
/* 			border-right:solid; */
/* 			border-color:#13b5b1; */
 			padding: 15px; 
		}
		.s6{
			width:100%;
			margin: auto;
/* 			margin-top:100px; */
/* 			margin-top: 30px; */
		    padding: 10px;
		    border-radius: 3px;
/* 			border: 2px solid #1ec7c3;  */
/* 		    background-color: #e2e2e2; */
			background-color:#fff;
            border-radius:3px;
			box-shadow: 0 2px 10px 0 rgba(0, 0, 0, 0.5); 
			
		}
		.s7{
			margin-left:5%;
		}
		.s8{
/* 			border: 2px solid #1ec7c3; */
            background-color:#fff;
            border-radius:3px;
            box-shadow: 0 2px 10px 0 rgba(0, 0, 0, 0.5);
		    padding-top:25px;
		    padding-bottom:20px;
		}
		.s9{
		margin-top:10px
		}
		
        fieldset {
/*         	background-color:	#E0FFFF; */
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
	body {
    background-color: #f5f5f5;
	}
	.panel-heading h3 {
    margin-top: 15px;
    margin-bottom: 8px;
	}
	.nav-pills .nav-link {
    	border-radius: 8px;
	}
 
    </style>
</head>
<body>
 	<!-- Top bar-->
    <jsp:include page="../../commons/commons_layout/commons_top-bar.jsp"/>	
	<!-- Navbar -->
    <jsp:include page="../../commons/commons_layout/commons_nav.jsp"/>
    <!-- Sidebar -->
	<jsp:include page="../user_layout/user_sidebar.jsp"/>
	<!--heading crumbs-->
	<jsp:include page="../../commons/commons_layout/commons_heading_breadcrumbs_member_area.jsp" />   
        <div id="content">
         <div class="container-1 container">
          <div class="row">
           <div class="col-md-12">
            <div class="s5">
             <div class="s4">
	        	<ul id="pills-tab" role="tablist" class="nav nav-pills nav-justified">
			       <li class="nav-item"><a id="status12Butt" data-toggle="pill" href="#pills-home" role="tab" aria-controls="pills-home" aria-selected="false" class="nav-link">活動未開始</a></li>
			       <li class="nav-item"><a id="status3Butt" data-toggle="pill" href="#pills-profile" role="tab" aria-controls="pills-profile" aria-selected="false" class="nav-link">活動結束-時數待核發</a></li>
			       <li class="nav-item"><a id="status4Butt" data-toggle="pill" href="#pills-contact" role="tab" aria-controls="pills-contact" aria-selected="false" class="nav-link">歷史紀錄</a></li>
	   			 </ul>
       	     </div>
<!--        	  s4結尾 -->
          <div class="row bar">
            <div id="blog-listing-medium" class="col-md-9">
          	<div id="boxbox" class="row">
<!--                 mission內容開始 -->                
          
             </div>
             <div >
               	<nav aria-label="Page navigation example" class="d-flex justify-content-center">
                    <ul id ="pagebox" class="pagination pagination-lg">
<!--                     換頁控制開始 -->
              		</ul>
                  </nav>
              </div>    
            </div>
             <div class="col-md-3">
            <div class="s6" >
              
              <div class="panel panel-default sidebar-menu">
                <div class="panel-heading">
                <div class="s7">
                  <h3 class="h3 panel-title">條件查詢</h3>
                  </div>
                </div>
                
                
                <div class="panel-body">
                	<form>
                <div class="form-group mx-sm-3 mb-3">
					<label>縣市:</label> 	
					<div role="tw-city-selector"></div>
				</div>
			
				
			<div class="form-group mx-sm-3 mb-3">			
			<label>活動名稱 :</label> 
			<input type="text" value="" placeholder="" id="title" name="title" class="form-control"/>
			<div>
			
			
			<label>服務類型 :</label> 
				<select  id="serviceTypeDetail" name="serviceTypeDetail" class="form-control">
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
				<select  id="termType" name="termType" class="form-control">
					<option value="">選擇長短期</option>
					<option value="L">長期</option>
			        <option value="S">短期</option>
				</select>	
				
			<label>時數 :</label> 
			<input type="text" value="" placeholder="" id="timeValue" name="timeValue" class="form-control"/>
			<div>	
				<label>開始日期:</label>
				<input type="text"  id="startDate" name="startDate" autocomplete="off" class="form-control"/>
				<label>結束日期:</label>
				<input type="text"  id="endDate" name="endDate" autocomplete="off" class="form-control"/>
			</div>
				
			<input type="hidden" value="" placeholder="missionstatus" id="missionstatus" name="missionstatus"/>
			<input  type="button" value="搜尋" id="searchButt" class="btn btn-primary btn s9" >
			
			
			</div>
			</div>
		</form>
                </div>
              </div>
              </div>
           
           
           </div>
          
            </div>
          </div>
          </div>
          
          </div>
        </div>
      </div>
	<jsp:include page="../../commons/commons_layout/commons_footer.jsp"/>
	<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.js"></script>
	
	<script>
	
	var length=3;
	var page=0;
	var first;
	var last;
	
 	$("#searchButt").click(function(){
 		list();
	})
	
	$("#status12Butt").click(function(){
		$("#webtitle").empty().append("招募紀錄-未開始");
		$("#missionstatus").val("A_VolunteerApproved");
		page=0;
		list();

	})
	
	$("#status3Butt").click(function(){
		$("#webtitle").empty().append("招募紀錄-時數未核發");
		$("#missionstatus").val('B_AccountsPayable');
		page=0;
		list();
	})
	
	$("#status4Butt").click(function(){
		$("#webtitle").empty().append("招募紀錄-歷史紀錄");
		$("#missionstatus").val('C_Finish');
		page=0;
		list();		
	})
		
	function cancelMission(id,title) { 		
 		swal({
 			  title: "確定取消"+title+"的招募刊登?",
 			  text: "取消招募刊登後將無法回復",
 			  icon: "warning",
 			  buttons: true,
 			  dangerMode: true,
 			})
 			.then((willcancel) => {
 			  if (willcancel) { 				   				  
 				 $.ajax({
 					url : '/user/volunteerRecruitment/cancel?id=' + id,
 					type : 'post',
 					dataType : 'JSON',
 					success : function(cancelResult) {
 						if(cancelResult.status == "SUCCESS"){ 							
 							 swal("取消"+cancelResult.obj.title+"的招募計畫成功", {
 				 			      icon: "success",
 				 			 }); 							
 						}else{ 							
 							swal("取消"+cancelResult.obj.title+"的招募計畫失敗，因為"+cancelResult.messages+"", {
				 			      icon: "error",
				 			}); 							
 						} 						
 						list();								
 					},
 				}) 				   			   
 			  } else {
 			    swal(""+title+"的招募計畫仍繼續進行");
 			  }
 			}); 	
	}
 	
 	function cancelEndMission(time,title){
 		swal(title, "您於"+time+"取消本次申請");
 	}
 	
 	 	
 	function list(){
		$.ajax({
			url:"/user/volunteerRecruitment/query?"+$('form').serialize()+"&page="+page+"&length="+length,
			type: "get",
		    dataType : "json",		    
	        }).done(function(missions){
	        	$("#boxbox").text("");
	        	$("#pagebox").text("");
	        	var totalElements=missions.totalElements;	        	
	        	var totalPages=missions.totalPages;	        	
	        	first=missions.first;	        	
	        	last=missions.last;	        	
	        	page=missions.number;
	        	if(missions.content.length == 0){
	        		var box="<div class='s3'><h2>目前沒有資料</h2></div>"
	        		$("#boxbox").append(box);
	        	} else {
	        	$.each(missions.content,function(index, mission){
	        		  var box="<div class='s3'><div class='row s8'>"
	        		   box+="<div class='col-md-4'>"
	        		   box+="<div class='video '>"
	        		   box+="<div class='embed-responsive embed-responsive-4by3'>"	        	
	        		   box+=" <a href='#'><img src=/image/user/mission/"+mission.missionPicName+" class='embed-responsive-item' style='border-radius:5px'></img></a>"     
	        		   box+="</div></div></div>"
	                   box+="<div class='col-md-8'>"
	                   box+="<h1 class='h1 mt-0'><a href='/user/volunteerRecruitment/detail?id="+mission.id+"'>"+ mission.title + "</a></h1>"
	                   box+="<div class='d-flex flex-wrap justify-content-between text-xs'>"
					   box+="<p class='intro_1'>活動地點:"+mission.county+mission.district+"</p>"
					   	
					 if(mission.missionstatus=="A_New"||mission.missionstatus=="A_VolunteerApproved"){
	                   box+="<p class='date-comments_1'><a href='/user/volunteerRecruitment/edit?id="+mission.id+"'><i class='fa fa-edit'></i>編輯</a><a href='javascript:void(0)' onclick=\"cancelMission("+mission.id+",'"+mission.title+"')\" ><i class='fa fa-trash'></i>取消</a></p></div>"
					 }
					 else if(mission.missionstatus == "B_AccountsPayable"){
					   box+="</div>"
					 }else if(mission.missionstatus == "C_Finish" || mission.missionstatus == "C_Cancel"){
					   box+="</div>"
					 }  
					   box+="<div class='d-flex flex-wrap justify-content-between text-xs'>"
						   if(mission.termType=='S'){
					   box+="<p class='intro_1'>長短期:短期</p>"
						   }else{
					   box+="<p class='intro_1'>長短期:長期</p>"	   
						   }
					   box+="</div>"
	                   box+="<div class='d-flex flex-wrap justify-content-between text-xs'>"         
	                   if(mission.missionstatus == "A_New" || mission.missionstatus == "A_VolunteerApproved"){
	                   box+="<p class='intro_1'>開始時間:"+new Date(mission.startDate).toLocaleDateString()+"</p>"   
		            	}else if(mission.missionstatus == "B_AccountsPayable"){
		            		box+="<p class='intro_1'>截止時間:"+new Date(mission.endDate).toLocaleDateString()+"</p>"
		            	}else if(mission.missionstatus == "C_Finish" || mission.missionstatus == "C_Cancel"){
		            		box+="<p class='intro_1'>結束時間:"+new Date(mission.finishDate).toLocaleDateString()+"</p>"
		            	}else{
		            		box+="<p class='intro_1'>開始時間:"+new Date(mission.startDate).toLocaleDateString()+"</p>"		                
		               } 
	                   box+="</div>"
	                   box+="<div class='d-flex flex-wrap justify-content-between text-xs'>"
	                   if(mission.missionstatus == "A_New" || mission.missionstatus == "A_VolunteerApproved"){
	                   box+="<p class='intro_1'>需求人數:"+mission.peopleNeeded+"/目前人數:"+mission.approvedQuantity+"</p>"	
	                   }else if(mission.missionstatus=="B_AccountsPayable"||mission.missionstatus=="C_Cancel"||mission.missionstatus=="C_Finish"){
	                   box+="<p class='intro_1'>參與人數:"+mission.approvedQuantity+"</p>"
		 				}
	                   
		                if(mission.missionstatus=="A_New"){
		                   box+="<p class='read-more '><a href='/user/volunteerVerify/list?id="+mission.id+"' class='btn btn-template-outlined'>志工審核</a></p>"	      				
		 				}else if(mission.missionstatus=="B_AccountsPayable"){
		 					box+="<p class='read-more '><a href='/user/payTime/list?id="+mission.id+"' class='btn btn-template-outlined'>核發時數</a></p>"
		 				}else if(mission.missionstatus=="C_Cancel"){
		 					box+="<p class='read-more '><a href='javascript:void(0)' onclick=\"cancelEndMission('"+new Date(mission.finishDate).toLocaleDateString()+"','"+mission.title+"')\" class='btn btn-template-outlined'>取消紀錄</a></p>"								
		 				}else if(mission.missionstatus=="C_Finish"){
		 					box+="<p class='read-more '><a href='/user/closed/list?id="+mission.id+"' class='btn btn-primary'>結案紀錄</a></p>"								
		 				}else if(mission.missionstatus=="A_VolunteerApproved"){
		 					box+="<p class='read-more '><a href='/user/volunteerVerify/list?id="+mission.id+"' class='btn btn-primary'>審核完畢</a></p>"
		 				}
	                   box+="</div>"
	               
	                	box+="</div></div></div>"
	                boxbox=$("#boxbox").append(box)
	        	})
	        		$("#pagebox").append("<li class='page-item' id='backli'><a name='backa' class='page-link'>«</a></li><li class='page-item' id='nextli'><a name='nexta' class='page-link'>»</a></li>");
	        	for (var index = 1; index <= totalPages ; index++) {
	        		$("#nextli").before("<li id='page"+index+"' class='page-item'><a name='count' id="+index+" class='page-link'>"+index+"</a></li>")
				}
	        	}
	        		var pageNo = "#page" + (page+1);
	        		$(pageNo).addClass('page-item active');
	        })
			} 	
 
	$(document).ready( function () {
		$("#webTitle").empty().append("志工招募紀錄");
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
		
		if('${box}'=="3"){
			$("#webtitle").empty().append("志工招募紀錄-歷史紀錄");
			$("#missionstatus").val('C_Finish');
			
		}else if ('${box}'=="2"){
			$("#webtitle").empty().append("志工招募紀錄-活動結束-時數待核發");
			$("#missionstatus").val('B_AccountsPayable');
		}else{
			$("#webtitle").empty().append("志工招募紀錄-活動未開始");
			$("#missionstatus").val("A_VolunteerApproved");
		}
		
		
		list()
		
		if($("#missionstatus").val()=='C_Finish'){
			$("#status3Butt").attr("aria-selected",false)
			$("#status3Butt").attr("class",'nav-link page-item')
			$("#status12Butt").attr("aria-selected",false)
			$("#status12Butt").attr("class",'nav-link page-item')
			$("#status4Butt").attr("aria-selected",true)
			$("#status4Butt").attr("class",'nav-link page-item active show')
			
		}else if ($("#missionstatus").val()=='B_AccountsPayable'){
			$("#status4Butt").attr("aria-selected",false)
			$("#status4Butt").attr("class",'nav-link page-item')
			$("#status12Butt").attr("aria-selected",false)
			$("#status12Butt").attr("class",'nav-link page-item')
			$("#status3Butt").attr("aria-selected",true)
			$("#status3Butt").attr("class",'nav-link page-item active show')
			
		}else{
			$("#status3Butt").attr("aria-selected",false)
			$("#status3Butt").attr("class",'nav-link page-item')
			$("#status4Butt").attr("aria-selected",false)
			$("#status4Butt").attr("class",'nav-link page-item')
			$("#status12Butt").attr("aria-selected",true)
			$("#status12Butt").attr("class",'nav-link page-item active show')
		}
		
		
		
		
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