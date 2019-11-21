<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>폼값 전송하기</title>
</head>
<body>
	<h2>get/post 방식으로 전송된 폼값 받기</h2>
	<%
	//전송된 값의 한글깨짐 방지 처리(영어/숫자가 아닌 언어에서는 반드시 처리)
	request.setCharacterEncoding("UTF-8");
	%>
	
	
	<%
	/*
	JSP에서 폼값을 받을떄는 아래와 같이 request객체를 사용한다. 단 서블릿에서는 각각 doGet(), doPost()메소드로
	구분해서 받는다.
	*/
	String id = request.getParameter("user_id");
	String pw = request.getParameter("user_pwd");
	%>
	<ul>
		<li>전송된 아이디: <%=id %></li>
		<li>전송된 패스워드: <%=pw %></li>
	</ul>
</body>
</html>