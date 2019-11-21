<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jQ11FadeInOut.jsp</title>
<script src="../jquery/jquery-3.4.1.js" ></script>
<style>
	div{
		width:100px; height: 100px; display:none;
	}
</style>
<script>
$(function(){
	$('#btn1').click(function(){
		$('#div1').fadeIn();
		$('#div2').fadeIn('slow');
		$('#div3').fadeIn(3000);
	});
	
	$('#btn2').click(function(){
		$('#div1').fadeOut();
		$('#div2').fadeOut('slow');
		$('#div3').fadeOut(3000);
	});
	
	$('#btn3').click(function(){
		$('#div1').fadeToggle();
		$('#div2').fadeToggle('normal');
		$('#div3').fadeToggle(3000);
	});
});
</script>
</head>
<body>
	<h2>fadeIn() / fadeOut() / fadeToggle()</h2>
	
	<p>
		<button id="btn1">페이드인</button>
		<button id="btn2">페이드아웃</button>
		<button id="btn3">페이드토글</button>
	</p>
	
	<div id="div1" style="background-color: red;"></div>
	<div id="div2" style="background-color: blue;"></div>
	<div id="div3" style="background-color: green;"></div>
</body>
</html>