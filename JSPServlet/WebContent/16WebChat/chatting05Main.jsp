<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>chatting05Main.jsp</title>
</head>
<body>
	<script>
	function chatWin05(){
		var id = document.getElementById("chat_id");
		var room = document.getElementById("chat_room");
		if(id.value==""){
			alert("닉네임을 입력 후 채팅창을 열어주세요");
			id.focus();
			return;
		}
	
		window.open("chatting05.jsp?chat_id="+id.value+"&chat_room="+room.value,"","width=500,height=700");
		id.value="";
	}
	</script>
	<h2>웹소켓04 - 아이디 적용해서 채팅창 띄워주기</h2>
	채팅방 :
	<!-- select#chat_room>option*5 -->
	<select name="" id="chat_room">
		<option value="1번방">1번방</option>
		<option value="2번방">2번방</option>
		<option value="3번방">3번방</option>
		<option value="4번방">4번방</option>
		<option value="5번방">5번방</option>
	</select>
	&nbsp;&nbsp;&nbsp;
	아이디: <input type="text" id="chat_id"/>
	<button type="button" onclick="chatWin05();">채팅창열기</button>
</body>
</html>