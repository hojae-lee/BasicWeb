<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isErrorPage = "true"
    %>
    <%--
    	isErrorPage 페이지 지시어
    	: 에러를 실제로 처리할 페이지에서 선언한다. 기본값은 false이나 에러처리를 위해서는 true로 설정해야 한다.
     --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ErrorPage.jsp</title>
</head>
<body>
	<h2>에러발생됨 : 관리자에게 문의하세요</h2>
	<h3>연락처 : 010-1234-5678</h3>
	<h3>서버업그레이드중입니다.</h3>
	<%--
		exception 내장객체는 page지시어의 isErrorPage속성이 true인 jsp페이지에서만 사용이 가능하다.
		사용빈도가 그리 높지는 않다.
	--%>
	<h3>
		에러내용 : <%=exception.getMessage() %>
	</h3>
</body>
</html>