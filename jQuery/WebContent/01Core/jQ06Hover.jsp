<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jQ06Hover.jsp</title>
<script src="../jquery/jquery-3.4.1.js"></script>
<script>
$(document).ready(function () {
	/* 
	hover() : bind()메소드처럼 over, out 이벤트를 각각 부여하지 않고
		두가지 이벤트를 한번에 부여할때 사용함.
		첫번째 함수가 over, 두번째 함수가 out을 처리한다.
	*/
	
	/* 
	※메소드 체인 : jQuery에서는 함수를 .으로 계속적으로 연결해서 사용할수 있는데
		이를 메소드 체인이라 표현한다. 함수를 체인처럼 연결한다고 해서 이처럼
		부른다.
	*/
	$("img").hover(
		function () {
			$(this).css({'width':'300px'
				,'height':'400px'
				,'border':'3px solid black'});
		},		
		function () {
			/* 
			
			*/
			$(this).css('width','100px')
				.css('height','150px')
				.css('border','5px dotted yellow');
		}
	);
});
</script>
</head>
<body>
	<h2>hover() 메소드</h2>
	
	<h3>마우스 오버/아웃으로 이미지크기 조절하기</h3>
	
	<img src="../images/7.jpg" alt="행운의7" />
	
</body>
</html>