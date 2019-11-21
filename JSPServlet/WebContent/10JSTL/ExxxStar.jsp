<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>마름모 18</h2>
	 <c:forEach begin="0" end="2" var="i">
	 	<c:forEach begin="0" end="${2-i }" >
	 		&nbsp;
	 	</c:forEach>
	 	<c:forEach begin="1" end="${2*i+1 }" >
	 		*
	 	</c:forEach>
	 	<br />
	 </c:forEach>
	 
	 <c:forEach begin="1" end="2" var="j">
 	 	<c:forEach begin="1" end="${j+1 }" >
	 		&nbsp;
	 	</c:forEach>
	 	<c:forEach begin="1" end="${5-(2*j)}" >
	 		*
	 	</c:forEach>

	 	<br />
	 </c:forEach>
	 
</body>
</html>