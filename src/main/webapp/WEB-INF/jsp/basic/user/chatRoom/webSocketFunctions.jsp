<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="/js/webjar/sockjs.min.js"></script>
<script src="/js/webjar/stomp.min.js"></script>
<script type="text/javascript">
//聊天室的各種function	


function fillChatListIntoResponseBox(chatMsg){
	var lastMsg = null;
	$.each(chatMsg, function(idx, chatMessage){
	 	var img;
		var m = new Date(chatMessage.time);
		var dateTime = m.getHours() + ":" + m.getUTCMinutes() ;		
	 	var p = $("<p></p>");
	 	$(p).css("wordWrap","break-word");
	 	var msgSpan = "<p class='msgSpan'>"+ chatMessage.text +"</p>";
	 	var dateTimeSpan = "<p class='dateTimeSpan'>"+ dateTime + "</p>"; 	
	 
	 	if (chatMessage.toAccount == to || chatMessage.fromAccount == "${userAccount}"){
	 		$(p).addClass("p1-from");
			$(p).append( msgSpan +"<br>"+ dateTimeSpan )
	 	} else {
	 		$(p).addClass("p1-to");
	 		img = "<img src='/image/user/member/"+ toPic +"' class='userImg' />";
    		$(p).append(img + msgSpan +"<br>" +dateTimeSpan)
	 	}
	 	lastMsg = chatMessage;
	 	$('#response').append(p);    	 	
	})
	if(lastMsg != null && lastMsg.readAlready=="Y" 
			&& (lastMsg.toAccount == to || lastMsg.fromAccount == "${userAccount}") ){
		$('#response').append($("<p class='p1-from readAlready'>已讀</p>"));    	 
 	}

}

function sendMessage(readStatus) {	
	if (to != from){	
		var text= $('#text').val();	;
		var readAlready="N";
		console.log("text="+text+", readAlready="+readStatus);		
		if (readStatus =="Y"){
			text = "";
			readAlready= "Y";
		} 
		//連接成功後，客户端可使用 send()方法向服務器發送信息
		stompClient.send("/app/chat", {}, JSON.stringify({	
			'fromAccount':from,
			'toAccount' : to,
			'text' : text,
			'readAlready': readAlready
		}));	
		$('#text').val("");
	}	
}


function showMessageOutput(chatMessage, changeMemberBoxText) {	
	var m = new Date(chatMessage.time);
	var dateTime = m.getHours() + ":" + m.getUTCMinutes();		
 	var p = $("<p></p>");
 	$(p).css("wordWrap","break-word");
 	var msgSpan = "<p class='msgSpan'>"+chatMessage.text+"</p>";
 	var dateTimeSpan = dateTimeSpan= "<p class='dateTimeSpan'>"+dateTime+"</p>"; 	 ;
 	
 	if (chatMessage.toAccount == to || chatMessage.fromAccount == '${userAccount}'){
 		$(".readAlready").remove();
 		$(p).addClass("p1-from");
		$(p).append(msgSpan +"<br>"+ dateTimeSpan);
 	} else if (chatMessage.fromAccount == to || chatMessage.toAccount == '${userAccount}'){
 		$(p).addClass("p1-to");
 		img = "<img src='/image/user/member/"+ toPic +"' class='userImg' />";
		$(p).append(img + msgSpan +"<br>"+ dateTimeSpan);
 	}

 	$('#response').append(p);	    	 	
	$("#text").val("");
	if (changeMemberBoxText=="Y"){
 		$('#box-chatPage').animate({ scrollTop: $("#response").height() }, 1);    
 		if (to != $("#chatterName").text()){			
			var chatMemberBoxMember = $("#chatMemberBox"+to).get(0);
			console.log(chatMemberBoxMember);
			$(chatMemberBoxMember).remove();
			$( ".item2-2" ).prepend(chatMemberBoxMember);
			$("#chatMemberBox"+to+">div.chat-info > div:nth-child(3)").text(chatMessage.text);
			$("#chatMemberBox"+to+">div.chat-info > div:nth-child(2)").text(m.format("yyyy-MM-dd"));		 	
		}		
 	} else{
 		$('#box').animate({ scrollTop: $("#response").height() }, 1);
 	}	
}


function disconnect() {
	if (stompClient != null) {
		stompClient.disconnect(); //斷開連接
	}
	connected = false; 
	visible = false;
	console.log("Disconnected");
}



</script>