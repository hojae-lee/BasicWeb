<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- Logout.jsp --%>
<%
	//로그아웃 처리
	
	//방법1 : session영역에 저장된 값을 제거한다.
	session.removeAttribute("USER_ID");
	session.removeAttribute("USER_PW");
	
	//방법2: session영역 전체를 비워준다.
	session.invalidate();
	
%>

<script>
	alert("로그아웃띠");
	location.href="Login.jsp";
</script>

<%
	//원래페이지로 로케이션
	//response.sendRedirect("Login.jsp");
%>