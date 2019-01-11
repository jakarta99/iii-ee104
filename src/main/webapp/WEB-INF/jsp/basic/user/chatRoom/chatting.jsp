<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script src="/vendor/jquery/jquery.min.js"></script>
<script src="/js/webjar/sockjs.min.js"></script>
<script src="/js/webjar/stomp.min.js"></script>

<link rel="stylesheet" href="/css/chat.css" />
<script type="text/javascript">

	var stompClient = null;
	var to;
	var connected = false; 
	var visible = false;
	
	$(document).ready(function(){
		if (!connected){
			$("#connect").css("opacity", ".65");
			$("#sendMessage").prop("disabled",true);
			$("#text").prop("disabled",true);
		} 
		 to = $("#toAccount").text();
	})
	
	function setVisible(visible) {
		document.getElementById('conversationDiv').style.visibility = visible ? 'visible': 'hidden';
	} 
	
	function chat(){
		if (!visible || !connected){
			visible = true;
			$("#chatbox").css("bottom","2px");
		} else {
			visible = false;
			$("#chatbox").css("bottom","-324px");
		}
		if (!connected){
			connect();
			$("#connect").css("opacity", "1");
			
		} 
		setVisible(visible);
	}

	function connect() {
		console.log("to="+to)
		$.ajax({
			url:"/user/chatMessage/list?to=" + to,
			type: "post",
		    dataType : "json",	
        }).done(function(mapObj){	
        	connected = true;
        	$("#sendMessage").prop("disabled",false);
        	$("#text").prop("disabled",false);
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
		setConnected(false);
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
	}
</script>
		
		<div id="chatbox"  onload="disconnect()" >
			<span id="toAccount"  style="display:none">${mission.member.account}</span>
			<div id="connect"  class="btn btn-primary btn-sm"  >
				<div onclick="chat();" style="display:inline-block;width:80%"><span id="toName">${mission.member.name}</span></div>
				<button type="button" data-dismiss="modal" aria-label="Close" class="close" onclick="closeChatBox()"><span aria-hidden="true" >×</span></button>
			</div>
        	<div id="conversationDiv">
        		<div id="box">
					<p id="response"></p>
				</div>
				<input type="text" id="text" placeholder="Write a message..." />
				<button id="sendMessage" class="btn btn-primary btn-sm" onclick="sendMessage();">Send</button>
			</div>
	    </div>


