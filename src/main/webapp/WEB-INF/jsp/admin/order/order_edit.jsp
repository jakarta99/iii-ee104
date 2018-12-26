<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Order Edit</title>
<script
  src="https://code.jquery.com/jquery-3.3.1.min.js"
  integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
  crossorigin="anonymous"></script>
  <!-- date picker -->
<script type="text/javascript" src="/js/datepicker/moment.min.js"></script>
<script type="text/javascript" src="/js/datepicker/bootstrap-datepicker.js"></script>
<script src="/js/datepicker/bootstrap-datepicker.zh-TW.js"></script>
<link rel="stylesheet" href="/css/bootstrap-datepicker3.min.css" />
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
</head>

<body>
<jsp:include page="../admin_layout/nav.jsp" />
<br>
<br>
<br>
<h1> Order Edit </h1>
<h4>edit no.${order.id}  Order</h4>

<form>
	
	<input type="hidden" value="${order.id}" id="id" name="id"/>
	<input type="hidden" value="${order.volunteer.id}" id="volunteer" name="volunteer"/>
	orderAcceptTime:
	<fmt:formatDate value="${order.orderAcceptTime}" pattern="yyyy/MM/dd"	var="orderAcceptTime" />
	<input type="text" value="${orderAcceptTime}" id="orderAcceptTime" name="orderAcceptTime" autocomplete="off" />
	
	volunteerApplyTime:
	<fmt:formatDate value="${order.volunteerApplyTime}" pattern="yyyy/MM/dd"	var="volunteerApplyTime" />
	<input type="text" value="${volunteerApplyTime}" id="volunteerApplyTime" name="volunteerApplyTime" autocomplete="off" />
	
	orderStatus:
	<select id="orderStatus" name="orderStatus">
					<option value="${order.orderStatus.id}">${order.orderStatus.orderStatus}</option>
					<option value="1">志工申請了</option>
			        <option value="2">接受服務</option>
			        <option value="3">拒絕服務</option>
			        <option value="4">服務完，未發時數</option>
			        <option value="5">服務完，已發時數</option>
			        <option value="6">交易取消</option>
			        <option value="7">志工 臨時請假</option>
			        <option value="8">志工 臨時不去</option>
				</select>
	
	
	
	<button type="button" onclick="updateOrder()" class="btn btn-outline-primary">update</button>
</form>
<a href="/admin/order/list">back to order_list</a>


<script>
var datePickerSetting = {
		format : "yyyy/mm/dd",
		autoclose : true,
		todayHighlight : true,
		language : 'zh-TW',	
		endDate:"0d",
	};
	$('#orderAcceptTime').datepicker(datePickerSetting);
	$('#volunteerApplyTime').datepicker(datePickerSetting);

function updateOrder(){
	$.ajax({
		url:'/admin/order/update',
		type:'put',
		data:$('form').serialize(),
		dataType:'json',
		success:function(editResult){
			if(editResult.status == "SUCCESS"){
				alert("edit no." + editResult.obj.id + " order - STATUS:" + editResult.status);
				document.location.href="/admin/order/list";
			}else{
				alert("edit no." + editResult.obj.id + " order - STATUS:" + editResult.status);
				alert("FAIL reason:" + editResult.messages);
			}
			
			
		}
	})
}
</script>
</body>
</html>