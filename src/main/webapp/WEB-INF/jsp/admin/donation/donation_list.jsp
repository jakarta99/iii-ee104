<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html" charset="UTF-8">
<title>donation list</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js"
	integrity="sha384-vFJXuSJphROIrBnz7yo7oB41mKfc8JzQZiCq4NCceLEaO4IHwicKwpJf9c9IpFgh"
	crossorigin="anonymous"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"
	integrity="sha384-alpBpkh1PFOepccYVYDB4do5UnbKysX5WZXm3XxPqe5iKTfUKjNkCk9SaVuEZflJ"
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css"
	integrity="sha384-PsH8R72JQ3SOdhVi3uxftmaW6Vc51MKb0q5P2rRUpPvrszuE4W1povHYgTpBfshb"
	crossorigin="anonymous">

<!-- date picker -->
<script type="text/javascript" src="/js/datepicker/moment.min.js"></script>
<script type="text/javascript" src="/js/datepicker/bootstrap-datepicker.js"></script>
<script src="/js/datepicker/bootstrap-datepicker.zh-TW.js"></script>
<link rel="stylesheet" href="/css/bootstrap-datepicker3.min.css" />
<!-- data table -->
<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.css">  
<script src="https://cdn.datatables.net/buttons/1.5.4/js/dataTables.buttons.min.js"></script>	
<script src="https://cdn.datatables.net/select/1.2.7/js/dataTables.select.min.js"></script>	
<style>
	 article{
	 	margin-top:70px;
	 }
	 
	 article fieldset {
/*  		width: 500px;  */
 		border-radius: 20px; 
 		padding: 20px 20px 0px 20px;  
 		border: 3px double #bebebe; 
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
 
 
</style>

</head>
<body>
<jsp:include page="../admin_layout/nav.jsp" />
<article>
	<h2 style=margin:30px>donation list</h2>
	<div id="sideBar">

	<form>
	  <fieldset style=width:900px>
	    <legend>search</legend>
	    <div style=margin:15px>
		    <label>id:</label>
		    <input type="text" value="${param.id}" id="id" name="id"/>
		    <label>memberId:</label>
		    <input type="text" value="${param.memberId}" id="memberId" name="memberId"/>
		    <label>organizationId:</label>
		    <input type="text" value="${param.organizationId}" id="organizationId" name="organizationId"/>
	    </div>
	    <div style=margin:15px>
		    <label>起始日期</label>
		    <input type="text" value="${param.donateTimeBegin}" id="donateTimeBegin" name="donateTimeBegin" autocomplete="off"/>
		    <label>結束日期</label>
		    <input type="text" value="${param.donateTimeEnd}" id="donateTimeEnd" name="donateTimeEnd" autocomplete="off"/>
		  	<input type="button" class="btn btn-primary btn-sm" style=margin-left:45px onclick="dataTable.ajax.reload()" value="搜尋" id="searchButt" />
	  	</div>
	  </fieldset>
	</form>
	</div>
	
	
	<fieldset style=width:1300px>
		<table id="table" class="table table-striped table-bordered">
			<thead>
			<tr>
				<th scope="col" width="130px"></th>
				<th scope="col">id</th>
				<th scope="col">memberId</th>
				<th scope="col">organizationId</th>
				<th scope="col">value</th>
				<th scope="col">donateTime</th>
			</tr>
			</thead>
			<tbody id="DonationTableBody">
			</tbody>

		</table>
	</fieldset>
		<button class="btn btn-primary btn-sm" style=margin-left:45px
		onclick="javascript:document.location.href='/admin/donation/add'">新增</button>
	
</article>
	<script>
	var dataTable;
	
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
// 				console.log(resp);
// 				alert(console.log(resp));
// 				alert("resp="+resp);
				var respJson = $.parseJSON(resp);
				respJson.recordsTotal = respJson.totalElements;
				respJson.recordsFiltered = respJson.totalElements;
// 				console.log(JSON.stringify(respJson));
				return JSON.stringify(respJson);
			}
		},
		drawCallback: function (d) {
// 			console.log(d);
			var api = this.api();
			var pageNum = parseInt(d.json.pageable.pageNumber);
			var totalPages = d.json.totalPages;
			$('#table_info').html('Currently showing page '+(pageNum+1)+' of '+totalPages+' pages.');
		},
		//設定datatable要顯示的資訊，需與表頭<th>數量一致(可隨意串接資料內容)
		columns:[
			{data:function(data, type, row){
				var editButt = "<input type='button' class=\"btn btn-primary btn-sm\" onclick=\"javascript:document.location.href='/admin/donation/edit?id=" + data.id + "'\" value='修改' />";
				var deleteButt = "<input type='button' class=\"btn btn-primary btn-sm\" onclick=\"deleteData(" + data.id + ")\" value='刪除' />";
				return editButt + deleteButt;
			}},
			{data:'id'},
			{data:"memberId"},
			{data:"organizationId"},
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
	
	
// 	$(document).ready(function(){ 
// 		getData();
// 	})

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
// 							$("<td></td>").text(donation.memberId),
// 							$("<td></td>").text(donation.organizationId),
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