<%@page import="java.util.StringTokenizer"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>05ForTokens.jsp</title>
</head>
<body>
	<h2>forTokens태그</h2>
	<%
	/* 
		StringTokenizer 클래스 : 문자열을 토큰로 나눠서 출력할 떄 사용하는 클래스
		hasMoreTokens() : 꺼내올 토큰이 있으면 true를 반환한다.
		nextToken() : 다음토큰을 꺼내온다.
		countTokens() : 토큰의 갯수를 반환한다.
	*/
	String colors ="red,green,blue,gray";
	StringTokenizer tokens = new StringTokenizer(colors,",");
	
	out.println("<h3>StringTokenizer클래스사용</h3>");
	out.println("<h4>토큰수:" + tokens.countTokens()+"</h4>");
	
	while(tokens.hasMoreTokens()){
		String token = tokens.nextToken();
		out.println("<h5 style='color:"+token+"'>토큰</h5>");
	}
	
	/* 
		String클랫의 split()메소드 : 문자열을 구분자로 잘라서 배열로 반환한다. JS에도 똑같은 함수가 있다.
	*/
	String[] colorArr =colors.split(",");
	out.println("<h3>String클래스사용</h3>");
	for(String color : colorArr){
		out.println("<h5 style='color:"+color+"'>TOKEN</h5>");
	}
	%>
	
	<!-- 
	forTokens의 속성
		items : 구분자를 포함한 문자열
		delims(delimiter) : 구분자(여러가지 특수기호를 이요가능함)
		var : 구분자를 통해 잘라낸 토큰을 저장한다.
	 -->
	<h3>JSTL의 forTokens 태그 사용</h3>
	<c:forTokens items="<%=colors %>" delims="," var="color">
		<h5 style="color:${color };">JSTL 조아요</h5>
	</c:forTokens>
</body>
</html>