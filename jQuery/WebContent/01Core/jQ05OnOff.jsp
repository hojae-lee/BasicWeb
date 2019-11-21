<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jQ05OnOff.jsp</title>
<script src="../jquery/jquery-3.4.1.js"></script>
<script>
$(document).ready(function () {
	
	/*
	on() : bind()메소드와 동일하게 엘리먼트에 이벤트를 부여할때 사용한다.
		그리고 동적으로 추가된 엘리먼트에도 이벤트를 부여할수 있다.
	off() : on()으로 부여한 이벤트를 제거하는 역할을 한다.
	*/
	$('#div1').on('click', function () {
		alert('클릭이벤트 발생됨');
		/* 
		after() : 매개변수로 주어진 컨텐츠를 해당 엘리먼트 다음에 추가한다.
		*/
		$(this).after("<div style='background-color:green;'>동적으로 생성한 div</div>");	
	});
	
	/* 
	"onMethod" 엘리먼트에 click이벤트를 부여한다. 처을 클릭했을때는 경고창이 뜨게 된다.
	'#offMethod'엘리먼트를 누르면 이벤트가 해제되므로 "onMethod"를 다시 눌렀을때는
	아무런 이벤트도 발생하지 않는다.
	*/
	$("#onMethod").on("click", function () {
		//click이벤트 부여함
		alert("#onMethod 버튼이 클릭되었습니다.")
	});
	
	$('#offMethod').on('click', function () {
		//click이벤트 해제함
		$('#onMethod').off('click');
		alert("#onMethod의 click이벤트가 해제되었습니다,");
	});
	
	
	$(".div2 button").on("click",function(){
		/* 
		append() : 매개변수의 내용을 현재 선택된 엘리먼트 뒷부분에 추가한다.
		*/
		$(".div2 ul").append("<li>추가된 li태그</li>");
	});
	
	/* 
	동적으로 생성한(즉, 코드상으로는 존재하지 않는 엘리먼트) div에는 click이벤트를
	bind() 할수 없다. 하지만 on()메소드를 통해서는 이벤트를 부여할 수 있다.
	*/
	$(".div2").on("click","li",function(){
		$(this).css("color","red").css("fontSize", "1.8em");
	});
});
</script>
<style>
	div{
		width: 200px; height: 50px; margin: 20px;
	}
</style>
</head>
<body>
	<h2>on() / off() 메소드</h2>
	
	<div id="div1" style="background-color: red;">
		미리 생성한 div (요기를 눌러보삼)
	</div>
	
	<button id="onMethod">on()메소드 호출</button>
	<button id="offMethod">off()메소드 호출</button>
	
	<div class="div2">
		<button>아이템 추가하기</button>
		<ul>
			<li>기존아이템1</li>
			<li>기존아이템2</li>
		</ul>
	</div>
</body>
</html>