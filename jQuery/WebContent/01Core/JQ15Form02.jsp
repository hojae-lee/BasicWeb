<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JQ15Form2.jsp</title>
<script src="../jquery/jquery-3.4.1.js" ></script>
<script>
$(function(){
	$('#submit').click(function(){
		var f = document.getElementById("sForm");
		if(f.user_id.value==""){
			alert("아이디를 입력하세요");
			return false;
		}
		if(f.user_pw.value==""){
			alert("패스워드를 입력하세요");
			return false;
		}
		/*
		<form>태그에 attr()메소드를 이용하여 각각의 속성을 부여한다.
		특히 target속성을 iframe쪽으로 갈수 있도록 설정하였따.
		*/
		$('#sForm').attr('method','post').attr('action','http://ikosmo.co.kr').attr('target','subTarget');
		
	});
});
</script>
</head>
<body>
	<h2>jQuery를 통해 폼값 전송하기</h2>
	
	<form id="sForm">
		아이디 : <input type="text" name ="user_id"/>
		<br />
		패스워드 : <input type="password" name="user_pw"/>
		<br />
		<button type="submit" id="submit">로그인하기</button>
	</form>
	
	<iframe src="" frameborder="1" name="subTarget" style="border:2px solid #000000; width:500px; height: 300px"></iframe>
</body>
</html>