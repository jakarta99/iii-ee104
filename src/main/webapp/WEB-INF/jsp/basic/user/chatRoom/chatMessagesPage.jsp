<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>       
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>我的訊息 | TimeBank</title>
<!-- css -->
<jsp:include page="../../commons/commons_layout/commons_css_links.jsp" />
<!-- Javascript files-->
<jsp:include page="../../commons/commons_layout/commons_js_links.jsp" />
<link rel="stylesheet" href="/css/chatAll.css">
<style>

</style>
</head>
<body>
	<!-- Top bar-->
	<jsp:include page="../../commons/commons_layout/commons_top-bar.jsp" />
	<!-- Navbar -->
	<jsp:include page="../../commons/commons_layout/commons_nav.jsp" />
	
	<sec:authentication property="name" var="userAccount"/>

			
	<div id="all">
		<div id="content" style="border:1px solid gray">
			<div id="chattedPeopleList" >
				<div class="item1-1">
					<div  class="item1">
						<div id="title-box" class="item1">我的訊息</div>
						<div id="search-box" class="item1" ><input type="text" style="width:100%;text-align:center;padding:3px 0px" placeholder="搜尋"/></div>
					</div>	
				</div>
				<div class="item2">
					<c:forEach items="${chatObjectsList}" var="chatMember">
						<div class="chatMemberBox" >
							<div class="imgToken" >							
								<img src="/image/user/member/${chatMember.toMemberPic}" style="width:50px;border-radius:50px;"/>
							</div>
							<div class="chat-info">
								<div style="display:inline" id="${chatMember.toAccount}">${chatMember.toName}</div>	
								<fmt:formatDate value="${chatMember.time}" pattern="yyyy-MM-dd" var="lastChatTime"/>
								<div style="display:inline; float:right">${lastChatTime}</div>
								<div >${chatMember.text}</div>
							</div>
							
								
						</div>
					</c:forEach>
				</div>
			</div>
			<div id="chatMessageBoxArea">
				<div id="chatterName" class="item1-1"></div>
				<div id="box-chatPage" class="box-chatPage">
					<p id="response"></p>
				
				</div>
				<div style="margin: 10px 0px 5px 0px;">
				<input type="text"  id="text" class="text-chatPage" placeholder="輸入訊息" />
				<input type="button" id="sendButton" class="sendButton-chatPage" onclick="sendMessage2()" value="傳送"> 
				</div>
			</div>
			<div id="other-info"> </div>
		</div>
	
	</div>
	
	<!-- chattingBox -->
	<jsp:include page="chattingBox.jsp"></jsp:include>
	<script>
	
		
		function getChatMessages() {
			console.log("to="+to)
			//從資料庫中取出聊天室過往的訊息紀錄
			$.ajax({
				url:"/user/chatMessage/oldMessages/onePerson/query",
				type: "post",
				data: {"to":to, "from":from},
			    dataType : "json",	
	        }).done(function(mapObj){
	        	console.log(mapObj);
	        	$('#response').html("");    
	        	//從回傳的物件中取得聊天室雙方資訊
	        	toPic=mapObj.toMemberPic;
	        	fromPic=mapObj.fromMemberPic;
				//從session scope取得聊天室雙方資訊
	// 			to='${toMember.account}';
	//         	toPic='${toMember.picture}';
	//         	fromPic='${fromMember.picture}';
	        	console.log("toPic="+toPic);
	        	console.log("fromPic="+fromPic);
	        	$.each(mapObj.chatList, function(idx, chatMessage){
	        	 	var img;
	        		var m = new Date(chatMessage.time);
	        		var dateTime = m.getHours() + ":" + m.getUTCMinutes() ;		
	        	 	var p = $("<p></p>");
	        	 	$(p).css("wordWrap","break-word");
	        	 	var msgSpan = "<p class='msgSpan'>"+ chatMessage.text +"</p>";
	        	 	var dateTimeSpan = "<p class='dateTimeSpan'>"+ dateTime + "</p>"; 	
	        	 	if (chatMessage.toAccount == to || chatMessage.fromAccount == "${userAccount}"){
	        	 		$(p).addClass("p1-from");
	        			$(p).append( msgSpan +"<br>" + dateTimeSpan)
	        	 	} else {
	        	 		$(p).addClass("p1-to");
	        	 		img = "<img src='/image/user/member/"+ toPic +"' class='userImg' />";
	            		$(p).append(img + msgSpan +"<br>" + dateTimeSpan)
	        	 	}
		    	 	$('#response').append(p);    	 	
	        	})
	        	$("#chatterName").text(mapObj.toMemberName);
		    	$('#box-chatPage').animate({ scrollTop: $("#response").height() }, 1);    	    	 	
	    	 	$("#text").val("");  
	    	 	connect();
	       });		
		}

		function sendMessage2(){
// 			sendMessage();
			if (to != $("#chatterName").text()){
// 				var outer_element_html = $("#"+to).parent(".chatMemberBox").html();
// 				console.log(outer_element_html);
			}
		}

		
		$(document).ready(function(){	
			$("#chatbox").html("");//清空裡面的元素內容
			to = $("#chattedPeopleList > div.item2 > div:nth-child(1) > div.chat-info> div:nth-child(1)").attr("id");
			console.log("toAccount="+to);			
			getChatMessages();
			
			
		})
		
		$(".chatMemberBox").on("click",function(){
// 			var id= $(this).children(".chat-info").childern().first().attr("id");
			var toAccount= $(this).find(">:nth-child(2)>:first-child").attr("id");
			to = toAccount;
			getChatMessages()
		})
			
	</script>
	
	

	

</body>
</html>