<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SessionMain.jsp</title>
</head>
<body>
	<h2>session(HttpSession타입) 객체의 주요메소드</h2>
	<ul>
		<li>세션유지시간(web.xml : 분단위설정) 설정1</li>
		<%--
		  <session-config>
  				<session-timeout>60</session-timeout>
  		  </session-config>
		--%>
	</ul>
	
	<ul>
		<li>세션유지시간(메소드사용 : 초단위설정) 설정2</li>
		<%
			//session.setMaxInactiveInterval(1000);
		%>
	</ul>
	
	<h3>세션 아이디 확인</h3>
	<p>
		<%=session.getId() %>
	</p>
	<h3>세션 유효시간 확인</h3>
	<p>
		<%=session.getMaxInactiveInterval() %>
	</p>
	
	<h3>세션의 최초/마지막 요청시간</h3>
	<%
		//세션의 최초 생성시간
		long createTime = session.getCreationTime();
		SimpleDateFormat s = new SimpleDateFormat("HH:mm:ss");
		String creationTimeString = s.format(new Date(createTime));
		
		//세션의 마지막 요청시간
		long lastTime = session.getLastAccessedTime();
		String lastTimeString = s.format(new Date(lastTime));
	%>
	<ul>
		<li>최초요청시간 : <%=creationTimeString %></li>
		<li>마지막요청시간 : <%=lastTimeString %></li>
	</ul>
</body>
</html>