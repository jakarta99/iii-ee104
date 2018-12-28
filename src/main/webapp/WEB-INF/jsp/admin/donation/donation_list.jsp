<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html" charset="UTF-8">
<title>donation list</title>
<jsp:include page="../admin_layout/admin_css_js_links.jsp" />

<!-- date picker -->
<script type="text/javascript" src="/js/datepicker/moment.min.js"></script>
<script type="text/javascript" src="/js/datepicker/bootstrap-datepicker.js"></script>
<script src="/js/datepicker/bootstrap-datepicker.zh-TW.js"></script>
<link rel="stylesheet" href="/css/bootstrap-datepicker3.min.css" />

<style>
	 article{
	 	margin-top:70px;
	 }
	 
	 article fieldset {
 		border-radius: 20px; 
 		padding: 20px 20px 0px 20px;  
/*  		border: 3px double #bebebe;  */
		background-color:#ffeecc;
		margin: auto; 
 		margin-top: 10px;  
 		margin-bottom: 20px;  
 		
	}

	 table tr td, button{
	 	text-align:center;
	 	line-height:center; 
	 }
	 
	 article .btn{
	 	margin-left:3px;
	 	margin-right:3px
	 }
	 
	 legend{
	 	color:#2c3e50;
	 	font-size: 30px;
	 }
	 
/* 	 @font-face{ */
/* 		font-family: custom-serif; */
/* 	    src: local("LiSong Pro"), local("微軟正黑體"), local("PMingLiU"); */
/* 	    unicode-range: U+4E00-9FFF; */
/* 	 } */
	 
/* 	 body{ */
/* 	 	font-family: custom-serif; */
/* 	 } */
 
</style>

</head>
<body>
<jsp:include page="../admin_layout/nav.jsp" />
<article>
	<div class="container" style="margin-top: 140px">
		<h2 class="text-center text-uppercase text-secondary mb-0">donation list</h2>
        <hr class="star-dark mb-5">
	</div>
	<div id="sideBar">
		<form>
		  <fieldset style="width:1100px">
		    <legend>Search</legend>
		    <div>
			    <label>id:</label>
			    <input type="text" value="${param.id}" id="id" name="id"/>
			    <label>donator:</label>
			    <input type="text" value="${param.donator}" id="donatorAccount" name="donatorAccount"/>
			    <label>orgDonee:</label>
			    <input type="text" value="${param.orgDonee}" id="orgDoneeAccount" name="orgDoneeAccount"/>
		    	<input type="button" value="搜尋"  id="searchButt" style="margin:10px" onclick="dataTable.ajax.reload()"/> 
				<input type="reset" value="重設" id="resetButt" style="margin:10px"/>
				<a class="btn btn-secondary" data-toggle="collapse" href="#collapse" 
						role="button" aria-expanded="false" aria-controls="collapse">進階查詢:</a>
		    </div>
		    <div class="collapse" id="collapse">
			    <label>起始日期</label>
			    <input type="text" value="${param.donateTimeBegin}" id="donateTimeBegin" name="donateTimeBegin" autocomplete="off"/>
			    <label>結束日期</label>
			    <input type="text" value="${param.donateTimeEnd}" id="donateTimeEnd" name="donateTimeEnd" autocomplete="off"/>
		  	</div>
		  </fieldset>
		</form>
	</div>
	
	
	<fieldset style="width:1300px">
		<div style="margin-bottom: 20px">
			<button class="btn btn-warning btn-sm"
				onclick="javascript:document.location.href='/admin/donation/add'">新增</button>
		</div>
		<table id="table" class="table table-striped table-bordered">
			<thead>
			<tr>
				<th scope="col" width="130px"></th>
				<th scope="col">id</th>
				<th scope="col">donator</th>
				<th scope="col">orgDonee</th>
				<th scope="col">value</th>
				<th scope="col">donateTime</th>
			</tr>
			</thead>
			<tbody id="DonationTableBody">
			</tbody>

		</table>
	</fieldset>
		
	
