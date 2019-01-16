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
		<div id="content" style="border:1px solid gray;	height: 83%; ">
			<div id="chattedPeopleList" >
				<div>
					<div  class="item1">
						<div id="title-box">我的訊息</div>
					</div>
<!-- 					<div>	 -->
<!-- 						<div id="search-box"  ><input type="text" style="width:100%;text-align:center;padding:3px 0px" placeholder="搜尋"/></div> -->
<!-- 					</div> -->
				</div>
				<div class="item2">
					<div class="item2-1">
						<div id="search-box"  ><input type="text" style="width:100%;text-align:center;padding:3px 0px" placeholder="搜尋"/></div>
					</div>
					<div class="item2-2">
						<c:forEach items="${chatObjectsList}" var="chatMember">
							<div class="chatMemberBox" id="chatMemberBox${chatMember.toAccount}">
								<div class="imgToken" >							
									<img src="/image/user/member/${chatMember.toMemberPic}" style="width:50px;border-radius:50px;"/>
								</div>
								<div class="chat-info">
									<div style="display:inline" id="${chatMember.toAccount}">${chatMember.toName}</div>	
									<fmt:formatDate value="${chatMember.time}" pattern="yyyy-MM-dd" var="lastChatTime"/>
									<div style="display:inline; float:right">${lastChatTime}</div>
									<div style="overflow: hidden;padding-right:40px">${chatMember.text}</div>
								</div>
								
									
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
			<div id="chatMessageBoxArea">
				<div id="chatterName" class="item1"></div>
				<div id="box-chatPage" class="box-chatPage">
					<p id="response"></p>
				
				</div>
				<div style="margin: 10px 0px 5px 0px;">
				<input type="text"  id="text" class="text-chatPage" placeholder="輸入訊息" />
				<input type="button" id="sendButton" class="sendButton-chatPage" onclick="sendMessage()" value="傳送"> 
				</div>
			</div>
			<div id="other-info"> </div>
		</div>
	
	</div>
	
	<!-- chattingBox -->
	<jsp:include page="webSocketFunctions.jsp"></jsp:include>
	<script type="text/javascript">
	
		function connect(){
			var socket = new SockJS('/gs-guide-websocket'); 
    		stompClient = Stomp.over(socket);    		
    		stompClient.connect({}, function(frame) { 
    			console.log('Connected: ' + frame);
    			stompClient.subscribe('/topic/messages', function(messageOutput) {
    				//將對話放進'#response'，並改變chatMemberBox狀態
    				showMessageOutput(JSON.parse(messageOutput.body),"Y");
    			});   		
    		});
		}
		//取得與最後聊天對象的所有對話
		function getChatMessages() {
			console.log("to="+to)
			$.ajax({
				url:"/user/chatMessage/oldMessages/onePerson/query",
				type: "post",
				data: {"to":to, "from":from},
			    dataType : "json",	
	        }).done(function(mapObj){
	        	console.log("mapObj=")
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
	        	fillChatListIntoResponseBox(mapObj.chatList);
	        	$("#chatterName").text(mapObj.toMemberName);
		    	$('#box-chatPage').animate({ scrollTop: $("#response").height() }, 1);    	    	 	
	    	 	$("#text").val("");  	    	
	       });		
		}

		$(document).ready(function(){	
			$("#chatbox").remove();//清空裡面的元素內容
			to = $("#chattedPeopleList > div.item2> div.item2-2 > div:nth-child(1) > div.chat-info> div:nth-child(1)").attr("id");
			from = "${userAccount}";
			console.log("toAccount="+to);			
			getChatMessages();
			connect();
		})
		
		//點擊聊天對象，chatBox內容改變為與新聊天對象的對話
		$(".item2").on("click",".chatMemberBox",function(){
			var toAccount= $(this).find(">:nth-child(2)>:first-child").attr("id");
			to = toAccount;
			alert("clickMemberBox")
			getChatMessages();
		})

			
	</script>
	
	

	

</body>
</html>