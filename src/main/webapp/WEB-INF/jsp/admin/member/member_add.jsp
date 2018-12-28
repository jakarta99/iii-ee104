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
			<fieldset>	
				<legend>個人資訊</legend>
				<div  >
					<label>名字 :</label> <input type="text" 
						value="${param.name }" id="name" name="name"><br>
				</div>
				
				<c:choose>
					<c:when test="${memberType eq 'P'}">
						<div  >
							<label>身分證字號 :</label> <input type="text" 
								value="${param.certificateIdNumber }" id="certificateIdNumber"	name="certificateIdNumber"><br>
						</div>
						<div  >
							<label>出生日期:</label> <input type="text" 
								value="${param.birthDate}" id="birthDate" name="birthDate" autocomplete="off"><br>
						</div>

					</c:when>
					<c:when test="${memberType eq 'O'}">
						<div  >
							<label>統一編號 :</label> 
							<input type="text" 	value="${param.certificateIdNumber }" 
							id="certificateIdNumber" name="certificateIdNumber"><br>
						</div>
						<div  >
							<label>創立日期:</label> 
							<input type="text" 
								value="${param.birthDate}" id="birthDate" name="birthDate" autocomplete="off"><br>
						</div>

					</c:when>
				</c:choose>
				<div  >

					<label>email:</label> 
					<input type="text" 
						value="${param.email }" id="email" name="email"><br>

				</div>
				<div  >

					<label>住家電話:</label> 
					<input type="text" 
						value="${param.telephone }" id="telephone" name="telephone"><br>

				</div>
				<div  >

					<label>手機:</label> 
					<input type="text" 
						value="${param.mobile }" id="mobile" name="mobile"><br>

				</div>
				<div  >			
					<label>住址:</label> <br>
					<div role="tw-city-selector" ></div>
					<input type='text'  value='${param.address }'
						id='address' name='address' /><br>
				</div>
			</fieldset>
				<c:if test="${memberType eq 'O' }">
				<fieldset>
					<div  >
						<label>創辦人:</label> 
						<input type="text" 
							value="${param.orgFounder}" id="orgFounder" name="orgFounder"><br>
					</div>
					<div  >
						<label>執行長: </label> <input type="text" 
							value="${param.orgCeo}" id="orgCeo" name="orgCeo"><br>
					</div>
					<div  >
						<label>聯絡人:</label> <input type="text"  value="${param.orgContactPerson }" 
							id="orgContactPerson" name="orgContactPerson"><br>
					</div>
					<div  >
						<label>聯絡人電話:</label> 
						<input type="text"  value="${param.orgContactPersonTel }" 
							id="orgContactPersonTel" name="orgContactPersonTel"><br>
					</div>
					<div  >
						<label>聯絡人手機:</label> <input type="text" 
							value="${param.orgContactPersonMobile }" id="orgContactPersonMobile" name="orgContactPersonMobile"><br>
					</div>
					<div  >
						<label>網址:</label> <input type="url" 	size='50px' 
							value="${param.orgWebsiteLink }" id="orgWebsiteLink" name="orgWebsiteLink"><br>
					</div>
					<div  >
						<label>創立宗旨:</label>
						<textarea rows="5" cols="50"   id="orgFoundPurpose"
							 name="orgFoundPurpose">${member.orgFoundPurpose}</textarea>	<br>
					</div>
					
				</fieldset>
				</c:if>
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
					data: $("form").serializeObject();
				}).done(function(response){
// 					alert(response.obj);
// 					console.log("status="+response.status);
// 					console.log("message="+response.message);
					
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