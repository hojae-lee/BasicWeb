<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>index.jsp</title>
</head>
<body>
	<h2>자료실 바로가기</h2>
	<h3>컨택스트 루트를 포함한 경로(request 객체 사용)</h3>
	<a href="<%=request.getContextPath()%>/DataRoom/DataList">
		DataRoom바로가기1
	</a>
	
	<h3>상대경로를 이용한 바로가기</h3>
	<a href="../DataRoom/DataList">
		자료실 바로가기2 
	</a>
	
	<h3>절대경로를 이용한 바로가기</h3>
	<a href="/K06JSPServlet/DataRoom/DataList">
		파일첨부형 게시판 바로가기3
	</a>
</body>
</html>