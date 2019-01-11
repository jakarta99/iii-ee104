<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script src="/vendor/jquery/jquery.min.js"></script>
<script src="/js/webjar/sockjs.min.js"></script>
<script src="/js/webjar/stomp.min.js"></script>

<link rel="stylesheet" href="/css/chat.css" />
<script type="text/javascript">

	var stompClient = null;
	var to ;
	var toUserImg ;
	var fromUserImg;
	
	
	$(document).ready(function(){
		 to = $("#to").val();
	})
	
	function setConnected(connected) {
		document.getElementById('connect').disabled = connected;
		document.getElementById('disconnect').disabled = !connected;
		document.getElementById('conversationDiv').style.visibility = connected ? 'visible': 'hidden';
		document.getElementById('response').innerHTML = '';
	}

	function connect() {
		
		$.ajax({
			url:"/user/chatMessage/list?to=" + to,
			type: "post",
		    dataType : "json",	
        }).done(function(data){		
        	setConnected(true);
        	$.each(data.chatList, function(idx, obj){
        	 	var img;
        		var m = new Date(obj.time);
        		var dateTime = m.getHours() + ":" + m.getUTCMinutes() + ":" + m.getUTCSeconds() ;		
        	 	var p = $("<p></p>");
        	 	$(p).css("wordWrap","break-word");
        	 	if (obj.toAccount == to){
        	 		$(p).addClass("p1-to");
        	 		img = "<img src='/image/user/member/"+data.toMember.picture +"' class='userImg' />";
//         	 		toUserImg = img;
        	 	} else {
        	 		$(p).addClass("p1-from");
        	 		img = "<img src='/image/user/member/"+data.fromMember.picture +"' class='userImg' />";
//         	 		fromUserImg = img;
        	 	}
        	 	var msgSpan = "<p class='msgSpan'>"+obj.text+"</p>";
        	 	var dateTimeSpan = "<span class='dateTimeSpan'>"+dateTime+"</span>"; 	
        		$(p).append(img + msgSpan +"<br>" + dateTimeSpan)
	    	 	$('#response').append(p);
        	})
    	 	
    	 	$("#text").val("");
    	 	
    	
       }).fail(function (jqXHR, textStatus) {
// 			if (jqXHR.status == 200){
// 				window.location.href = '/login';
// 			}
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
		stompClient.send("/app/chat", {}, JSON.stringify({
			'to' : to,
			'text' : text
		}));
	}

	function showMessageOutput(messageOutput) {
	 	var m = new Date(messageOutput.time);
		var dateTime = m.getHours() + ":" + m.getUTCMinutes() + ":" + m.getUTCSeconds() 		
	 	var p = $("<p></p>");
	 	$(p).css("wordWrap","break-word");
	 	if (messageOutput.toAccount == to){
	 		$(p).addClass("p1-to");
	 		img = "<img src='/image/user/member/"+messageOutput.toMember.picture +"' class='userImg' />";
	 	} else {
	 		$(p).addClass("p1-from");
	 		img = "<img src='/image/user/member/"+messageOutput.toMember.picture +"' class='userImg' />";
	 	}
	 	var msgSpan = "<p class='msgSpan'>"+messageOutput.text+"</p>";
	 	var dateTimeSpan = "<span class='dateTimeSpan'>"+dateTime+"</span>"; 	
		$(p).append(img + msgSpan +"<br>"+ dateTimeSpan);

	 	$('#response').append(p);
	 	$("#text").val("");
	 	var h = $(".p1-to, .p1-from").css("height");
// 	 	console.log(h)
	
	}
</script>
		<button type="button" id="connect" class="btn btn-primary btn-sm" onclick="connect();" > 與我聊天</button>
		<button type="button" id="disconnect" class="btn btn-primary btn-sm" disabled="disabled" onclick="disconnect();"> 關閉聊天室</button>
		<div>傳送對象:
			<input type="text" disabled="disabled" id="to" value="${mission.member.account}"  />
		</div>


		
		<div id="container" onload="disconnect()">
	        <div id="content" > </div>
	        <div class="chattbox" id="send-box">   
	        	<div id="conversationDiv">
					<p id="response"></p>
					<input type="text" id="text" placeholder="Write a message..." />
					<button id="sendMessage" onclick="sendMessage();">Send</button>
				</div>
	        </div>
	    </div>


