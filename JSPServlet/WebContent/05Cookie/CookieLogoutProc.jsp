<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//로그아웃처리를 위해 세션영역에 저장된 모든 속성을 지운다.
	session.invalidate();

	//JSP코드가 우선순위가 높으므로 아래 JS코드는 무시된다.
	//response.sendRedirect("CookieExamMain.jsp");
%>
<script>
	alert("로그아웃되었습니다.");
	location.href="CookieExamMain.jsp";
</script>