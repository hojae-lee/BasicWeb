<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
pageContext.setAttribute("pageVar", "페이지영역이다.");
request.setAttribute("requestVar", "리퀘스트영역이다.");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ForwardAction.jsp</title>
</head>
<body>
	<h2>액션태그를 이용한 포워딩</h2>
<%
/* page< request< session< application
page영역
하나의 JSP페이지에서 응답 JSP페이지내에서만 객체를 공유하는 영역

request영역
요청을 받아서 응답하기까지 객체가 유효한 영역.
forward또는 include를 사용하면 request객체가 공유되어서 영역이됨.

session영역
하나의 브라우저당 1개의 세션객체가 생서됨
같은 브라우저내에서 요청되는 페이지들은 같은 객체를 공유.

application영역
하나의 어플리케이션당 1개의 어플리케이션객체가 생성됨
같은 어플리케이션 내에서 요청되는 페이지들은 같은 객체를 공유하게 됨.
*/
/*
1. sendRedirect로 페이지 이동
	-새로운 페이지에 대한 요청이므로 page, request영역 모두 공유되지 않느낟,
	-URL창에는 마지막 요청된 페이지명이 보여진다.
	-절대경로로 지정할 경우 Context루트명을 포함한 경로로 지정해야 한다.
*/
//response.sendRedirect(request.getContextPath()+"/07ActionTag/ForwardActionResult.jsp");

/*
2. 포워드(자바코드사용)
	-포워드 된 페이지에서는 request영역이 공유된다.
	-URL창에는 최초 요청한 페이지의 경로가 보여지게 되므로 사용자는 페이지가 이동된 것을 알 수 없다.
	-절대경로로 지정시 Context루트를 제외한 경로로 지정한다.
*/
request.getRequestDispatcher("/07ActionTag/ForwardActionResult.jsp").forward(request, response);

%>

<!--
3. 액션태그를 통한 포워딩
	액션태그에 페이지속성만 지정하면 됨.
  -->
 <%-- <jsp:forward page="/07ActionTag/ForwardActionResult.jsp" /> --%>
</body>
</html>