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
		$('.text').val("");
	}	
}
		
function showMessageOutput(chatMessage, changeMemberBoxText) {	
	console.log(chatMessage)
	var fromAccount = chatMessage.fromAccount;
	console.log("fromAccount="+fromAccount)
	if (chatMessage.readAlready == "Y"){
		$("#readAlready"+fromAccount).remove();
		$('#response'+fromAccount).append($("<p class='p1-from readAlready' id='readAlready'"+fromAccount+"' ><img src='/img/success.png' /></p>"));	 
	} else {
		var toMemberPic = $('#response'+fromAccount+" .p1-to>img").get(0).src;
		console.log("toMemberPic")
		console.log(toMemberPic)
		var m = new Date(chatMessage.time);
		var dateTime = m.getHours() + ":" + m.getUTCMinutes();		
	 	var p = $("<p></p>");
	 	$(p).css("wordWrap","break-word");
	 	var toImg = "<img src='"+ toMemberPic +"' class='userImg' />";
	 	var msgSpan = "<p class='msgSpan'>"+chatMessage.text+"</p>";
	 	var dateTimeSpan ="<p class='dateTimeSpan'>"+dateTime+"</p>"; 	 ;
	 	$(p).addClass("p1-to");
	 	$(p).append(toImg + msgSpan + dateTimeSpan);
		$('#response'+fromAccount).append(p);    	
	}
	$('#box'+fromAccount).animate({ scrollTop: $("#response"+fromAccount).height() }, 1);
	    	 	
	//此頁面若是所有訊息頁面須隨時改變MemberBox順序
// 	if (changeMemberBoxText=="Y"){
//  		$('#box-chatPage').animate({ scrollTop: $("#response").height() }, 1);    
//  		if (to != $("#chatterName").text()){			
// 			var chatMemberBoxMember = $("#chatMemberBox"+to).get(0);
// 			console.log(chatMemberBoxMember);
// 			$(chatMemberBoxMember).remove();
// 			$( ".item2-2" ).prepend(chatMemberBoxMember);
// 			$("#chatMemberBox"+to+">div.chat-info > div:nth-child(3)").text(chatMessage.text);
// 			$("#chatMemberBox"+to+">div.chat-info > div:nth-child(2)").text(m.format("yyyy-MM-dd"));		 	
// 		}		
//  	} else{
//  		$('#box').animate({ scrollTop: $("#response").height() }, 1);
//  	}	
}


function disconnect(toAccount) {
	if (stompClient != null) {
// 		stompClient.disconnect(); //斷開連接
		$.ajax({
			url:"/user/chatMessage/stompClientConnection/session/clear",
		})
		$("#chatbox"+toAccount+" button").unbind();
// 		$("#chatbox"+toAccount).remove();
	}
	connected = false; 
	visible = false;
	console.log("Disconnected");
}

// function setSendToObject(toAccount, toName){
// 	$("#toAccount").text(toAccount);
// 	$("#toName").text(toName);
// 	$("#chatBoxDiv").on("click","#sendMessage",function(){
// 		sendMessage(toAccount,"N");
// 	})
	
// }

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
		$('#response'+toAccount).append($("<p class='p1-from readAlready' id='readAlready"+toAccount+"' ><img src='/img/success.png' /></p>"));    	 
 	}

}




</script>