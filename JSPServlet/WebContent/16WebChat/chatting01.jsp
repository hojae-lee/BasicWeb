<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>웹소켓채팅01</title>

</head>
<body>
	<fieldset style="width:350px; text-align: center">
		<legend>채팅창</legend>
		<input type="text" id="inputMessage" style="width:300px; margin-bottom: 5px;"/>
		<br />
		<input type="button" onclick="sendMessage();" value="보내기"/>
		<input type="button" onclick="disconnect();" value="채팅종료"/>
		<br />
		<textarea name="" id="messageWindow"  style= "width:300px; height: 400px; margin-top: 10px;" readonly></textarea>
	</fieldset>
	
	<script>
	/*
	JS의 WebSocet객체를 이용해서 웹소켓서버에 연결한다. 웹소켓이므로 ws://으로 시작된다.
	마지막 경로에는 @ServerEndPoint 어노테이션에 지정된 이름을 사용한다.
	*/
	var webSocket = new WebSocket("ws://localhost:8080/K06JSPServlet/ChatServer01");
	var messageWindow = document.getElementById("messageWindow");
	
	messageWindow.value = "";
	var message = document.getElementById("inputMessage");
	
	//웹소켓이 연결되었을때 호출되는 이벤트
	webSocket.onopen = function(message){
		messageWindow.value += "서버연결됨\n";
	};
	
	//웹소켓이 닫혔을때 호출되는 이벤트
	webSocket.onclose = function(message){
		messageWindow.value += "서버종료됨\n";
	};
	
	//웹소켓에서 에러가 발생되었을떄 호출되는 이벤트
	webSocket.onerror = function(message){
		messageWindow.value += "채팅중에러발생\n";
	};
	
	//웹소켓에서 메세지가 전송되었을 때 호출되는 이벤트
	webSocket.onmessage = function(message){
		messageWindow.value += "서버에서수신=>"+message.data+"\n";
	};
	
	//보내기 버튼을 눌렀을떄 입력한 메세지를 서버로 전송해주는 메소드
	function sendMessage(){
		var message = document.getElementById("inputMessage");
		messageWindow.value += "서버로전송 =>"+message.value+"\n";
		webSocket.send(message.value);
		message.value="";
	}
	
	//웹소켓 종료
	function disconnect(){
		webSocket.close();
	}
	</script>
	
</body>
</html>