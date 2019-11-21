<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	SimpleDateFormat simple = new SimpleDateFormat("yyyy-MM-dd");
    	String todayStr = simple.format(new Date());
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>IncludePage.jsp</title>
</head>
<body>
</body>
</html>