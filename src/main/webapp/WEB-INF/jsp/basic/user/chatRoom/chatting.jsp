<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<script src="/js/webjar/sockjs.min.js"></script>
<script src="/js/webjar/stomp.min.js"></script>

<script type="text/javascript">
	var stompClient = null;

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
		var to = $("to").value;
		var text = $('text').value;
		stompClient.send("/app/chat", {}, JSON.stringify({
			'to' : to,
			'text' : text
		}));
	}

	function showMessageOutput(messageOutput) {
		var response = $('response');
		var p = document.createElement('p');
		p.style.wordWrap = 'break-word';
		p.appendChild(document.createTextNode(messageOutput.to + ": "
				+ messageOutput.text + " (" + messageOutput.time + ")"));
		response.appendChild(p);
	}
</script>

		<div>
			<input type="text" id="to" placeholder="Choose a nickname" />
		</div>
		<br />
		<div>
			<button id="connect" onclick="connect();">Connect</button>
			<button id="disconnect" disabled="disabled" onclick="disconnect();">
				Disconnect</button>
		</div>
		<br />

		
		<div id="container" onload="disconnect()">
	        <div id="content" > </div>
	        <div id="send-box">   
	        	<div id="conversationDiv" style="width:260px; height:300px;border:1px solid black; text-align:center; padding:20px">
					<p id="response" style="height:240px;border:1px solid blue;"></p>
					<input type="text" id="text" placeholder="Write a message..." />
					<button id="sendMessage" onclick="sendMessage();">Send</button>
				</div>
	        </div>
	    </div>


