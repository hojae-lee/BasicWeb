<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ReponseSendRedirect.jsp</title>
</head>
<body>
	<%
	String id = request.getParameter("user_id");
	String pwd = request.getParameter("user_pwd");
	
	if(id.equalsIgnoreCase("kosmo") && pwd.equalsIgnoreCase("1234")){
		//response객체를 이용한 페이지 이동하기.
		response.sendRedirect("../common/Welcome.jsp");
	}
	else{
	%>
		<script>
			alert("아이디와 패스워드가 일치하지 않습니다.");
			history.go(-1);
		</script>
	<%
		/*
		JS코드와 JSP코드가 동일한 블럭내에 존재하는 경우 JSP코드가 우선순위가 높으므로 사용에 주의해야한다.
		JS코드가 JSP코드보다 먼저 나오더라도 실행되지 않는다.
		*/
		//response.sendRedirect("./ResponseMain.jsp");
	}	
	%>
</body>
</html>