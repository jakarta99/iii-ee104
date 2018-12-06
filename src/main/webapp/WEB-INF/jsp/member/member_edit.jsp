<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>	
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!doctype html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Member Edit</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<!-- Bootstrap core CSS -->
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


<!-- 台灣縣市地區選單	 -->
<script src="/js/tw-city-selector.min.js"></script>
<!-- date picker -->
<script type="text/javascript" src="/js/moment.min.js"></script>
<script type="text/javascript" src="/js/bootstrap-datepicker.js"></script>
<script src="/js/locales/bootstrap-datepicker.zh-TW.js"></script>
<link rel="stylesheet" href="/css/bootstrap-datepicker3.min.css" />      



<style>
 	article{
	 	margin-top:70px;
	 	padding:10px;
	 }
	 
  	article input,select,label{  
  		padding-left:10px;
 		margin-bottom:20px;  
    	margin-left:15px;  
 	}   
 	 fieldset {
            width: 800px;
            border-radius: 20px;
            padding: 20px;
            margin: 20px;
            border: 3px double #bebebe;
            margin: auto
        }
        .s2{ 
            text-align: center 
        } 
 	
	
</style>


</head>
<body>
<!-- 使用AJAX -->
<!-- 	<div id="navBar"></div> -->
	<c:import url="/html/nav.html"/>
	<article>
		<h2>Member Edit</h2>
		<h4>Member ${member.id}</h4>
		
		<form action="#" method="post" >
		<fieldset>
			<input type="hidden" value="${member.id}" id="id" name="id"/>
			<input type="hidden" value="${member.memberType}" id="memberType" name="memberType"/><br>
			<div class="form_group row">
					<label>帳號 :</label>
					<input type="text" class="form-control" value="${member.account }" id="account" name="account" readonly><br> 	
			</div>
			<div class="form_group row">
					<label>密碼 :</label>
					<input type="text" class="form-control" value="${member.password }" id="password" name="password"><br>
			</div>
			<div class="form_group row">
					<label>名字 :</label>
					<input type="text" class="form-control" value="${member.name }" id="name" name="name"><br>			
			</div>
				<fmt:formatDate  value="${member.birthDate }" pattern="yyyy/MM/dd" var="birthDate"/>
					<c:choose>
						<c:when test="${member.memberType eq 'P'}">					
							<div class="form_group row">
								
									<label>身分證字號 :</label> 
									<input type="text" class="form-control" value="${member.certificateIdNumber }" id="certificateIdNumber" name="certificateIdNumber"><br>
								
							</div>
							<div class="form_group row">
								
									<label>出生日期:</label> 
									<input type="text" class="form-control" value="${birthDate}" id="birthDate" name="birthDate"><br>  
								
							</div>
									
						</c:when>
						<c:when test="${member.memberType eq 'O'}">
							<div class="form_group row">
							
									<label>統一編號 :</label> 
									<input type="text" class="form-control" value="${member.certificateIdNumber }" id="certificateIdNumber" name="certificateIdNumber"><br>
								
							</div>
							<div class="form_group row">
					
									<label>創立日期:</label> 
				 					<input type="text" class="form-control" value="${birthDate}" id="birthDate" name="birthDate"><br> 
								
							</div>
									
						</c:when>
					</c:choose>	
			<div class="form_group row">
			
					<label>email:</label>
					<input type="text" class="form-control" value="${member.email }" id="email" name="email"><br>
				
			</div>
			<div class="form_group row">
				
					<label>住家電話:</label>
					<input type="text" class="form-control" value="${member.telephone }" id="telephone" name="telephone"><br>
				
			</div>
			<div class="form_group row">
				
					<label>手機:</label> 
					<input type="text" class="form-control" value="${member.mobile }" id="mobile" name="mobile"><br>
				
			</div>
			<div class="form_group row">
					<label>住址:</label>
					<div role="tw-city-selector"></div>
					<input type='text' class="form-control"  value='${member.address }' id='address' name='address' /><br>
			</div>			
			<div class="form_group row" >
					<label>Email驗證信確認(Y/N):</label> 
					<div>
						<label>Y</label> 
						<input type="radio"  value="Y" name="emailVerification" />
					</div>
					<div>
						<label>N</label> 
						<input type="radio"  value="N" name="emailVerification" /><br>		
					</div>
			</div>			
			<div class="form_group row">
			
					<fmt:formatDate value="${member.signUpDate }" pattern="yyyy/MM/dd" var="signUpDate"/>
					<label>註冊日期:</label> 
					<input type="text" class="form-control" value="${signUpDate}" id="signUpDate" name="signUpDate" ><br>
				
			</div>
			<c:if test="${member.memberType eq 'O' }">
				<div class="form_group row">
				
						<label>創辦人:</label> 
						<input type="text" class="form-control" value="${member.orgFounder}" id="orgFounder" name="orgFounder"><br>
				
				</div>
				<div class="form_group row">
						<label>執行長: </label>
						<input type="text" class="form-control" value="${member.orgCeo}" id="orgCeo" name="orgCeo"><br>
				</div>
				<div class="form_group row">
						<label>聯絡人:</label> 
						<input type="text" class="form-control" value="${member.orgContactPerson }" id="orgContactPerson" name="orgContactPerson"><br>
				</div>		
				<div class="form_group row">
					
						<label>聯絡人電話:</label> 
						<input type="text" class="form-control" value="${member.orgContactPersonTel }" id="orgContactPersonTel" name="orgContactPersonTel"><br>
					
				</div>					
				<div class="form_group row">
					
						<label>聯絡人手機:</label> 
						<input type="text" class="form-control" value="${member.orgContactPersonMobile }" id="orgContactPersonMobile" name="orgContactPersonMobile"><br>
					
				</div>					
				<div class="form_group row">
					
						<label>網址:</label> 
						<input type="url" class="form-control" size='50px' value="${member.orgWebsiteLink }" id="orgWebsiteLink" name="orgWebsiteLink"><br>
					
				</div>	
				<div class="form_group row">
					
						<label >創立宗旨:</label> 
						<textarea  rows="4" column="10" class="form-control" cols="30"  id="orgFoundPurpose" name="orgFoundPurpose">${member.orgFoundPurpose}</textarea><br>		
					
				</div>					
				<div class="form_group row">
					<label>機構身分驗證 (Y/N): </label>
					<div>					
						<label>Y</label>
						<input type="radio"  value="Y" name="orgIdConfirmation" />
					</div>
					<div>
						<label>N</label>
						<input type="radio" value="N" name="orgIdConfirmation" /><br>								
					</div>
				</div>	
			</c:if>
			<div>
				<input type="button" class="btn btn-primary btn-sm" id="updateButt" value="儲存" />
				<input type="button" class="btn btn-primary btn-sm" onclick="javascript:document.location.href='/member/list'" value="回上一頁" />
			</div>
			</fieldset>
		</form>
		
	</article>
	
	<script>
		$(document).ready(function(){
			//add nav.html
// 			$.get("/html/nav.html",function(data){
// 				$("#navBar").html(data);
// 			});
			
			
			new TwCitySelector();	
			
			$('#birthDate').datepicker({
			    format: "yyyy/mm/dd",
			    autoclose: true,
			    calendarWeeks: true,
			    todayHighlight: true,
			    language: 'zh-TW'
			})
			$('#signUpDate').datepicker({
			    format: "yyyy/mm/dd",
			    autoclose: true,
			    calendarWeeks: true,
			    todayHighlight: true,
			    language: 'zh-TW'
			})

			$("div[role='tw-city-selector']").attr("data-county-value",'${member.county}');
			$("div[role='tw-city-selector']").attr("data-district-value",'${member.district}');
// 			$("div[role='tw-city-selector']>select").addClass(".form-control");

			$("input[name='emailVerification'][value="+ '${member.emailVerification}' +"]").prop("checked",true);
			if ('${member.memberType }'=='O'){
				$("input[name='orgIdConfirmation'][value="+'${member.orgIdConfirmation}' +"]").prop("checked",true);					
			}
			
				
			$("#updateButt").click(function(){
				$.ajax({
					  method: "put",
					  dataType: "json",         
					  url: "/member/update",
					  data: $("form").serialize(),
					})
					  .done(function(data){
							$.each(data, function(key, value){
								if (key == 'msg'){
									alert(value);
	
								}
							})
					  });	
				
				

		
			})
			
			
		})
	
	</script>
	
	
</body>
</html>