<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script src="/vendor/jquery/jquery.min.js"></script>
<script src="/js/webjar/sockjs.min.js"></script>
<script src="/js/webjar/stomp.min.js"></script>
<!-- chattingBox.jsp is included in footer -->
<script type="text/javascript">

	var stompClient = null;
	var to;
	var connected = false; 
	var visible = false;
	
	$(document).ready(function(){
// 		if ('${chatting}' == 'Y'){
// 			chat();	
// 		}
		console.log('${sessionScope.chatting}');
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
		$.ajax({
			url:"/user/chatMessage/listMessage?to=" + to,
			type: "post",
		    dataType : "json",	
        }).done(function(mapObj){	
        	connected = true;
        	visible = true;
        	$("#sendMessage").prop("disabled",false);
        	$("#text").prop("disabled",false);
        	$("#chatbox").css("display","block");
        	$("#connect").css("opacity", "1");	
        	$.each(mapObj.chatList, function(idx, chatMessage){
        	 	var img;
        		var m = new Date(chatMessage.time);
        		var dateTime = m.getHours() + ":" + m.getUTCMinutes() ;		
        	 	var p = $("<p></p>");
        	 	$(p).css("wordWrap","break-word");
        	 	var msgSpan = "<p class='msgSpan'>"+ chatMessage.text +"</p>";
        	 	var dateTimeSpan = "<p class='dateTimeSpan'>"+ dateTime + "</p>"; 	
        	 	if (chatMessage.toAccount == to){
        	 		$(p).addClass("p1-to");
        		$(p).append( msgSpan +"<br>" + dateTimeSpan)
        	 	} else {
        	 		$(p).addClass("p1-from");
        	 		img = "<img src='/image/user/member/"+mapObj.toMemberPic +"' class='userImg' />";
            		$(p).append(img + msgSpan +"<br>" + dateTimeSpan)
        	 	}
	    	 	$('#response').append(p);
	    	 	
	    	 	$('#box').animate({ scrollTop: $("#response").height() }, 1);
	    	 
        	})
    	 	
    	 	$("#text").val("");
        	
    	 	
    	
       }).fail(function (jqXHR, textStatus) {
    	   	connected = false;
	    	$("#login-modal").addClass("modal fade show");
    	   	$("#login-modal").css("display","block");
    	   	$("#login-modal").css("padding-right","17px");
    		$("#action").val("chatting");
	    });
	

		var socket = new SockJS('/chat');
		stompClient = Stomp.over(socket);
		stompClient.connect({}, function(frame) {		
			console.log('Connected: ' + frame);
			stompClient.subscribe('/topic/messages', function(messageOutput) {
				showMessageOutput(JSON.parse(messageOutput.body));
			});
		
		});
	
		
	}

	function disconnect() {
		if (stompClient != null) {
			stompClient.disconnect();
		}
		connected = false; 
		visible = false;
		console.log("Disconnected");
	}

	function sendMessage() {
		var text = $('#text').val();
		if (text.length >0){
			stompClient.send("/app/chat", {}, JSON.stringify({
				'to' : to,
				'text' : text
			}));			
		}
	}

	function showMessageOutput(chatMessage) {
	 	var m = new Date(chatMessage.time);
		var dateTime = m.getHours() + ":" + m.getUTCMinutes();		
	 	var p = $("<p></p>");
	 	$(p).css("wordWrap","break-word");
	 	var msgSpan = "<p class='msgSpan'>"+chatMessage.text+"</p>";
	 	var dateTimeSpan = "<p class='dateTimeSpan'>"+dateTime+"</p>"; 	
	 	if (chatMessage.toAccount == to){
	 		$(p).addClass("p1-to");
			$(p).append(msgSpan +"<br>"+ dateTimeSpan);
	 	} else {
	 		$(p).addClass("p1-from");
	 		img = "<img src='/image/user/member/"+chatMessage.toMemberPic +"' class='userImg' />";
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
		}
		console.log("close");
		console.log(connected)
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


