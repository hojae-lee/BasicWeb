<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>09Out.jsp</title>
</head>
<body>
<!-- 
	- out태그에 value속성의 값이 null일때만 default속성에 지정한 값이 출력된다.
	- 단, 값이 빈문자열("")인 경우는 값이 있는것으로 간주되어 default속성에 지정한 값이 출력되지 않는다.
 -->
 	<h2>out 태그</h2>
 	
 	<c:set var="htmlStr">
 		<h3>h3태그로 감싼 문자열</h3>
 	</c:set>
 	
 	<!-- 기본값이거나 true일 때는 HTML이 해석되지 않고 태그까지 그대로 출력된다.
 	 	true면 text
 	 	false면 html
 	 -->
 	<h3>escapeXml = true 일때</h3>
 	<c:out value="${htmlStr }" escapeXml="true" />
 	<br />
 	\${htmlStr } : ${htmlStr }
 	
 	<h3>escapeXml = false 일때</h3>
 	<c:out value="${htmlStr }" escapeXml="false" />
 	<br />
 	\${htmlStr } : ${htmlStr }
 	
 	<h3>default속성</h3>
 	
 	<h4>값이 빈 문자열 : 값이 있는 경우에 해당</h4>
 	출력 : <c:out value="" default="값이 빈 문자열" />
 	
 	<h4>값이 null인 경우 : 값이 없는 경우에 해당</h4>
 	출력 : <c:out value="${null }" default="값이 null인 경우" />
 	
 	<h3>페이지 링크에 응용하기</h3>
 	
 	<c:url value="/08Board2/BoardList.jsp?nowPage=" /><c:out value="${param.nowPage }" default="1" />
 	<hr />
 	
 	<a href="<c:url value="/08Board2/BoardList.jsp?nowPage=" /><c:out value="${param.nowPage }" default="1" />">
 	회원제게시판 리스트 바로가기</a>
</body>
</html>





