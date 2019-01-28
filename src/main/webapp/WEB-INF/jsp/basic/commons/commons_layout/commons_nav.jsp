<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>       

 <header class="nav-holder make-sticky">
        <div id="navbar" role="navigation" class="navbar navbar-expand-lg">
          <div class="container"><a href="/" class="navbar-brand home">
          	<img src="/img/logohomepage.png" alt="Universal logo" class="d-none d-md-inline-block" width="200"></a>
            <button type="button" data-toggle="collapse" data-target="#navigation" class="navbar-toggler btn-template-outlined"><span class="sr-only">Toggle navigation</span><i class="fa fa-align-justify"></i></button>
            <div id="navigation" class="navbar-collapse collapse">
              <ul class="nav navbar-nav ml-auto">
              	<li class="nav-item"><a href="/">&nbsp&nbsp首頁&nbsp&nbsp<b class="caret"></b></a>
                <li class="nav-item"><a href="##">公益團體 <b class="caret"></b></a>
                </li>
                <li class="nav-item menu-large"><a href="/commons/domesticVolunteer/list" >志工招募<b class="caret"></b></a>
                </li>
              	<li class="nav-item menu-large" ><a href="/user/calendar" id='userA'>會員專區 <b class="caret"></b></a>
<!--                   <ul class="dropdown-menu megamenu" style="width:450px;"> -->
<!--                     <li> -->
<!--                       <div class="row"> -->
<!--                         <div class="col-md-6 col-lg-3"> -->
<!--                           <h5><a href="/user/calendar" >行事曆</a></h5>                       -->
<!--                           <h5><a href="/user/system-message/list" id="systemMessage">通知</a></h5> -->
<!--                           <h5><a href="/user/personal-info/list" >我的個人資訊</a></h5>                           -->
<!--                         </div> -->
<!--                         <div class="col-md-6 col-lg-3"> -->
<!--                           <h5><a href="#" >志工招募</a></h5> -->
<!--                           <ul class="list-unstyled mb-3"> -->
<!--                             <li class="nav-item"><a href="/user/volunteerRecruitment/list" class="nav-link">招募紀錄</a></li> -->
<!--                             <li class="nav-item"><a href="/user/missionPublish/add" class="nav-link">刊登任務</a></li>                       -->
<!--                           </ul> -->
<!-- 	                         <h5><a href="#">志工申請</a></h5> -->
<!-- 	                          <ul class="list-unstyled mb-3"> -->
<!-- 	                            <li class="nav-item"><a href="javascript:document.location.href='/user/volunteerApplication/applicationPage'" class="nav-link">申請中</a></li> -->
<!-- 	                            <li class="nav-item"><a href="javascript:document.location.href='/user/volunteerRecord/RecordPage'" class="nav-link">服務紀錄</a></li>                           -->
<!-- 	                          </ul> -->
<!--                         </div> -->
<!--                         <div class="col-md-6 col-lg-3"> -->
<!--                          <h5><a href="/user/transaction-record/list" >我的交易紀錄</a></h5> -->
<!--                          <h5><a href="/user/myCollection/list" >我的最愛</a></h5> -->
<!--                           <h5><a href="/user/donation-record/list" >我的捐款</a></h5>      -->
<!--                         </div> -->
<!--                       </div> -->
<!--                     </li> -->
<!--                   </ul> -->
                </li>
                <sec:authorize access="hasAnyRole('USER','ORG_USER')">
                <li class="nav-item dropdown"><a href="javascript: void(0)" data-toggle="dropdown" class="dropdown-toggle" onclick="showChatMessages()">我的訊息<b class="caret"></b></a>
