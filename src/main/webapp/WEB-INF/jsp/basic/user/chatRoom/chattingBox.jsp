<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>   
<script src="/js/webjar/sockjs.min.js"></script>
<script src="/js/webjar/stomp.min.js"></script>
<!-- chattingBox.jsp is included in footer -->

<sec:authentication property="name" var="userAccount"/>
<script type="text/javascript">

	var stompClient = null;
	var to;
	var toPic;
	var from = "${userAccount}";
	var fromPic;
	var connected = false; 
	var visible = false;

	
	$(document).ready(function(){
// 		console.log('stompConnect=${stompClientConnection}');
// 		if ('${stompClientConnection}' == 'Y'){
// 			$("#chatbox").css("display","block");
// 			connect() 
// 		}else{
// 			disconnect();
// 			$("#chatbox").css("display","none");
// 		}
		//將指定的按鈕綁上click事件(頁面中的'與我聯絡'按鈕的id都是chatButton)
		$("#chatButton").on("click",function(){
			startToChat();
		})
		
		
	})
	

	function conversationDivDisplay(){
		if (!visible){
			visible = true;
			$("#chatbox").css("bottom","2px");
		} else {
			visible = false;
			$("#chatbox").css("bottom","-324px");
		}
	}
	
	function chat(){
		if (!connected){
			connect();
			console.log("connected:"+connected);
			console.log("visible:"+visible);
		} 
	}

	function connect() {
		console.log("to="+to)
		//從資料庫中取出聊天室過往的訊息紀錄
		$.ajax({
			url:"/user/chatMessage/oldMessages/onePerson/query",
			type: "post",
			data: {"to":to, "from":from},
		    dataType : "json",	
        }).done(function(mapObj){	
        	connected = true;
        	visible = true;
        	$("#sendMessage").prop("disabled",false);
        	$("#text").prop("disabled",false);
        	$("#chatbox").css("display","block");
        	$("#connect").css("opacity", "1");	
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
	    	$('#box').animate({ scrollTop: $("#response").height() }, 1);    	    	 	
    	 	$("#text").val("");  	
       }).fail(function (jqXHR, textStatus) {
    	   	connected = false;
	    	$("#login-modal").addClass("modal fade show");
    	   	$("#login-modal").css("display","block");
    	   	$("#login-modal").css("padding-right","17px");
    		$("#action").val("chatting");
	    });
	
		//使用SockJS和stomp.js來打開"/gs-guide-websocket"地址的連接，這也是我們使用Spring構建的SockJS服務
		var socket = new SockJS('/gs-guide-websocket'); // 創建連接對象（還未發起連接）
		stompClient = Stomp.over(socket); // 獲取 STOMP 子協議的客户端對象
		// 向服務器發起websocket連接併發送CONNECT
		stompClient.connect({}, function(frame) { //連接成功時（服務器響應 CONNECTED）的回調方法
			console.log('Connected: ' + frame);
			//STOMP客户端必須先訂閲相應的URL("/topic/messages")，才能不斷接收來自服務器的推送消息
			//訂閱後，只要服務端向此地址發送消息，客戶端即可收到此消息
			stompClient.subscribe('/topic/messages', function(messageOutput) {	
				//收到消息時的回調方法
				showMessageOutput(JSON.parse(messageOutput.body));
			});
		
		});
	
		
	}

	function disconnect() {
		if (stompClient != null) {
			stompClient.disconnect(); //斷開連接
		}
		connected = false; 
		visible = false;
		console.log("Disconnected");
<%-- 		<% request.getSession().removeAttribute("stompClientConnection");%> --%>
	}

	function sendMessage() {
		var text = $('#text').val();
		if (text.length >0){
			//連接成功後，客户端可使用 send()方法向服務器發送信息
			stompClient.send("/app/chat", {}, JSON.stringify({	
				'from':from,
				'to' : to,
				'text' : text
			}));			
		}
	}

	function showMessageOutput(chatMessage) {
		console.log("fromAccount="+chatMessage.fromAccount);
		console.log("toAccount="+chatMessage.toAccount);
	 	var m = new Date(chatMessage.time);
		var dateTime = m.getHours() + ":" + m.getUTCMinutes();		
	 	var p = $("<p></p>");
	 	$(p).css("wordWrap","break-word");
	 	var msgSpan = "<p class='msgSpan'>"+chatMessage.text+"</p>";
	 	var dateTimeSpan = "<p class='dateTimeSpan'>"+dateTime+"</p>"; 	
	 	if (chatMessage.toAccount == to && chatMessage.fromAccount == '${userAccount}'){
	 		$(p).addClass("p1-from");
			$(p).append(msgSpan +"<br>"+ dateTimeSpan);
	 	} else if (chatMessage.fromAccount == to && chatMessage.toAccount == '${userAccount}'){
	 		$(p).addClass("p1-to");
	 		img = "<img src='/image/user/member/"+ toPic +"' class='userImg' />";
			$(p).append(img + msgSpan +"<br>"+ dateTimeSpan);
	 	}
	 	$('#response').append(p);
	 	$('#box').animate({ scrollTop: $("#response").height() }, 1);
	 	$("#text").val("");
	}
	
	
	function closeChatBox(){
		$("#chatbox").hide();
		if (connected){
			disconnect();
			$('#response').html("");    	
		}
		console.log("close");
		console.log("connected="+connected)
	}
</script>

		
		
		<div id="chatbox" style="display:none" onload="disconnect()" >
			<span id="toAccount" style="display:none"></span>
			<div  id="connect"  class="btn btn-primary btn-sm"  >
				<div onclick="conversationDivDisplay();" style="display:inline-block;width:80%"><span id="toName"></span></div>
				<button type="button" data-dismiss="modal" aria-label="Close" class="close" onclick="closeChatBox()"><span aria-hidden="true" >×</span></button>
			</div>
        	<div id="conversationDiv">
        		<div id="box">
					<p id="response"></p>
				</div>
				<input type="text" id="text" placeholder="Write a message..." />
				<button id="sendMessage" class="btn btn-primary btn-sm" disabled onclick="sendMessage();">Send</button>
			</div>
	    </div>
	    

	    <c:if test="${chatting eq 'Y'}">
			<script>
				$("#chatbox").css("display", "block");
				startToChat();
			</script>
			 <% request.getSession().removeAttribute("chatting");%>
		</c:if>


