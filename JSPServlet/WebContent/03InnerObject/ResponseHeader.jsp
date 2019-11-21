<%@page import="java.util.Collection"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
/*
응답헤더 설정하기
	: 새로운 내용을 DB에 추가했는데도 변경된 내용이 웹브라우저 출력되지 않는다면 이는 캐시에 저장된 내용을 출력하고 있기 떄문
	이다. 아래의 설정은 해당페이지에서는 캐시를 사용하지 않고 매번 새로고침한것처럼 새로운 정보로 갱신하겠다는
	설정이다.
*/
//HTTP/1.0에서 적용됨
    response.setHeader("Pragma", "no-cahce");
//HTTP/1.1에서 적용됨
	response.setHeader("cache-control", "no-cahce");
/*
파일다운로드 구현시 사용
	: 웹 브라우저가 인식하지 못하는 content-type(MIME타입)으로 설정하게 되면 웹브라우저는
	파일 다운로드창을 통해 파일을 다운로드 하게 된다.
	binary/octect-stream 혹은 aplication/unknown으로 설정한다.
*/
	//response.setContentType("binary/octect-stream");
%>

<%

/*
응답헤더 추가/설정하기
	add계열 : 기존의 헤더명이 존재할경우 계속 추가한다. 없을때에는 새롭게생성한다.
	set계열 : 기본 헤더명이 존재할경우 기존갑이 변경된다. 없을때에는 새롭게 생성한다.
*/
long time = new Date().getTime();
System.out.println(time);
response.setDateHeader("currentDate",time);

SimpleDateFormat simple = new SimpleDateFormat("yyyy-MM-dd HH:mm");
time = simple.parse("2017-12-31 10:30").getTime();
System.out.println(time);
response.addDateHeader("currentDate", time);

response.addIntHeader("numberOfCrew", 100);
response.setIntHeader("numberOfCrew", 99);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ResponseHeader.jsp</title>
</head>
<body>
	<h2>응답헤더 정보 출력하기</h2>
	<%
	Collection<String> headerNames = response.getHeaderNames();
	
	for(String headerName : headerNames){
		String headerValue = response.getHeader(headerName);
	
	%>
		<li><%=headerName %>:<%=headerValue %></li>
	<%
	}
	%>
	
	<h2>응답헤더명 존재여부 확인하기</h2>
	<h3>currentDate 응답헤더명</h3>
	<%=response.containsHeader("currentDate")?"존재함":"존재하지안흠" %>
	
	<h3>Content-type 응답헤더명</h3>
	<%=response.containsHeader("Content-type")?"존재함":"존재하지안ㅁ흥ㅁ"%>
</body>
</html>