<!--                 <li class="nav-item menu-large" ><a href="##" data-toggle="dropdown" >我的訊息 <b class="caret"></b></a> -->
               	<ul class="dropdown-menu" id="chatMemberBoxList" style="width:300px;">
                 </ul>
                </sec:authorize>
                <li class="nav-item menu-large"><a href="/commons/InternationalVolunteer/list" >國際志工專區<b class="caret"></b></a>                        
                 <li class="nav-item dropdown"><a href="javascript: void(0)" data-toggle="dropdown" class="dropdown-toggle">關於我們<b class="caret"></b></a>
                  <ul class="dropdown-menu">
                    <li class="dropdown-item"><a href="/commons/aboutUs/aboutTimeBank" class="nav-link">關於TimeBank</a></li>
                    <li class="dropdown-item"><a href="/commons/aboutUs/contactUs" class="nav-link">聯絡我們</a></li>
                  </ul>
                </li>

                <!-- ========== admin dropdown ==================-->
               <sec:authorize access="hasRole('ADMIN')">				
                <li class="nav-item"><a href="/admin/donation/chart">管理者系統 <b class="caret"></b></a>
                
                </sec:authorize>
                <!-- ========== Contact dropdown end ==================-->
              </ul>
            </div>          
          </div>
        </div>
        
        
        <% String path = request.getServletPath() ;
	        if (path.indexOf("user")!= -1){		%>
	      <jsp:include page="../../user/user_layout/user_sidebar.jsp" />
	   
	    <% }%>    	

       
      </header>
 
 <script>
	//登入後，顯示系統訊息未讀數量
	$(document).ready(function(){
		console.log(location.href);
		var href = location.href
		if (href.indexOf("azure.com")!= -1){
			href = href.substring(href.indexOf("azure.com")+9);
			console.log(href);
		} else if (href.indexOf("localhost")!= -1){
			href = href.substring(href.indexOf("localhost")+9);
			console.log("url=")
			console.log(href);
		}
		var com = href.indexOf('commons');
		var now = href.substr(com+8, 5);
		console.log(now);
		if(href.length <= 5){
			$("#navbar .navbar-nav > li > a[href='/']")
			.css("background","rgba(19, 181, 177, 0.9)")
			.css("color"," rgba(240, 240, 240)");
		} else if(now == 'organ'){
			$("#navbar .navbar-nav > li > a[href='/commons/organization/list']")
			.css("background","rgba(19, 181, 177, 0.9)")
			.css("color"," rgba(240, 240, 240)");
		} else if(now == 'domes'){
			$("#navbar .navbar-nav > li > a[href='/commons/domesticVolunteer/list']")
			.css("background","rgba(19, 181, 177, 0.9)")
			.css("color"," rgba(240, 240, 240)");
		} else if(now == 'Inter'){
			$("#navbar .navbar-nav > li > a[href='/commons/InternationalVolunteer/list']")
			.css("background","rgba(19, 181, 177, 0.9)")
			.css("color"," rgba(240, 240, 240)");
		} else if(now == 'about'){
			$("#navbar .navbar-nav > li > a[href='javascript: void(0)']")
			.css("background","rgba(19, 181, 177, 0.9)")
			.css("color"," rgba(240, 240, 240)");
		} else {
			$("#userA")
			.css("background","rgba(19, 181, 177, 0.9)")
			.css("color"," rgba(240, 240, 240)");
		}
	})
	
 	if($("#loginName").html() != undefined){ //$("#loginName")來自commons_t0p-bar
 		checkMailBox();
 	}

	checkMailBox();
	function checkMailBox(){
		$.ajax({
			type:"get",
			url:"/user/system-message/countNotReadMessage",
		}).done(function(notReadMsgNum){
			if(notReadMsgNum > 0){
				$("#systemMessage").html("通知<font size='2' color='red'>("+ notReadMsgNum +")</font>")
			}else{
				$("#systemMessage").html("通知")
			}
			
		})
	}
	
	
	//我的訊息:取得所有聊天對象與最後一筆聊天紀錄
	function showChatMessages(){
		$.ajax({
			url:"/user/chatMessage/messages/all/chatObject",
			dataType:"json",
		}).done(function(data){
			console.log(data)
			$("#chatMemberBoxList").html("");
			$.each(data, function(idx, obj){
				var m = new Date(obj.time);
				var dateTime = m.getFullYear()+"-"+m.getMonth()+"-"+m.getDate();
				
				var chatMemberBox = '<div class="dropdown-item chatMemberBox" style="padding:5px 5px;"  id="chatMemberBox'+obj.toAccount+'">';
				chatMemberBox +='<div class="imgToken" >'; 
				chatMemberBox +='<img src="/image/user/member/'+obj.toMemberPic+'" style="width:50px;border-radius:100px;"/>'; 
				chatMemberBox +='</div><div class="chat-info">'; 
				chatMemberBox +='<div style="display:inline;color:#535a61;" id="'+obj.toAccount+'">'+obj.toName+'</div>';
				chatMemberBox +='<div style="display:inline; float:right;color:#777;padding-right:15px;">'+dateTime+'</div>'; 
				chatMemberBox += '<div style="overflow: hidden;padding-right:40px;color:#777;">'+obj.text+'</div>';
				chatMemberBox += '</div></div>';	
				$("#chatMemberBoxList").append(chatMemberBox);					
			})
			$("#chatMemberBoxList").append('<div style="display:inline; float:right;color:#13b5b1;padding-right:15px;"><a href="##">全部標示已讀</a></div>');	
			$("#chatMemberBoxList").prepend('<div style="text-align:left;color:#13b5b1;padding:5px 0 2px 5px;"><a href="##">最近訊息</a></div>');	
		})
	}		
	//我的訊息:chatMemberBox綁定事件，点擊產生chatBox
	$("#chatMemberBoxList").on("click",".chatMemberBox",function(){
		var toAccount= $(this).find(">:nth-child(2)>:first-child").attr("id");
		var toName= $(this).find(">:nth-child(2)>:first-child").text();
		createChatBox(toAccount,toName);
	})
	
	
</script>