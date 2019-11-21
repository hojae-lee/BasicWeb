<%@page import="model.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
/*
포워드된 페이지나 인클ㄹ된 페이지로 전달하는 경우 한글이 포함되어 있다면 포워드 시키는 최초페이지나
인클루드 되는 페이지에서 인코딩을 설정한다.
*/
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>인클루드 된 페이지</h2>
	<h3>param액션태그로 전달된 값 출력하기</h3>
	<ul>
		<li>queryString: <%=request.getParameter("query") %></li>
		<li>name: <%=request.getParameter("name") %></li>
		<li>id : <%=request.getParameter("id") %></li>
	</ul>
	
	<!-- MemberDTOㄷ객체에 오버라이딩 처리한 toString() 메소드를 통해서 객체의 속성(멤버변수)이 출력된다. -->
	<h2>영역에 저장된 데이터 읽기</h2>
	<%=request.getAttribute("member") %>
</body>
</html>