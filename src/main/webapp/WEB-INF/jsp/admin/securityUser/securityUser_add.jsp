<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Member Add</title>

<jsp:include page="../admin_layout/admin_css_js_links.jsp" />
<!-- 台灣縣市地區選單	 -->
<script src="/js/tw-city-selector.min.js"></script>
<!-- date picker -->
<script type="text/javascript" src="/js/datepicker/moment.min.js"></script>
<script type="text/javascript" src="/js/datepicker/bootstrap-datepicker.js"></script>
<script src="/js/datepicker/bootstrap-datepicker.zh-TW.js"></script>
<link rel="stylesheet" href="/css/bootstrap-datepicker3.min.css" />      





<style>
	article {
		margin-top: 70px;
		padding: 10px;
	}
	
	article fieldset {
		width: 500px;
		border-radius: 20px;
		padding: 20px 20px 0px 20px; 
		border: 3px double #bebebe;
		margin: auto;
		margin-top: 10px; 
		margin-bottom: 20px; 
	}
	
	article input, select, label {
 		padding-left: 10px;  		
 		margin:0px 10px 10px 10px;   
	}
	

/* 	設定縣市地區選擇器的css樣式 */
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
	<jsp:include page="../admin_layout/nav.jsp" />
	<article>
		<input type="button" class="btn btn-primary btn-sm" onclick="javascript:document.location.href='/admin/member/list'" value="回會員列表"  />
		<h2>Member Add</h2>
		<form action="#" method="post" >
			<fieldset>
				<legend>帳號資訊</legend>
				<input type="hidden" value="" id="id" name="id" /> 
				<input type="hidden" value="${memberType}" id="memberType" name="memberType" />
				<div >
					<label>帳號 :</label> <input type="text" 
					value="${param.account }" id="account" name="account" ><br>
				</div>
				<div >
					<label>密碼 :</label> <input type="text" 
						value="${param.password }" id="password" name="password"><br>
				</div>
			</fieldset>
		
				<fieldset style="border:none">
					<div>
						<input type="button" class="btn btn-primary btn-sm" id='submit' value="確定送出" />
				        <input type="reset" class="btn btn-primary btn-sm" value="清除重填" />
					</div>
				</fieldset>
		</form>

	
	</article>
	
	<script>
		$(document).ready(function(){

// 			$("form div").addClass("form-group");
// 			$("form input").addClass("form-control");
// 			$("form textarea").addClass("form-control");
			
			
			new TwCitySelector();	

			$('#birthDate').datepicker({
			    format: "yyyy/mm/dd",
			    autoclose: true,
			    todayHighlight: true,
			    language: 'zh-TW',
			    startView:"years",
			    endDate:"0d"
			})
			
			
// 			insert new member
			$("#submit").click(function(){
				$.ajax({
					method:"post",
					dataType: "json",        
					url:"/admin/member/insert",
					data: $("form").serialize()
				}).done(function(response){
					
					if(response.status == "SUCCESS") {
						alert("會員新增成功");
						window.location.replace("/admin/member/list");
					} else {
						$.each(response.messages, function(idx, message) {
							alert("the "+idx+"th ERROR, because "+message);
						});
					}					
					
				})
			})

		
		})
		
		
	</script>
	

	


</body>
</html>