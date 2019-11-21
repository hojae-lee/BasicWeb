<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jQ04Trigger.jsp</title>
<script src="../jquery/jquery-3.4.1.js"></script>
<script>
	$(document).ready(function () {
		
		/* 
		사용자가 해당 버튼을 클릭할때 발생되는 이벤트
		*/
		$('#btnClick').bind("click", function () {
			alert('버튼을 클릭하셨습니다.');
		});
		
		/* 
		문서가 로딩될때 자동으로 click이벤트를 실행시킨다. 즉, 선택지를 통해
		해당 버튼을 클릭한것과 동일한 효과를 발생시키게 된다.
		*/
		$('#btnClick').trigger('click');
	});
</script>
</head>
<body>
	<h2>trigger()메소드</h2>
	<button id="btnClick">난 버튼</button>
</body>
</html>