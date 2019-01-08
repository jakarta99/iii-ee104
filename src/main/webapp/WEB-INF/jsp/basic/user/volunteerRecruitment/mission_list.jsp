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
      
      <div id="heading-breadcrumbs" class="border-top-0 border-bottom-0">
        <div class="container">
          <div class="row d-flex align-items-center flex-wrap">
            <div class="col-md-7">
              <h1 id="webtitle" class="h2"></h1>
            </div>
<!--             <div class="col-md-5"> -->
<!--               <ul class="breadcrumb d-flex justify-content-end"> -->
<!--                 <li class="breadcrumb-item"><a href="index.html">Home</a></li> -->
<!--                 <li class="breadcrumb-item active">Blog Listing: Small</li> -->
<!--               </ul> -->
<!--             </div> -->
          </div>
        </div>
      </div>
      
      
        <div id="content">
        <div class="container">
        <section class="bar_1">
        	<ul id="pills-tab" role="tablist" class="nav nav-pills nav-justified">
		       <li class="nav-item"><a id="status12Butt" data-toggle="pill" href="#pills-home" role="tab" aria-controls="pills-home" aria-selected="true" class="nav-link active">未開始</a></li>
		       <li class="nav-item"><a id="status3Butt" data-toggle="pill" href="#pills-profile" role="tab" aria-controls="pills-profile" aria-selected="false" class="nav-link">時數未核發</a></li>
		       <li class="nav-item"><a id="status4Butt" data-toggle="pill" href="#pills-contact" role="tab" aria-controls="pills-contact" aria-selected="false" class="nav-link">歷史紀錄</a></li>
   			 </ul>
       	  </section>
          <div class="row bar">
          
            <div id="blog-listing-medium" class="col-md-9">
          
          
              <section class="post_1">
                <div class="row" id="boxbox">
<!--                 mission內容開始 -->                
                </div>
              </section>
             
             <div >
               	<nav aria-label="Page navigation example">
                    <ul id ="pagebox" class="pagination pagination-lg">
