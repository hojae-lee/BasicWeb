<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>웹소켓채팅03</title>

</head>
<body>
<!-- 
	웹브라우저에 접속한 클라이언트의 세션아이디 저장 차후 회원제
	웹어플리케이션에서는 회원아이디로 대체하면 됨. -->
	<input type="text" id="chat_id" value="${param.chat_id }" style="border:1px dotted red;"/>
	<fieldset style="width:350px; text-align: center">
		<legend>채팅창</legend>
		<input type="text" id="inputMessage" style="width:300px; margin-bottom: 5px;"/>
		<br />
		<input type="button" onclick="sendMessage();" value="보내기"/>
		<input type="button" onclick="disconnect();" value="채팅종료"/>
		<br />
		<textarea name="" id="messageWindow"  style= "width:300px; height: 400px; margin-top: 10px;" readonly></textarea>
		<br />
		<span style="color:red;">귓속말 : /닉네임 대화내용</span>
	</fieldset>
	
	<script>
	/*
	JS의 WebSocet객체를 이용해서 웹소켓서버에 연결한다. 웹소켓이므로 ws://으로 시작된다.
	마지막 경로에는 @ServerEndPoint 어노테이션에 지정된 이름을 사용한다.
	*/
	//대화가 디스플레이 되는 영역
	var messageWindow = document.getElementById("messageWindow");
	//대화를 입력하는 부분
	var inputMessage = document.getElementById("inputMessage");
	//접속자ID를 가져오는 부분
	var chat_id = document.getElementById("chat_id").value;
	
	var webSocket = new WebSocket("ws://localhost:8080/K06JSPServlet/ChatServer02");
		
	//웹소켓이 연결되었을때 호출되는 이벤트
	webSocket.onopen = function(event){
		wsOpen(event);
	};
	
	//웹소켓에서 메세지가 전송되었을 때 호출되는 이벤트
	webSocket.onmessage = function(event){
		wsMessage(event);
	};
	
	//웹소켓이 닫혔을때 호출되는 이벤트
	webSocket.onclose = function(event){
		wsClose(event);
	};
	
	//웹소켓에서 에러가 발생되었을떄 호출되는 이벤트
	webSocket.onerror = function(event){
		wsError(event);
	};
	
	function wsOpen(event){
		messageWindow.value += "연결성공\n";
	}
	
	//채팅서버가 메세지를 받은후 클라이언트에게 재전송할떄 사용
	function wsMessage(event){
		//서버로부터 전송된 메세지를 |구분자로 split분리 한다.
		var message = event.data.split("|");
		//첫번쨰 부분은 전송한 사람의 아이디
		var sender = message[0];
		//두번쨰 부분은 메세지
		var content = message[1];
		
		if(content ==""){
			//전송된 메세지가 없다면 아무것도 하지 않는다.
		}
		else{
			if(content.match("/")){
				if(content.match(("/"+chat_id))){
					var temp = content.replace(("/"+chat_id),"[귓속말]:");
					messageWindow.value += sender+""+ temp + "\n";
				}
			}
			else{
			//내용이 있는 경우에만 메세지창에 추가한다.
			messageWindow.value += sender+":"+ content + "\n";				
			}
		}
	}
	
	function wsClose(event){
		messageWindow.value += "연결끊기성공\n";
	}
	function wsError(event){
		alert(event.data);
	}
	//보내기 버튼을 눌렀을떄 입력한 메세지를 서버로 전송해주는 메소드
	function sendMessage(){
		messageWindow.value += "나(me): "+ inputMessage.value + "\n";
		/*
		내 접속자아이디와 입력메세지를 파이프기호로 문자열로 연결한후 send()메소드를 통해
		서버로 전송한다.
		*/
		webSocket.send(chat_id+"|"+inputMessage.value);
		//메세지 입력창의 내용을 지운다.
		inputMessage.value ="";
	}
	
	</script>
	
</body>
</html>