</article>
	<script>
	var dataTable;
	

	
	
	$(document).ready(function(){ 
		$("form").addClass("form-inline");
		$("form div[id!='collapse']").addClass("form-group mx-sm-3 mb-3");
		$("form input, select").addClass("form-control mx-3");
		$("#searchButt, #resetButt").addClass("btn btn-outline-secondary");
		
		dataTable = $('#table').DataTable({
			pageResize: true,
			fixedHeader: true,
			pageingType: 'full_numbers',
			searching: false,
			serverSide: true, //分頁、排序交給server端處理
			ajax:{
				url:'/admin/donation/queryPage',
				type:'get',
				dataType:'json',
				//傳送給伺服器的資料(datatable預設傳送的資料)
				data: function(d){
					console.log(d);
					return $("form").serialize() + "&start=" + d.start + "&length=" + d.length;
				},
				//dataTable需顯示表格的資料標籤(預設標籤為data:)
				dataSrc:"content",
				//對伺服器送來的資料進行修改
				dataFilter: function(resp){
//	 				console.log(resp);
//	 				alert(console.log(resp));
//	 				alert("resp="+resp);
					var respJson = $.parseJSON(resp);
					respJson.recordsTotal = respJson.totalElements;
					respJson.recordsFiltered = respJson.totalElements;
//	 				console.log(JSON.stringify(respJson));
					return JSON.stringify(respJson);
				}
			},
			drawCallback: function (d) {
//	 			console.log(d);
				var api = this.api();
				var pageNum = parseInt(d.json.pageable.pageNumber);
				var totalPages = d.json.totalPages;
				$('#table_info').html('Currently showing page '+(pageNum+1)+' of '+totalPages+' pages.');
			},
			//設定datatable要顯示的資訊，需與表頭<th>數量一致(可隨意串接資料內容)
			columns:[
				{data:function(data, type, row){
					var editButt = "<input type='button' class=\"btn btn-warning btn-sm\" onclick=\"javascript:document.location.href='/admin/donation/edit?id=" + data.id + "'\" value='修改' />";
					var deleteButt = "<input type='button' class=\"btn btn-warning btn-sm\" onclick=\"deleteData(" + data.id + ")\" value='刪除' />";
					return editButt + deleteButt;
				}},
				{data:'id'},
				{data:"donator.account"},
				{data:"orgDonee.account"},
				{data:"value"},
				{data: null, render: function ( data, type, row ) {
	                return new Date(data.donateTime).toLocaleDateString();
	            }},
			],
			columnDefs: [{
	            "searchable": false,
	            "orderable": false,
	            "targets": [0],
	        }],
	        order:[[1, 'asc']]
		});
		var datePickerSetting = {
				format : "yyyy/mm/dd",
				autoclose : true,
				todayHighlight : true,
				language : 'zh-TW',
				clearBtn:true,
				startView:"2",
				endDate:"0d",
			};
		$('#donateTimeBegin').datepicker(datePickerSetting);
		$('#donateTimeEnd').datepicker(datePickerSetting);
		
	})

// 	function getData() {
// 		$("tbody").text("");// 先清空資料
// 		$.ajax({
// 			url : "/admin/donation/query",
// 			type : "post",
// 			data : $("form").serialize(),
// 			dataType : 'json',
// 			success : function(donations) {
// 				$.each(donations,function(index, donation){
// 					$("tbody").append(
// 							[$("<tr>"),
// 							$("<input type='button' class=\"btn btn-primary btn-sm\" onclick=\"javascript:document.location.href='/admin/donation/edit?id="+ donation.id +"'\" value='修改'/>"),
// 							$("<input type='button' class=\"btn btn-primary btn-sm\" onclick=\"deleteData(" + donation.id + ")\" value='刪除' />"),
// 							$("<td></td>").text(donation.id),
// 							$("<td></td>").text(donation.donator),
// 							$("<td></td>").text(donation.orgDonee),
// 							$("<td></td>").text(donation.value),
// 							$("<td></td>").text(donation.donateTime),
// 							$("</tr>")]);
// 				})
// 			}
		
// 		})
// 	}
	function deleteData(donationId){
		$.ajax({
			url : "/admin/donation/delete?id=" + donationId,
			type : "delete",
			dataType : 'json',
			success : function(response){
				if(response.status == "SUCCESS"){
					alert("刪除成功");
				}
				else{
					$.each(response.message, function(idx, message){
						alert(message);
					});
				}
				dataTable.ajax.reload();
			}
		})
	}
</script>
</body>

</html>