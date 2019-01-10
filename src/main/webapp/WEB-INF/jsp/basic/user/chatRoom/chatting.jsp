<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script src="/vendor/jquery/jquery.min.js"></script>
<script src="/js/webjar/sockjs.min.js"></script>
<script src="/js/webjar/stomp.min.js"></script>

<link rel="stylesheet" href="/css/chatt.css" />
<script type="text/javascript">

	var stompClient = null;
	var to = $("#to").val();
	
	function setConnected(connected) {
		document.getElementById('connect').disabled = connected;
		document.getElementById('disconnect').disabled = !connected;
		document.getElementById('conversationDiv').style.visibility = connected ? 'visible': 'hidden';
		document.getElementById('response').innerHTML = '';
	}

	function connect() {
		var socket = new SockJS('/chat');
		stompClient = Stomp.over(socket);
		stompClient.connect({}, function(frame) {
			setConnected(true);
			console.log('Connected: ' + frame);
			stompClient.subscribe('/topic/messages', function(messageOutput) {
				showMessageOutput(JSON.parse(messageOutput.body));
			});
		
			var to = $("#to").val();
			$.ajax({
					url:"/user/chatMessage/list?to=" + to,
					type: "post",
				    dataType : "json",	    
		        }).done(function(data){
		        	console.log("data=");
		        	console.log(data)
		        	var response = document.getElementById('response');
		    		$.each(data, function(idx, obj){
		    			console.log("text="+obj.text)
		    	 		var p = document.createElement('p');
		    	 		p.style.wordWrap = 'break-word';
		    	 		p.appendChild(document.createTextNode(obj.fromAccount + ": "
		    	 				+ obj.text + " (" + obj.time + ")" ) );
		    	 		response.appendChild(p);
		    		})
		       })
		
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
		var to = $("#to").val();
		var text = $('#text').val();
		stompClient.send("/app/chat", {}, JSON.stringify({
			'to' : to,
			'text' : text
		}));
	}

	function showMessageOutput(messageOutput) {
	 	var response = document.getElementById('response');
	 	var p = document.createElement('p');
	 	p.style.wordWrap = 'break-word';
	 	p.appendChild(document.createTextNode(messageOutput.fromAccount + ": "
	 				+ messageOutput.text + " (" + messageOutput.time + ")" ) );
	 	response.appendChild(p);
	
	

	}
</script>
		<button type="button" id="connect" class="btn btn-primary btn-sm" onclick="connect();" > 與我聊天</button>
		<button type="button" id="disconnect" class="btn btn-primary btn-sm" disabled="disabled" onclick="disconnect();"> 關閉聊天室</button>
		<div>
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


