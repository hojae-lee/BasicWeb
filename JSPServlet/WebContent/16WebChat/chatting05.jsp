<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>chatting05.jsp</title>
<link rel="stylesheet" href="css/default.css"/>
<script type="text/javascript">
var mesageWindow;
var inputMessage;
var chat_id;
var webSocket;

window.onload = function(){

    messageWindow = document.getElementById("chat-container");

    inputMessage = document.getElementById('inputMessage');

    chat_id = document.getElementById('chat_id').value;
    //채팅방정보가져오기
    chat_room = document.getElementById('chat_room').value;
    
   	webSocket = new WebSocket("ws://localhost:8080/K06JSPServlet/ChatServer02");

	webSocket.onopen = function(event){
		
	     wsOpen(event);
	};
	   //웹 소켓에서 메세지가 날라왔을 때 호출되는 이벤트
	   webSocket.onmessage = function(event){
	      wsMessage(event);
	};
	   //웹 소켓이 닫혔을 때 호출되는 이벤트
	   webSocket.onclose = function(event){
	      wsClose(event);
	};
	   //웹 소켓이 에러가 났을 때 호출되는 이벤트
	   webSocket.onerror = function(event){
	      wsError(event);
	};
}

	function wsOpen(event){
	    messageWindow.value +="연결성공\n";
	}
    
    function wsMessage(event){
        var message = event.data.split("|");
        
        var room = message[0];//채팅방구분
        var sender = message[1];//보낸사람 아이디
        var content = message[2];//메세지 내용
        
        if(content =="") {
        }
        else {
        	if(chat_room==room){
	            if(content.match("/")){
	            	
	              	if(content.match(("/" + chat_id))){
	              		
		                 var temp = content.replace(("/" + chat_id),"[귓속말]:");
		                 msg = makeBalloon(sender, temp);
		                 messageWindow.innerHTML +=msg;
		                 messageWindow.scrollTop = messageWindow.scrollHeight;
	              	}
	           	}
	           	else{
	              	msg = makeBalloon(sender, content);
	              	messageWindow.innerHTML +=msg;
	             	messageWindow.scrollTop = messageWindow.scrollHeight;
	           	}
        	}
        }
	}
    
	function makeBalloon(id,cont){
		
	     var msg = ' ';
	     msg+='<div class = "chat chat-left">';
	     msg+='   <!--프로필이미지 -->';
	     msg+='     <span class="profile profile-img-b"></span>';
	     msg+='     <div class = "chat-box">';
	     msg+='           <p style="font-weight:bold;font-size:1.1em;margin-bottom:5px;">'+id+ '</p>';
	     msg+='            <p class = "bubble">'+cont + '</p>';
	     msg+='             <span class ="bubble-tail"></span>';
	     msg+='      </div>';
	     msg+='</div>';
	     return msg;
	}
	
	function wsClose(event){
	   messageWindow.value+="연결끊기 성공 \n";
	}
	
	function wsError(event){
	   alert(event.data);
	}
	
   	function sendMessage(){
   		webSocket.send(chat_room+'|'+chat_id+'|'+inputMessage.value);
	      
      	var msg =' ';
   
		msg+='<div class = "chat chat-right">';
		msg+='   <!--프로필이미지 -->';
		msg+='     <span class="profile profile-img-a"></span>';
		msg+='     <div class = "chat-box">';
		msg+='           <p class="bubble-me">'+inputMessage.value +'</p>';
		msg+='           <span class ="bubble-tail"></span>';
		msg+='      </div>';
		msg+='</div>';
		
		messageWindow.innerHTML +=msg;
		inputMessage.value=" ";
		
		messageWindow.scrollTop = messageWindow.scrollHeight;
	}
   	
	function enterkey(){
		if(window.event.keyCode==13){
		   sendMessage();
		}
	}

</script>
</head>
<body>
<div id="chat-wrapper">
   <header id="chat-header">
      <h1>채팅창 - 최강KOSMO51기</h1>
   </header>
      
   <input type="hid-den" id="chat_id" value="${param.chat_id }" style="border:1px dotted red;" />
   <input type="hid-den" id="chat_room" value="${param.chat_room }" style="border:1px dotted red;" />
   <div id="chat-container" class="chat-area" style="height:500px;overflow:auto;">
   <%// for(int i=1 ; i<=30 ; i++){ %>
      <!-- 왼쪽 채팅 -->
   <!--    <div class="chat chat-left">
         
         <span class="profile profile-img-b"></span>
         <div class="chat-box">
            <p style="font-weight:bold;font-size:1.1em;margin-bottom:5px;">미르</p>
            <p class="bubble">낙자<br/>뭐해?</p>
            <span class="bubble-tail"></span>
         </div>
      </div> -->
      <!-- 오른쪽 채팅 -->
      <%-- <div class="chat chat-right">
         <!-- 프로필 이미지 -->
         <span class="profile profile-img-a"></span>
         <div class="chat-box">            
            <p class="bubble-me">그냥 쉬고있는 중ㅋ</p>
            <span class="bubble-tail"></span>
         </div>
      </div>--%>
   <% //} %>         
   </div> 
   <footer id="chat-footer">      
      <p class="text-area">
         <input type="text" id="inputMessage" onkeyup="enterkey();"
            style="width:450px; height:60px; font-size:1.5em; border:0px;" />
         <button type="button" onclick="sendMessage();">보내기</button>
      </p>
   </footer>
</div>
</body>
</html>