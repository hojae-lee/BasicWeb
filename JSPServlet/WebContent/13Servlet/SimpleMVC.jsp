<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SimpleMVC.jsp</title>
</head>
<body>
	<h2>간단한 MVC패턴 만들기</h2>
	<ul>
		<li>
			<a href="SimpleMVC">
				SimpleMVC?type=
			</a>
		</li>
		<li>
			<a href="SimpleMVC?type=greeting&id=test1&pw=1234">
				SimpleMVC?type=greeting&id=test1&pw=1234
			</a>
		</li>
		<li>
			<a href="SimpleMVC?type=date">
				SimpleMVC?type=date
			</a>
		</li>
		<li>
			<a href="SimpleMVC?type=noparam">
				SimpleMVC?type=noparam
			</a>
		</li>
		
	</ul>
	
	<h3>요청결과</h3>
	<span style="color:red; font-size: 2em;">
		${result }
	</span>
</body>
</html>