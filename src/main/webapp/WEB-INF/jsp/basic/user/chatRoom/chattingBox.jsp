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
		
	})
	
	
	function conversationDivDisplay(toAccount){
		if (!visible){
			visible = true;
			$("#chatbox"+toAccount).css("bottom","2px");
		} else {
			visible = false;
			$("#chatbox"+toAccount).css("bottom","-324px");
		}
	}

	function connect(toAccount,toName) {
		if (!connected){
			var chatBox = '<div id="chatbox'+toAccount+'" class="chatbox" style="display:none" onload="disconnect()" >';
	// 		chatBox += '<span id="toAccount" style="display:none"> </span>';
			chatBox +='<div id="connect"  class="btn btn-primary btn-sm connect"   >';
			chatBox +='<div onclick="conversationDivDisplay('+toAccount+');" style="display:inline-block;width:80%">';
			chatBox += '<span>'+toName+'</span></div>';
			chatBox +='<button type="button" data-dismiss="modal"  aria-label="Close" class="close"><span aria-hidden="true" >×</span></button>';
			chatBox +='</div><div class="conversationDiv">';
			chatBox +='<div id="box'+toAccount+'" class="responsebox"><p id="response'+toAccount+'"></p></div>';
			chatBox +='<div id="quickButtonDiv" style="text-align:left;margin-bottom: 10px;">';
			chatBox +='<button class="btn btn-primary btn-sm quickButton" >Hi~</button>';
			chatBox +='<button class="btn btn-primary btn-sm quickButton" >你好</button>';
			chatBox +='<button class="btn btn-primary btn-sm quickButton" >謝謝!</button></div>';
			chatBox += '<div id="quickButtonDiv" style="text-align:left;margin-bottom: 10px;">';
			chatBox +='<input type="text" id="text" class="text" placeholder="請輸入訊息" />';
			chatBox +='<button id="sendMessage" class="btn btn-primary btn-sm sendMessage">Send</button>';
			chatBox +='</div></div></div>';		
			$("#chatBoxDiv").append(chatBox);
		
			var toMemberPic ;
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
		    	toMemberPic = mapObj.toMemberPic;
		    	fillChatListIntoResponseBox(toAccount,mapObj.toMemberPic,mapObj.chatList);     	
		    	$('#box'+toAccount).animate({ scrollTop: $("#response"+toAccount).height() }, 1);    	    	 	
			 	$(".text").val("");  	
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
				//STOMP客户端必須先訂閲相應的URL("/topic/chat/single/'+使用者帳號")，才能不斷接收來自服務器的推送消息
				//訂閱後，只要服務端向此地址發送消息，客戶端即可收到此消息
				stompClient.subscribe('/topic/chat/single/${userAccount}', function(messageOutput) {	
					//收到消息時的回調方法
					var chatMessage = JSON.parse(messageOutput.body);			
					showMessageOutput(chatMessage,toMemberPic,"N");					
				 	$('#box'+toAccount).animate({ scrollTop: $("#response"+toAccount).height() }, 1);
				});
			});	
			$("#chatBoxDiv").on("click","#chatbox"+toAccount+" .close",function(){
				$("#chatbox"+toAccount).hide();
				if (connected){
					disconnect(toAccount);
// 					$('#response'+toAccount).html("");    	
				}
			})
			$("#chatBoxDiv").on("click","#chatbox"+toAccount+" .quickButton",function(){
				var text = $(this).html();
				console.log(text);
				$('#text').val(text);	
				sendMessage(toAccount,"N")
			})
			$("#chatBoxDiv").on("click","#chatbox"+toAccount, function(){
				sendMessage(toAccount,"Y");
			})
		}
	}
	

// 	function closeChatBox(){
// 		var toAccount = $(this);
// 		console.log(toAccount)
// 		var chatboxId = "#chatbox"+toAccount
// 		$(chatboxId).hide();
// 		if (connected){
// 			disconnect();
// 			$('#response'+toAccount).html("");    	
// 		}

// 	}

	function sendBoxMessage(toAccount){
		var text = $(this).html();
			console.log(toAccount);
//			$('#text').val(text);	
//			sendMessage(toAccount,"N")
	}


</script>
<jsp:include page="webSocketFunctions.jsp"></jsp:include>
	
	<div id="chatBoxDiv">
<!-- 		<div id="chatbox" class="chatbox" style="display:none" onload="disconnect()" > -->
<!-- 			<span id="toAccount" style="display:none"></span> -->
<!-- 			<div  id="connect"   class="btn btn-primary btn-sm connect"   > -->
<!-- 				<div onclick="conversationDivDisplay();" style="display:inline-block;width:80%"><span id="toName"></span></div> -->
<!-- 				<button type="button" data-dismiss="modal" aria-label="Close" class="close" onclick="closeChatBox()"><span aria-hidden="true" >×</span></button> -->
<!-- 			</div> -->
<!--         	<div id="conversationDiv" class="conversationDiv"> -->
<!--         		<div id="box" class="responsebox"> -->
<!-- 					<p id="response"></p> -->
<!-- 				</div> -->
<!-- 				<div id="quickButtonDiv" style="text-align:left;margin-bottom: 10px;"> -->
<!-- 					<button class="btn btn-primary btn-sm quickButton" >Hi~</button> -->
<!-- 					<button class="btn btn-primary btn-sm quickButton" >你好</button> -->
<!-- 					<button class="btn btn-primary btn-sm quickButton" >謝謝!</button> -->
<!-- 				</div> -->
<!-- 				<input type="text" id="text" class="text" placeholder="請輸入訊息" /> -->
<!-- 				<button id="sendMessage" class="btn btn-primary btn-sm sendMessage">Send</button> -->
<!-- 			</div> -->
<!-- 	    </div> -->
	</div>    

<%-- 	    <c:if test="${stompClientConnection eq 'Y'}"> --%>
			<script>
// 				$("#chatbox${toMember.account}").css("display", "block");				
// 				connect('${toMember.account}', '${toMember.name}');		
// 				connected = true;
			</script> 
			 
<%-- 		</c:if> --%>
	

