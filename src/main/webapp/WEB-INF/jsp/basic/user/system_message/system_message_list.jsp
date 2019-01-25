<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<!-- Javascript、css files-->
<jsp:include page="../../commons/commons_layout/commons_js_links.jsp" />


<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<!-- date picker -->
<script type="text/javascript" src="/js/datepicker/moment.min.js"></script>
<script type="text/javascript" src="/js/datepicker/bootstrap-datepicker.js"></script>
<script src="/js/datepicker/bootstrap-datepicker.zh-TW.js"></script>
<link rel="stylesheet" href="/css/bootstrap-datepicker3.min.css" />
<!-- data table -->
<!-- <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.js"></script> -->
<!-- <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.css">   -->
<!-- <script src="https://cdn.datatables.net/buttons/1.5.4/js/dataTables.buttons.min.js"></script>	 -->
<!-- <script src="https://cdn.datatables.net/select/1.2.7/js/dataTables.select.min.js"></script>	 -->
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.css">  

<!-- sweetAlert -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<jsp:include page="../../commons/commons_layout/commons_css_links.jsp"/>
<style>
/* 	  fieldset { */
/*              width: 1200px;  */
/*              padding-left: 450px; */
/*         } */
      
      fieldset {
            width: 72.5%;
            border: 3px solid rgba(0,0,0,0);
            padding: 20px;
            margin: 20px;
            margin: auto
      }
      .s2{
            text-align: center
        }
        .margintop{
			 margin-top:70px;
		}
		.table .thead-green th {
		    color: #fff;
		    background-color: #13b5b1;
		    border-color: #13b5b1;
		    border-left: 1px solid #fff;
		}
		.btn-outline-secondary {
		    color: #13b5b1;
		    background-color: #fff;
		    background-image: none;
		    border-color: #13b5b1;
    		font-size: 16px;
		}
		.btn-outline-secondary:hover {
		    color: #fff;
		    background-color: #13b5b1;
		    border-color: #13b5b1;
		}
		.btn {
		    border: 1px solid #13b5b1;
		    border-radius: 3px;
		}
		.dataTables_wrapper .dataTables_paginate .paginate_button.disabled, .dataTables_wrapper .dataTables_paginate .paginate_button.disabled:hover, .dataTables_wrapper .dataTables_paginate .paginate_button.disabled:active {
		    color: #13b5b1 !important;
		}
		.dataTables_wrapper .dataTables_paginate .paginate_button.current, .dataTables_wrapper .dataTables_paginate .paginate_button.current:hover {
		    color: #fff !important;
    		background-color: #13b5b1;
    		background: linear-gradient(to bottom, #13b5b1 0%, #13b5b1 100%);
		}
		.dataTables_wrapper .dataTables_paginate .paginate_button {
		    color: #13b5b1 !important;
		}
		.dataTables_wrapper .dataTables_length, .dataTables_wrapper .dataTables_filter, .dataTables_wrapper .dataTables_info, .dataTables_wrapper .dataTables_processing, .dataTables_wrapper .dataTables_paginate {
		    color: #13b5b1;
		}
		.dataTables_wrapper .dataTables_paginate .paginate_button:hover {
		    color: white !important;
		    border: 1px solid #111;
		    background-color: #13b5b1; 
		    background: -webkit-gradient(linear, left top, left bottom, color-stop(0%, #13b5b1), color-stop(100%, #13b5b1)); 
		    background: -webkit-linear-gradient(top, #13b5b1 0%, #13b5b1 100%);
		    background: -moz-linear-gradient(top, #13b5b1 0%, #13b5b1 100%);
		    background: -ms-linear-gradient(top, #13b5b1 0%, #13b5b1 100%);
		    background: -o-linear-gradient(top, #13b5b1 0%, #13b5b1 100%);
		    background: linear-gradient(to bottom, #13b5b1 0%, #13b5b1 100%);
		}
		.form-1{
			padding-top:20px;
			width: 75%;
			text-align:center;
			margin:auto;
		}
</style>
<meta charset="UTF-8">
<title>系統訊息 | TimeBank</title>
</head>
<body>
	<!-- Top bar-->
	<jsp:include page="../../commons/commons_layout/commons_top-bar.jsp" />
	<!-- Navbar -->
	<jsp:include page="../../commons/commons_layout/commons_nav.jsp" />	
	<!--heading crumbs-->
	<jsp:include page="../../commons/commons_layout/commons_heading_breadcrumbs_member_area.jsp" />
	<!-- Sidebar -->
	<jsp:include page="../user_layout/user_sidebar.jsp"/>
		<article>
			<div class="btn-group">
<!-- 			  <button type="button" class="btn btn-info" id="notRead">未讀</button> -->
<!-- 			  <button type="button" class="btn btn-outline-info" id="alreadyRead" name="HI">已讀</button> -->
<!-- 			  <button type="button" class="btn btn-outline-info" id="allMessages">全部訊息</button> -->
			</div>
	
			<form action="/user/system-message/selectMsgsAsRead" method="post" onSubmit="return checkForm();">
				<fieldset>
				<table id="table" class="table table-hover">
					<thead class="thead-green">
						<tr>
							<th scope="col"></th>
<!-- 							<th scope="col" width="50px"> -->
<!-- 								<input type="checkbox" style="display:inline;" name="CheckAll" value="全選" id="CheckAll" /> -->
<!-- 							</th> -->
							<th scope="col" width="130px">
<!-- 								<input id="submit" style="display:inline;" type="submit" value="標記已讀" class="btn btn-outline-info btn-sm"/> -->
							</th>
							<th scope="col">時間</th>
							<th scope="col">類型</th>
							<th scope="col">內容</th>
<!-- 							<th scope="col">是否已讀</th> -->
<!-- 							<th scope="col">會員帳號(debug用)</th> -->
						</tr>
					</thead>
					<tbody id="tableBody">
						<!-- 會員資料 -->
					</tbody>
				</table>
				</fieldset>
			</form>
		</article>
	
	<!-- FOOTER -->
	<jsp:include page="../../commons/commons_layout/commons_footer.jsp" />

	<div class="modal fade" id="penaltyReVertifyCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered" role="document">
	<div class="modal-content">
	    <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalCenterTitle">申訴系統</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	        <span aria-hidden="true">&times;</span>
	        </button>
	    </div>
	    <div class="modal-body">
	        <h5><img width="20" src="https://image.flaticon.com/icons/svg/134/134974.svg" class="rounded mr-2">申訴內容</h5>
	        <form id="applyForm" enctype="multipart/form-data">
				<input type='hidden' id='penaltyId' name='penaltyId' />
		        <div class="form-group">
		            <label for="message-text" class="col-form-label">申訴原因</label>
		            <textarea cols='40' rows='5' class="form-control" id='applyReVertifyDescription' name='applyReVertifyDescription'> </textarea>
		        </div>
				<div class="form-group">
		            <label for="recipient-name" class="col-form-label" id="ProofDescription">上傳佐證圖檔</label>
		            <input type="file" class="form-control" id="reVertifyProofPicName" name="reVertifyProofPicName" accept="image/*">
		        </div>
	        </form>
	        <form>
		        <div id="reVertifyImgDes" class="form-group">
		        	<hr>
		        	<label for="message-text" class="col-form-label">佐證圖片</label>
		        	<img alt="" src="" id="reVertifyImg" width="200">
		        </div>
	        </form>
        <div id="reVertifyResult">

        </div>
	    </div>
	    <div class="modal-footer">
	        <input type='hidden' id="reVertifyBtn" class='btn btn-primary btn-sm' onclick='applyReVertify()' value='申訴' />
	    </div>
	</div>
	</div>
	</div>



	
	<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.js"></script>
	
	<script>

		var dataTable;
		var readStatus = "";
		var applyReVertifyDescription;
		var reVertifyProofPicName;
		
		//暫不用此方法。
		function getMessageId(msgId){
			$.ajax({
				url : "/user/system-message/readMessage",
				method : "put",
				dataType : "json",
				data : {"id":msgId},
				success : function(result) {
					swal({
						  title: "訊息類型-" + result.messageType ,
						  text: "[訊息時間:" + result.releaseTime + "] " + result.message,
						  button: "確定",
						}).then((result) => {
							if (result) {
								dataTable.ajax.reload(); //讀完要再重新刷一次未讀清單
								checkMailBox(); //刷新nav的系統訊息未讀數量
							}
						});

				},
				error: function (result) {
					swal({
						  title: "ERROR",
						  text: "查詢失敗",
						  button: "確定",
						});
			    }
			})
			
		}
		
		
		$(document).ready(function() {
			$("#webTitle").empty().append("通知");
			$("form").addClass("form-inline");
			$("form div[id!='collapse']").addClass("form-group mx-sm-3 mb-3");
			$("form input, select").addClass("form-control mx-3");
			$("#searchButt, #resetButt").addClass("btn btn-outline-info");

			dataTable = $('#table').DataTable({
				pageResize: true, 
				fixedHeader: true,
				pagingType: 'full_numbers',
				searching: false,				
			 	processing: true,
				serverSide: true,  //DataTable:分頁、排序都交由伺服器處理
				lengthMenu: [ 10 ],
				ajax:{
					url:"/user/system-message/getSystemMessages",
					type:"get",
					dataType:"json",
					data:function(d){ 				//DataTable:傳送給伺服器的資料(datatable預設會傳送d的資料)
						var start = d.start;
						var length = d.length;
						var request = "readStatus=" + readStatus + "&start=" + start + "&length=" + length;
						
						return request;
					},
					dataSrc:"content",
					dataFilter:function(resp){		//DataTable:對伺服器送來的資料進行修改
						
						var json = jQuery.parseJSON( resp );
			             json.recordsTotal = json.totalElements;
			             json.recordsFiltered = json.totalElements;	     			
			             return JSON.stringify( json ); 
					},
				}, drawCallback:function(d){
					var api = this.api();
					var pageNum = parseInt(d.json.pageable.pageNumber) ;
					var totalPages = d.json.totalPages;
					$('#table_info').html('目前顯示第  '+(pageNum+1)+' 頁，共  '+totalPages+'頁。');
				}, columns: [ 		//DataTable:設定datatable要顯示的資訊，需與表頭<th>數量一致(可隨意串接資料內容)
		     		{data:null},
// 		     		{data:function(data){
// 		     			var checkBox = ""
// 		     			if(data.readStatus=="N"){
// 		     				checkBox = "<input type='checkbox' name='msgChecked[]' value='" + data.id +"'>";
// 		     			}
// 		     			return checkBox;} 
// 		     		},//勾選欄位
		           	{data: function (data) {
		           		var readButt = "";
		           		
		           		//如果是懲罰的message，且未提出申訴
		           		if(data.messageType=="Penalty" && data.penalty.applyReVertify!="Y"){
		           			readButt = "<button class='btn btn-danger btn-sm' data-toggle='modal' data-target='#penaltyReVertifyCenter' onclick='bringPenaltyIdToModal(" + data.penalty.id + ")'>  申訴    </button>"
		           			
		           		}
		           		
		           		//如果是懲罰的message，且已提出申訴
		           		if(data.messageType=="Penalty" && data.penalty.applyReVertify=="Y"){
		           			applyReVertifyDescription = data.penalty.applyReVertifyDescription;
		           			reVertifyProofPicName = data.penalty.reVertifyProofPicName;
		           			readButt = "<button class='btn btn-info btn-sm' data-toggle='modal' data-target='#penaltyReVertifyCenter' onclick='bringApplyReVertifyDescriptionToModal(" + data.penalty.id +")'>  檢視申訴紀錄    </button>"
		           		}
		           		
		               	return readButt;	},"orderable": false
		           	},
		           	{data:null,"orderable": false, render:function(data, type, row){
						return new Date(data.releaseTime).toLocaleDateString();
						}
					},
		           	{data:function(data){
		           		var messageType = data.messageType;
		           		if(messageType == "Penalty"){
		           			return "懲罰";
		           		}
		           		if(messageType == "Score"){
		           			return "評分";
		           		}
		           		if(messageType == "ReplyPenaltyReport"){
		           			return "檢舉結果";
		           		}
		           		if(messageType == "ReplyTheRevertifyApply"){
		           			return "申訴結果";
		           		}
		           		if(messageType == "GetTimeValue"){
		           			return "獲得時數";
		           		}
		           		if(messageType == "PayTimeValue"){
		           			return "撥付時數";
		           		}
		           		if(messageType == "MissionAccecpt"){
		           			return "活動申請成功";
		           		}
		           		if(messageType == "MissionReject"){
		           			return "活動申請失敗";
		           		}
		           		if(messageType == "MissionEdit"){
		           			return "編輯活動";
		           		}
		           		if(messageType == "MissionCancel"){
		           			return "取消活動";
		           		}
		           		if(messageType == "MissionFinish"){
		           			return "活動完成";
		           		}
	
		           	},"orderable": false
		           	},
					{data:"message","orderable": false},
// 					{data:"readStatus"},
// 					{data:"member.account"},
					
				], columnDefs:[{		//DataTable:禁用第0123列的搜索和排序
					"searchable": false,
	                "orderable": false,
	                "targets": [0],
				}], order: []   
			 });
			
			
			
			dataTable.on('draw.dt',function() {
				dataTable.column(0, {
	                search:'applied',
	                order:'applied'
	            }).nodes().each(function(cell, i) {
					 i = i+1;								//DataTable:i從0開始，所以先加1
	                var pageinfo = dataTable.page.info();	//DataTable:服務氣模式下，使用DT提供的API直接獲取分頁資訊
	                var pageno = pageinfo.page;				//DataTable:当前第几页，从0开始
	                var length = pageinfo.length;			//DataTable:每页数据
	                var columnIndex = (i+pageno*length);	//DataTable:行号等于 页数*每页数据长度+行号
	                cell.innerHTML = columnIndex;
	            });
				checkMailBox(); //刷新nav上的系統訊息數字
	        });
			
			
			
			//日期選擇器
			var datePickerSetting = {
				format : "yyyy/mm/dd",
				autoclose : true,
				todayHighlight : true,
				language : 'zh-TW',
				clearBtn : true,
				startView : "2",
				endDate : "0d",
			};
			$("#dateBefore").datepicker(datePickerSetting);
			$("#dateAfter").datepicker(datePickerSetting);
			
			//暫不用以下方法
			//按下已讀未讀信件
			$("#allMessages").click(function(){
				readStatus="";
				dataTable.ajax.reload();
				
				$(this).attr('class', 'btn btn-info');
				$("#notRead").attr('class', 'btn btn-outline-info');
				$("#alreadyRead").attr('class', 'btn btn-outline-info');
			})
			
			$("#notRead").click(function(){
				readStatus="N";
				dataTable.ajax.reload();
				
				$(this).attr('class', 'btn btn-info');
				$("#allMessages").attr('class', 'btn btn-outline-info');
				$("#alreadyRead").attr('class', 'btn btn-outline-info');
			})
			
			$("#alreadyRead").click(function(){
				readStatus="Y";
				dataTable.ajax.reload();
				
				$(this).attr('class', 'btn btn-info');
				$("#allMessages").attr('class', 'btn btn-outline-info');
				$("#notRead").attr('class', 'btn btn-outline-info');
			})
			
			//暫不用以下方法
			//全選訊息
			$("#CheckAll").click(function(){
				   if($("#CheckAll").prop("checked")){//如果全選按鈕有被選擇的話（被選擇是true）
					    $("input[name='msgChecked[]']").each(function(){
					    	 $(this).prop("checked",true);//把所有的核取方框的property都變成勾選
					    })
				   }else{
					    $("input[name='msgChecked[]']").each(function(){
					    	 $(this).prop("checked",false);//把所有的核方框的property都取消勾選
					    })
				   }
			  })
			
			  $("div[id='table_length'] label").css("display","none");

		})
						
		//暫不用以下方法
		//如果未勾選任何一筆訊息，則按下"標記已讀"不會呼叫controller
		function checkForm(){
			var checkItemNum = 0;
			$("input[name='msgChecked[]']").each(function(){
		    	if($(this).prop("checked") == true) {
		    		checkItemNum ++;
		    	}
		    })
			if(checkItemNum == 0){
				return false;
			}else{
				return true;
			}
		}
		
		//按下申訴按鈕
		function bringPenaltyIdToModal(penaltyId){
			$("#penaltyId").attr("value",penaltyId);
			$("#applyReVertifyDescription").html("");
			
			$("#reVertifyImg").attr("src", "");
			$("#reVertifyProofPicName").attr("type","file");
			$("#ProofDescription").removeAttr("hidden");
			$("#reVertifyBtn").attr("type", "button");
			$("#applyReVertifyDescription").removeAttr("disabled");
			
			$("#reVertifyImgDes").attr("hidden", "");
			$("#reVertifyResult").attr("hidden", "");
		}
		
		//檢視申訴紀錄
		function bringApplyReVertifyDescriptionToModal(penaltyId){
			$("#penaltyId").attr("value",penaltyId);
			$.ajax({
				url : "/user/checkReVertifyContent",
				method : "post",
				dataType : "json",
				data : {"penaltyId":penaltyId},
				success : function(result) {
					$("#applyReVertifyDescription").html(result.applyReVertifyDescription);
					$("#reVertifyImg").attr("src", "/image/user/reVertify/" + result.reVertifyProofPicName);
					if(result.reVertifyPenaltyTimeValue == null){
						//申訴案尚在審核中
						$("#reVertifyResult").html("<hr><h5><img width='20' src='https://image.flaticon.com/icons/svg/1336/1336714.svg' class='rounded mr-2'>申訴案尚在審核中</h5>")
					}else{
						//申訴案已完成審核
						var theStr = "<hr><h5><img width='20' src='https://image.flaticon.com/icons/svg/1336/1336714.svg' class='rounded mr-2'>申訴審核結果</h5>" 
									+ "<li>原懲罰時數:" + result.penaltyTimeValue + "</li>"
									+ "<li>目前懲罰時數:" + result.reVertifyPenaltyTimeValue + "</li>"
									+ "<li>審核原因:" + result.reVertifyReason + "</li>";
						$("#reVertifyResult").html(theStr)
					}
				},
				error: function (result) {
					swal({
						  title: "ERROR",
						  text: "查詢失敗",
						  button: "確定",
						});
			    }
			})
			
			
			$("#applyReVertifyDescription").attr("disabled","");
			$("#reVertifyProofPicName").attr("type","hidden");
			$("#ProofDescription").attr("hidden", "");
			$("#reVertifyBtn").attr("type", "hidden");
			
			$("#reVertifyImgDes").removeAttr("hidden");
			$("#reVertifyResult").removeAttr("hidden");
		}
		
		//提出申訴時呼叫這支
		function applyReVertify() {
			swal({
				  title: "確定送出申訴嗎?",
				  icon: "warning",
				  buttons: true,
				  dangerMode: true,
				})
				.then((willApply) => {
				  if (willApply) {
					  var data = new FormData($('#applyForm')[0]);
						$.ajax({
							url : '/user/applyReVertify',
							type : 'post',
							cache: false,
							data : data,
							processData: false,
							contentType: false
						}).done(function(response){
							console.log(response)
							if (response.status =="SUCCESS"){
								 swal("申訴成功", {icon: "success",})
								 .then(function(){
									 //$('#penaltyReVertifyCenter').modal('hide');
									 window.location.replace("/user/system-message/list");
								 });
								 
							} else {
								swal("申訴失敗", {icon: "error",});
							}
							
							
						})	
		
				  } else {
				    swal("取消申訴");
				  }
				}); 	
		
		
		}
		
		
		
		
		

	</script>

</body>
</html>