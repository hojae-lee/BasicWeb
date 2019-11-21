<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>10Catch.jsp</title>
</head>
<body>
<!-- 
	catch태그
	-EL에서 오류가 났을때 에러처리를 위해 사용된다.
	-에러 내용을 원하는 위치에서 출력하고자 할 때 사용한다.
	-JSTL문법 오류는 catch되지 않는다. EL에서만 사용 가능하다.
 -->

	<h2>catch태그</h2>
	<c:set var ="fnum" value="100" />
	<c:set var ="snum" value="0" />
	
	<h3>에러가 안나는 경우: 에러내용이 저장안됨</h3>
	<!--
		아래의 경우는 0으로 나눠서 계산식 자체에는 문제가 생겼지만 에러가 발생하지는 않아서 실행은 되는 부분이다.
		단 결과 부분에 Infinity로 출력된다.
		이 경우 var 속성에 에러 내용이 저장되지 않는다.
	 -->
	<h4>cath태그 밖에서 실행</h4>
	fnum / snum : ${fnum /snum } <br />
	
	<h4>cath태그 안에서 실행</h4>
	<c:catch var="errorMessage">
		fnum / snum : ${fnum /snum } <br />
	</c:catch>
	에러내용 : ${errorMessage }
	
	<h3>에러가 나는 경우 : 원하는 위치에 에러내용 표시</h3>
	<!-- 문장에서 에러가 발생하게 되므로 실행 자체가 되지 안는다.
	즉 500에러가 발생한다.
	이 경우에는 에러내용이 var 속성에 저장된다. -->
	<c:catch var="errorMessage">
		${"백"+100 }
	</c:catch>
	에러내용 : ${errorMessage }
	
</body>
</html>