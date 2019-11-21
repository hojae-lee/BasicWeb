<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width; initial-scale=1.0">
<title>채팅윈도우</title>
<link rel="stylesheet" href="css/default.css"/>
<script type="text/javascript">

</script>
</head>
<body>
<div id="chat-wrapper">
	<header id="chat-header">
		<h1>채팅창 - 최강KOSMO44기</h1>
	</header>
		
	<input type="hid-den" id="chat_id" value="낙자사발" style="border:1px dotted red;" />
	<div id="chat-container" class="chat-area" style="height:500px;overflow:auto;">
	<% for(int i=1 ; i<=30 ; i++){ %>
		<!-- 왼쪽 채팅 -->
		<div class="chat chat-left">
			<!-- 프로필 이미지 -->
			<span class="profile profile-img-b"></span>
			<div class="chat-box">
				<p style="font-weight:bold;font-size:1.1em;margin-bottom:5px;">미르</p>
				<p class="bubble">낙자<br/>뭐해?</p>
				<span class="bubble-tail"></span>
			</div>
		</div>
		<!-- 오른쪽 채팅 -->
		<div class="chat chat-right">
			<!-- 프로필 이미지 -->
			<span class="profile profile-img-a"></span>
			<div class="chat-box">				
				<p class="bubble-me">그냥 쉬고있는 중ㅋ</p>
				<span class="bubble-tail"></span>
			</div>
		</div>
	<% } %>			
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