<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>   
<!-- chattingBox.jsp is included in footer -->



<sec:authentication property="name" var="userAccount"/>
<script type="text/javascript">
	var stompClient = null;
	var connected = false; 
	var visible = false;

	
		
	

	$(document).ready(function(){
		//將指定的按鈕綁上click事件(頁面中的'與我聯絡'按鈕的id都是chatButton)
		$("#chatButton").on("click",function(){
			startToChat();
		})
		if ('${userAccount}' != null || '${userAccount}' != undefined){
			connect();
		}
	})
	
	//建立聊天室窗並載入聊天紀錄
	function createChatBox(toAccount,toName){
		if (toAccount != "${userAccount}"){
			var chatBox = '<div class="chatbox" id="chatbox'+toAccount+'"><div onclick="changeMessageStatus(\''+toAccount+'\')" >';
			chatBox +='<div class="btn btn-primary btn-sm connect" >';
			chatBox +='<div id="connect'+toAccount+'" onclick="conversationDivDisplay(\''+toAccount+'\')" style="display:inline-block;width:80%">';
			chatBox += '<span>'+toName+'</span><img style="display:none" /></div>';
			chatBox +='<button type="button" data-dismiss="modal"  aria-label="Close" class="close" onclick="closeChatBox(\''+toAccount+'\')"  aria-hidden="true">×</button>';
			chatBox +='</div><div class="conversationDiv">';
			chatBox +='<div id="box'+toAccount+'" class="responsebox"><p id="response'+toAccount+'"></p></div>';
			chatBox +='<div id="quickButtonDiv'+toAccount+'" style="text-align:left;margin-bottom: 10px;">';
			chatBox +='<button class="btn btn-primary btn-sm quickButton" onclick="sendBoxMessage()" >Hi~</button>';
			chatBox +='<button class="btn btn-primary btn-sm quickButton" onclick="sendBoxMessage()" >你好</button>';
			chatBox +='<button class="btn btn-primary btn-sm quickButton" onclick="sendBoxMessage()" >謝謝!</button></div>';
			chatBox +='<div style="text-align:left">';
			chatBox +='<input type="text" id="text'+toAccount+'" class="chattext" placeholder="請輸入訊息" />';
			chatBox +='<button class="btn btn-primary btn-sm sendMessage" onclick="sendText(\''+toAccount+'\')" >Send</button>';
			chatBox +='</div></div></div>';		
			$("#chatBoxDiv").append(chatBox);

			//從資料庫中取出聊天室過往的訊息紀錄
			$.ajax({
				url:"/user/chatMessage/oldMessages/onePerson/query",
				type: "post",
				data: {"toAccount":toAccount, "fromAccount":'${userAccount}'},
			    dataType : "json",	
		    }).done(function(mapObj){		    	
		    	connected = true;
		    	visible = true;
		    	$("#chatbox"+toAccount).css("display","block");
		    	$("#connect"+toAccount+" img").attr("src","/image/user/member/"+mapObj.toMemberPic);
		    	fillChatListIntoResponseBox(toAccount,mapObj.toMemberPic,mapObj.chatList);     	
		    	$('#box'+toAccount).animate({ scrollTop: $("#response"+toAccount).height() }, 1);    	    	 	
			 	$("#text"+toAccount).val("");  	
		   }).fail(function (jqXHR, textStatus) {
			   	connected = false;
		    	$("#login-modal").addClass("modal fade show");
			   	$("#login-modal").css("display","block");
			   	$("#login-modal").css("padding-right","17px");
				$("#action").val("chatting");
		    });
		}		
	}
	
	function changeMessageStatus(toAccount){
		var responseLastChildClass = $("#response"+toAccount +"> p:last-child").attr("class");
		if (responseLastChildClass == 'p1-to'){
			sendMessage(toAccount,"Y");
		}
		
	}

	function closeChatBox(toAccount){
		$("#chatbox"+toAccount).hide();	
// 		$.ajax({ //clear session toAccount
//  			url:"/user/chatMessage/stompClientConnection/session/clear?toAccount="+toAccount,
// 		})
 		$("#chatbox"+toAccount).remove();
	}
	
	function conversationDivDisplay(toAccount){
		if ($("#chatbox"+toAccount).css("bottom") == '2px'){
			$("#chatbox"+toAccount).css("bottom","-300px");
		} else {
			$("#chatbox"+toAccount).css("bottom","2px");
		}
	}
	
	function sendBoxMessage(){
		var toAccount = $(event.target).get(0).offsetParent.id.substring(7);
		var text = $(event.target).parent().prevObject.get(0).innerText;	
		$('#text'+toAccount+'').val(text);	
		sendMessage(toAccount,"N")
	}	
	

	function sendText(toAccount){
		sendMessage(toAccount,"N")
	}

	
	function showMessageOutput(chatMessage) {	
		console.log(chatMessage)
		if (chatMessage.unreadMessageCount == 0){	
		}else if(chatMessage.unreadMessageCount == 1){
			$("#navigation > ul > li:nth-child(5) > a > div").html('<img src="/img/1.png" style="width:20px" />');
		}else if(chatMessage.unreadMessageCount == 2){
			$("#navigation > ul > li:nth-child(5) > a > div").html('<img src="/img/2.png" style="width:20px"/>');
		}else if(chatMessage.unreadMessageCount == 3){
			$("#navigation > ul > li:nth-child(5) > a > div").html('<img src="/img/3.png" style="width:20px"/>');
		}else if(chatMessage.unreadMessageCount == 4){
			$("#navigation > ul > li:nth-child(5) > a > div").html('<img src="/img/4.png" style="width:20px"/>');
		}else if(chatMessage.unreadMessageCount == 5){
			$("#navigation > ul > li:nth-child(5) > a > div").html('<img src="/img/5.png" style="width:20px"/>');
		}else if(chatMessage.unreadMessageCount >= 6){
			$("#navigation > ul > li:nth-child(5) > a > div").html('<img src="/img/5+.png" style="width:20px" />');
		}
		var fromAccount = chatMessage.fromAccount;
		console.log("fromAccount="+fromAccount)
		var toMemberPic = $("#connect"+fromAccount +" img").attr("src");
		if (chatMessage.readAlready == "Y"){
			$("#readAlready"+fromAccount).remove();
			$('#response'+fromAccount).append($("<p class='p1-from readAlready' id='readAlready"+fromAccount+"' ><img src='/img/readAlready.png' width='17px'/></p>"));	 
		} else {
			var toMemberPic = $("#connect"+fromAccount +" img").attr("src");
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
	}
	


</script>
<jsp:include page="webSocketFunctions.jsp"></jsp:include>
	
	<div id="chatBoxDiv"></div>    

	    <c:if test="${stompClientConnection eq 'Y'}">
<%-- 	    	<c:forEach items="${chatMemberList}" var="chatMember"> --%>
				<script>
// 					createChatBox('${chatMember.account}','${chatMember.name}');
	 			</script>  		
<%-- 	    	</c:forEach> --%>			 
		</c:if>
	

