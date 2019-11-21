<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JQ14TextHtml.jsp</title>
<script src="../jquery/jquery-3.4.1.js" ></script>
<script>
$(function(){
	/*
	text()
		:JS의 innerText()와 동일하게 시작태그아 종료태그사이의 text를 읽어오거나 설정하는 메소드
		태그선택자를 통해 선택하는 경우 "모든" 엘리먼트를 다 가져오게 된다.
	html()
		:JS의 innerHTMl()과 동일하게 태그사이의 html태그를 해석하여 읽어오거나 설정하는 메소드
		태그선택자를 사용하는 경우 '첫번째' 엘리먼트만 읽어오게 된다.
	*/
	$('#btn1').click(function(){
		alert($('div').text());
	});
	$('#btn2').click(function(){
		alert($('div').html());
	});
	$('#btn3').click(function(){
		var txt1 = $('div:first').text();
		alert(txt1);
		
		$('div:first').text('<h2>new div1입니다.</h2>');
	});
	
	$('#btn4').click(function(){
		var txt2 = $('div:last').prev().text();
		alert(txt2);
		
		$('div:last').prev().html('<h2>new div4입니다.</h2>');
	});
});
</script>
</head>
<body>
	<h2>text() / html() 메소드</h2>
	
	<div>div1입니다.</div>
	<div>div2입니다.</div>
	<div>div3입니다.</div>
	<div>div4입니다.</div>
	
	<div>
		<button id="btn1">text()로 읽어오기</button>
		<button id="btn2">html()로 읽어오기</button>
		<button id="btn3">text()로 설정하기</button>
		<button id="btn4">html()로 설정하기</button>
	</div>
</body>
</html>