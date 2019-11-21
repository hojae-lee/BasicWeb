<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> --%>
<%-- 파일명: 01LoadParam.jsp --%>
<%
String p =request.getParameter("params");
if(p.equals("good")){
%>
	<h3 style="color:yellow;">Goods~오늘은 운수 좋은날 ^^>.~</h3>
<%
} else if(p.equals("bad")){
%>
	<h3 style="color: gray;">Bad! 오늘은 운수나쁜날</h3>
<%
}
%>