<!--                     換頁控制開始 -->
              		</ul>
                  </nav>
              </div>    
            </div>
            <div class="col-md-3">
              
              <div class="panel panel-default sidebar-menu">
                <div class="panel-heading">
                  <h3 class="h4 panel-title">條件查詢</h3>
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
			
			
			<label>會員類型 :</label> 
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
			<input  type="button" value="搜尋" id="searchButt" class="btn btn-primary btn" >
			
			
			</div>
			</div>
		</form>
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
		$("#time").empty().append("開始時間");
		$("#statusField").empty().append("志工審核");
		$("#missionstatus").val("A_VolunteerApproved");
		page=0;
		list();
	})
	
	$("#status3Butt").click(function(){
		$("#webtitle").empty().append("招募紀錄-時數未核發");
		$("#time").empty().append("結束時間");
		$("#statusField").empty().append("時數核發");
		$("#missionstatus").val('B_AccountsPayable');
		page=0;
		list();
	})
	
	$("#status4Butt").click(function(){
		$("#webtitle").empty().append("招募紀錄-歷史紀錄");
		$("#time").empty().append("結案時間");
		$("#statusField").empty().append("結案紀錄");
		$("#missionstatus").val('C_Finish');
		page=0;
		list();		
	})
	
	function mouseover(id){
		$('#cancel'+id).css('text-decoration','underline')
	}
 	function mouseout(id){
 		$("#cancel"+id).css('text-decoration','none')
 	}	


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
 						dataTable.ajax.reload();						
 					},
 				})
 				   			   
 			  } else {
 			    swal(""+title+"的招募計畫仍繼續進行");
 			  }
 			}); 	
	}
 	
 	
 	function list(){
		$.ajax({
			url:"/user/volunteerRecruitment/query?"+$('form').serialize()+"&page="+page+"&length="+length,
			type: "get",
		    dataType : "json",
		    
	        }).done(function(missions){
	        	$("#boxbox").text("");
	        	$("#pagebox").text("");
	        	console.log(missions);
	        	
	        	var totalElements=missions.totalElements;
	        	console.log(totalElements);
	        	
	        	var totalPages=missions.totalPages;
	        	console.log(totalPages);
	        	
	        	first=missions.first;
	        	console.log(first);
	        	
	        	last=missions.last;
	        	console.log(last);
	        	
	        	page=missions.number;
	        	
	        	
	        	$.each(missions.content,function(index, mission){
	        		console.log(mission)
	        		var box="<div class='col-md-4'>"
	        		   box+="<div class='video'>"
	        		   box+="<div class='embed-responsive embed-responsive-4by3'>"	        	
	        		   box+=" <a href='#'><img src=/image/user/mission/"+mission.missionPicName+" class='embed-responsive-item'></img></a>"     
	        		   box+="</div></div></div>"
	                   box+="<div class='col-md-8'>"
	                   box+="<h1 class='h1 mt-0'><a href='/user/volunteerRecruitment/detail?id="+mission.id+"'>"+ mission.title + "</a></h1>"
	                   box+="<div class='d-flex flex-wrap justify-content-between text-xs'>"
	                   box+="<p class='author-category_1'><a href='#'>"+ mission.member.name + "</a></p>"
					 if(mission.missionstatus=="A_New"||mission.missionstatus=="A_VolunteerApproved"){
	                   box+="<p class='date-comments_1'><a href='/user/volunteerRecruitment/edit?id="+mission.id+"'><i class='fa fa-edit'></i>編輯</a><a id='cancel"+mission.id+"' onmouseover='mouseover("+mission.id+")' onmouseout='mouseout("+mission.id+")' onclick=\"cancelMission("+mission.id+",'"+mission.title+"')\" ><i class='fa fa-trash'></i>取消</a></p></div>"
					 }
					 else if(mission.missionstatus == "B_AccountsPayable"){
					   box+="</div>"
					 }else if(mission.missionstatus == "C_Finish" || mission.missionstatus == "C_Cancel"){
					   box+="</div>"
					 }
	                		   
	                   box+="<p class='intro_1'>活動地點:"+mission.county+mission.district+"</p>"
	                   
	                   
	                   if(mission.missionstatus == "A_New" || mission.missionstatus == "A_VolunteerApproved"){
	                   box+="<p class='intro_1'>開始時間:"+new Date(mission.startDate).toLocaleDateString()+"</p>"   
		            	}else if(mission.missionstatus == "B_AccountsPayable"){
		            		box+="<p class='intro_1'>截止時間:"+new Date(mission.endDate).toLocaleDateString()+"</p>"
		            	}else if(mission.missionstatus == "C_Finish" || data.missionstatus == "C_Cancel"){
		            		box+="<p class='intro_1'>結束時間:"+new Date(mission.finishDate).toLocaleDateString()+"</p>"
		            	}else{
		            		box+="<p class='intro_1'>開始時間:"+new Date(mission.startDate).toLocaleDateString()+"</p>"
		                
		               }  
	                   
	                   
	                   
	                   
	                   box+="<p class='intro_1'>需求人數:"+mission.peopleNeeded+"</p>"	          
	                 if(mission.missionstatus=="A_New"){
	                   box+="<p class='read-more text-right'><a href='/user/volunteerVerify/list?id="+mission.id+"' class='btn btn-template-outlined'>志工審核</a></p> </div>"
	                 
	     							
	 				 }else if(mission.missionstatus=="B_AccountsPayable"){
	 					box+="<p class='read-more text-right'><a href='/user/payTime/list?id="+mission.id+"' class='btn btn-template-outlined'>核發時數</a></p> </div>"

	 					}else if(mission.missionstatus=="C_Cancel"){
	 						box+="<p class='read-more text-right'><a href='/user/closed/list?id="+mission.id+"' class='btn btn-template-outlined'>取消紀錄</a></p> </div>"
								
	 					}else if(mission.missionstatus=="C_Finish"){
	 						box+="<p class='read-more text-right'><a href='/user/closed/list?id="+mission.id+"' class='btn btn-template-outlined'>結案紀錄</a></p> </div>"
								
	 					}else{
	 						box+="<p class='read-more text-right'><span class='badge badge-success'>已審核</span></p><div>"
	 					}
	                   
	                var boxbox=$("#boxbox").append(box)
	        	
	        	})
	        	
	        		$("#pagebox").append("<li class='page-item' id='backli'><a name='backa' class='page-link'>«</a></li><li class='page-item' id='nextli'><a name='nexta' class='page-link'>»</a></li>");
	        	for (var index = 1; index <= totalPages ; index++) {
	        		$("#nextli").before("<li class='page-item'><a name='count' id="+index+" class='page-link'>"+index+"</a></li>")
				}
	    
	    
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
		$("#webtitle").append("招募紀錄-未開始");
		
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
// 		
	});
	</script>
</body>
</html>