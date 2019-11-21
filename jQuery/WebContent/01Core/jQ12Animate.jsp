<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jQ12Animate.jsp</title>
<script src="../jquery/jquery-3.4.1.js" ></script>
<script>
$(function(){
	/*
	animate(효과,시간) : 선택된 엘리먼트에 애니메이션 효과를 적용한다.
		효과는 jSON으로 작성하여 여러가지를 한꺼번에 부여할수있다.
		두번쨰 인자는 적용되는 시간이다.
	stop() : 애니메이션 효과를 멈춘다.
	*/
	$('#go').click(function(){
		$('div').animate({
			left: '+=100px',
			'opacity':'0.2',
			height:'+=10px'
		}, 'slow');
	});
	$('#stop').click(function(){
		$('div').stop();
	});
	
	$('#back').click(function(){
		$('div').animate({
			left: '-=100px',
			opacity:1,
			height:'-=10px'
		}, '2000');
	});
	$('#start').click(function(){
		$('div').animate({height:'300px', opacity:'0.4'},'slow');
		$('div').animate({width:'300px', opacity:'0.8'},'slow');
		$('div').animate({height:'300px', opacity:'0.4'},'slow');
		$('div').animate({width:'300px', opacity:'0.8'},'slow');
	});
});
</script>
<style>
	div{
		width:70px; height:70px; position:absolute;
		top:100px; left:50px; background-color:red;
	}
</style>
</head>
<body>
	<h2>animate() / stop() 메소드</h2>
	
	<button id="go">GO</button>
	<button id="stop">Stop</button>
	<button id="back">Back</button>
	<button id="start">Animation Start</button>
	
	<div>나는<br />움직인다.</div>
</body>
</html>