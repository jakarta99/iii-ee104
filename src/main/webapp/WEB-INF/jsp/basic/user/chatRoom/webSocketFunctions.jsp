<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>   
<sec:authentication property="name" var="userAccount"/>

<script src="/js/webjar/sockjs.min.js"></script>
<script src="/js/webjar/stomp.min.js"></script>
<script type="text/javascript">
//聊天室的各種function	
//1.進行websocket連線 connect()，並向server訂閱subscribe():chattingBox.jsp
//2.發送訊息send()
//3.接收訊息並顯示showMessageOutput()

function connect() {
	if (!connected){		
		//使用SockJS和stomp.js來打開"/gs-guide-websocket"地址的連接，這也是我們使用Spring構建的SockJS服務
		var socket = new SockJS('/gs-guide-websocket'); // 創建連接對象（還未發起連接）
		stompClient = Stomp.over(socket); // 獲取 STOMP 子協議的客户端對象
		// 向服務器發起websocket連接併發送CONNECT
		stompClient.connect({}, function(frame) { //連接成功時（服務器響應 CONNECTED）的回調方法
			console.log('Connected: ' + frame);
			//STOMP客户端必須先訂閲相應的URL，才能不斷接收來自服務器的推送消息
			//訂閱後，只要服務端向此地址發送消息，客戶端即可收到此消息
			stompClient.subscribe('/topic/chat/single/${userAccount}', function(messageOutput) {	
				//收到消息時的回調方法
				var chatMessage = JSON.parse(messageOutput.body);			
				showMessageOutput(chatMessage);									 	
			});
		});	
	}
}


function sendMessage(toAccount,readStatus) {	
	if (toAccount != '${userAccount}'){	
		var text= $('#text'+toAccount).val();	
		var readAlready = readStatus;
// 		console.log("text="+text+", readAlready="+readStatus);		
		//#response加入新發出的訊息
		if (text != undefined && text.length >0){
			var m = new Date();
			var dateTime = m.getHours() + ":" + m.getUTCMinutes();		
		 	var p = $("<p></p>");
		 	$(p).css("wordWrap","break-word").addClass("p1-from");;	
			$(p).append("<p class='msgSpan'>"+text+"</p><br><p class='dateTimeSpan'>"+dateTime+"</p>");
			$('#response'+toAccount).append(p);	  
	 		$(".readAlready").remove();
			$('#box'+toAccount).animate({ scrollTop: $("#response"+toAccount).height() }, 1);  
		}
		//向服務器發送信息
		stompClient.send("/app/chat", {}, JSON.stringify({	
			'fromAccount':'${userAccount}',
			'toAccount' : toAccount,
			'text' : text,
			'readAlready': readAlready
		}));
		$('#text'+toAccount).val("");
	}	
}
		


function disconnect(toAccount) {
	if (stompClient != null) {
 		stompClient.disconnect(); //斷開連接
		
	}
	connected = false;
	console.log("Disconnected");
}


//將以往的聊天紀錄塞入聊天視窗
function fillChatListIntoResponseBox(toAccount,toMemberPic,chatMsgList){
	var lastMsg = null;
	$.each(chatMsgList, function(idx, chatMessage){
	 	var img;
		var m = new Date(chatMessage.time);
		var dateTime = m.getHours() + ":" + m.getUTCMinutes() ;		
	 	var p = $("<p></p>");
	 	$(p).css("wordWrap","break-word");
	 	var msgSpan = "<p class='msgSpan'>"+ chatMessage.text +"</p>";
	 	var dateTimeSpan = "<p class='dateTimeSpan'>"+ dateTime + "</p>"; 		 
	 	if (chatMessage.toAccount == toAccount || chatMessage.fromAccount == "${userAccount}"){
	 		$(p).addClass("p1-from");
			$(p).append( msgSpan +"<br>"+ dateTimeSpan )
	 	} else {
	 		$(p).addClass("p1-to");
	 		img = "<img src='/image/user/member/"+ toMemberPic +"' class='userImg' />";
    		$(p).append(img + msgSpan +"<br>" +dateTimeSpan)
	 	}
	 	$('#response'+toAccount).append(p);    	 	
	 	lastMsg = chatMessage;
	})
	if(lastMsg != null && lastMsg.readAlready=="Y" 
			&& (lastMsg.toAccount == toAccount || lastMsg.fromAccount == "${userAccount}") ){
		$('#response'+toAccount).append($("<p class='p1-from readAlready' id='readAlready"+toAccount+"' ><img src='/img/readAlready.png' width='17px'/></p>"));    	 
 	}

}




</script>