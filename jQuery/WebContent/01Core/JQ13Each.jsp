<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JQ13Each.jsp</title>
<script src="../jquery/jquery-3.4.1.js" ></script>
<script>
$(function(){
	/*
	each()
		:선택자를 통해 가져온 jQuery의 객체수만큼 반복해주는 메소드
		반복할 때 해당 엘리먼트의 index를 반환하게 되는데 필요없는 경우에는 생략가능하다.
		index는 0부터 시작한다. 
	*/
	$('#btn1').click(function(){
		$('div').each(function(index){
			/*
			attr()
				:DOM요소의 속성에 속성값을 부여하거나 속성을 읽어올때 사용한다. 
				아래코드는 id속성과 style속성을 부여하고 있다.
			*/
			$(this).attr({
				'id' : 'div'+index,
				style: 'border:1px solid red; width:100px; height:100px'
			});
		});
	});
	
	$('#btn2').click(function(){
		alert($('#div0').text()); 
		alert($('#div1').text());
		alert($('#div2').text());
	});
});
</script>
</head>
<body>
	<h2>each() 메소드</h2>
	<div>index:0 -> div1</div>
	<div>index:1 -> div2</div>
	<div>index:2 -> div3</div>
	
	<button id="btn1">div에 style적용하기</button>
	<button id="btn2">index의 text()</button>
</body>
</html>