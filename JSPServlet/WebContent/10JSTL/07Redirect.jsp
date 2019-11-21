<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>07Redirect.jsp</title>
</head>
<body>
<!-- 
	redirect방식으로 새로운 페이지에 대한 요청이므로 request영역은 공유되지 않는다.
	절대경ㄹ로 설정시 url속성에 컨텍스트 루트는 제외한다.
	단 JSP내장객체의 response의 sendRedirect()로 이동하는 경우에는 컨텍스트 루트를 포함해야 한다.
 -->
	<c:set var="requestVar" value="리퀘스트영역저장" scope="request" />
	<%
	/* 
		영어와 숫자를 제외한 나머지 문자들에 대해서 쿼리스트링(Get방식)으로 값을 전달할때는 깨짐현상이
		발생할수 있으므로 아래와 같이 인코딩 처리 후 전달하는 것이 좋다.
	*/
	%>
	
	<h3>자바 코드로 리다이렉트</h3>
	
	<%-- <%
	response.sendRedirect(request.getContextPath() + 
			"/10JSTL/inc/ImportPage.jsp?user_id="
			+ URLEncoder.encode("KOREA[한국]")+"&user_pw="
			+ URLEncoder.encode("Fighting[독일]")); 
	%> --%>
	
	<c:redirect url="/10JSTL/inc/ImportPage.jsp">
		<c:param name="user_id" value="Korea[한국]" />
		<c:param name="user_pw" value="Germany[독일]" />
	</c:redirect>
</body>
</html>