<%@page import="eltag.MyTagLib"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="my" uri="myTagLibTld"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>05MyTagLib.jsp</title>
</head>
<body>
<%--
EL에서 자바클래스의 메소드 호출하기 위한 절차
1. 자바클래스 파일 작성
	eltag/MyTagLib.java
2. TLD 파일 작성
	WEB-INF 폴더 하위 아무곳이나 등록하면 됨 JSP컨테이너가 알아서 찾아서 사용함.
	파일 작성시에는 fn.tld파일 참조
3. web.xml에 엘리먼트 추가
	: <jsp-config> 엘리먼트 추가 후 tld파일의 경로를 등록
4. jsp파일에서 EL식으로 메소드 호출
	${접두어:메소드명(매개변수)} 형태로 호출함.
	단, 페이지 상단에 taglib지시어로 등록해야함.
 --%>
 
	<h3>자바코드로 메소드 호출하기</h3>
	<ul>
		<li>
			MyTagLib.isNumber("100") => <%=MyTagLib.isNumber("100") %>
		</li>
	</ul>
	
	<h3>EL에서 자바클래스의 메소드 호출하기</h3>
	<ul>
		<li>
			my:isNumber호출1 : ${my:isNumber("100") }
		</li>
		<li>
			my:isNumber호출2 : ${my:isNumber("100A") }
		</li>
	</ul>
	
	<h2>연습문제</h2>
	<h3>EL에서 getGender 함수 호출하기.</h3>
	<pre>
		주민번호를 매개변수로 전달하면 성별을 판단하여 반환하는 메소드를 EL에서 호출할수 있도록
		절차대로 작성하시오.
		함수명 : getGender("123456-1000000") => 남자
				 getGender("123456-2000000") => 여자
		클래스 : eltag.MyTagLib 하위에 메소드 생성
	</pre>
	<ul>
		<li>
			주민번호 123456-1000000 : ${my:getGender("123456-1000000") }
		</li>
		<li>
			주민번호 123456-2000000 : ${my:getGender("123456-2000000") }
		</li>
		<li>
			주민번호 123456-9000000 : ${my:getGender("123456-9000000") }
		</li>
	</ul>

	
	
</body>
</html>