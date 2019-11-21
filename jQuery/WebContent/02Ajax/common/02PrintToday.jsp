<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> --%>
<%@ page trimDirectiveWhitespaces="true" %>
<%
request.setCharacterEncoding("UTF-8");

String msg = request.getParameter("msg");
String varStr = request.getParameter("varStr");
String today = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());

out.println("<h2>메시지:"+msg+"</h2>");
out.println("<h2>varStr:"+varStr+"</h2>");
out.println("<h2>오늘날짜:"+today+"</h2>");
%>