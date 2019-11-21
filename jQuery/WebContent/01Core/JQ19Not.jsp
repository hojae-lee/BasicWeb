<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JQ19Not.jsp</title>
<script src="../jquery/jquery-3.4.1.js" ></script>
<script>
$(function(){
	$('#IblTxt1').css({'backgroundColor':'yellow'}).text('여긴 href라벨입니다.');
	$('#IblTxt2').css({'backgroundColor':'green'}).text('여긴 text라벨입니다.');
	
	/*
	not()메소드 : 선택자로 선택한 요소를 제외한 나머지 요소를 가져올때 사용하는 메소드
	
	선택자로 사용할떄의 정규표현식
		$:xx문자열로 끝나는 요소
		^:xx문자열로 시작하는 요소
		*:xx문자열이 포함된 요소
	*/
	$('#btn').click(function(){
		var str1="",str2="";
		$('a').not('a[href$="jsp"]').each(function(){
			str1 += $(this).attr("href")+" ";
			str2 += $(this).text() + " ";
		});
		$('#IblTxt1').text(str1);
		$('#IblTxt2').text(str2);
	});
	
});
</script>
</head>
<body>
	<h2>not() 메소드</h2>
	
	<div>
		<a href="https://www.naver.com/">네이버</a>
		<a href="https://www.daum.net/">다음</a>
		<a href="jQ12Animate.jsp">내부페이지로이동</a>
		<a href="http://www.ikosmo.co.kr/">kosmo</a>
		<br />
		<span id="IblTxt1"></span>
		<br />
		<span id="IblTxt2"></span>
		<br />
		<button id="btn">확인</button>
	</div>
</body>
</html>