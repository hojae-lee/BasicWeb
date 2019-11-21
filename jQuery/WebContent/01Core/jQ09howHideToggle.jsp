<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jQ09howHideToggle.jsp</title>
<script src="../jquery/jquery-3.4.1.js" ></script>
<style>
	#title{
		border:1px,solid red; width : 300px; height:50px;
		color: red;
	}
	#content{
		border:1px solid blue; width: 300px; height:300px;
		color: blue;
	}
</style>
<script>
$(function(){
	/*
	show() : 엘리먼트를 보임 처리한다.
	hide() : 엘리먼트를 숨김 처리한다.
	toggle() : 보임/숨김 처리를 번갈아가면서 처리한다.
	※메소드의 인자로 1/1000초단위의 시간을 부여하면 해당 시간만큼 애니메이션효과가 적용된다.
	*/
	
	$('#title').hide(2000);
	$('#content').hide(2000);
	
	$('#btn1').click(function(){
		$('#title').toggle();
	});
	$('#btn1_s').click(function(){
		$('#title').show();
	});
	$('#btn1_h').click(function(){
		$('#title').hide(1000);
	});
	
	$('#btn2').click(function(){
		$('#content').toggle();
	});
	$('#btn2_s').click(function(){
		$('#content').show(2000);
	});
	$('#btn2_h').click(function(){
		$('#content').hide(1000);
	});
	
});
</script>
</head>
<body>
	<h2>show() / hide() / toggle()</h2>
	
	<div>
		<button id="btn1">제목토글</button>
		<button id="btn1_s">제목보임</button>
		<button id="btn1_h">제목숨김</button>
		
		<button id="btn2">내용토글</button>
		<button id="btn2_s">내용보임</button>
		<button id="btn2_h">내용숨김</button>
	</div>
	
	<div id="title">기사제목부분입니다.</div>
	<div id="content">
		기사 내용 부분이니다 <br />
		기사 내용 부분이니다 <br />
		기사 내용 부분이니다 <br />
		기사 내용 부분이니다 <br />
		기사 내용 부분이니다 <br />
		기사 내용 부분이니다 <br />
		기사 내용 부분이니다 <br />
		기사 내용 부분이니다 <br />
		기사 내용 부분이니다 <br />
		기사 내용 부분이니다 <br />
	</div>
</body>
</html>