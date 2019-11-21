<%@page import="java.util.Vector"%>
<%@page import="java.util.Collection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>04Operator.jsp</title>
</head>
<body>
	<h2>EL의 연산자들</h2>
	
	<h3>EL에서의 null연산</h3>
	<%
	/*
		Java코드에서는 null과 연산을 수행하거나 출력은 불가능하다.
		하지만 EL에서는 Null이 0으로 간주되어계산된다,
		따라서 NullPointerExceoption이 발생하지않는다.
	*/
	%>
	<%-- <%
	int a = null + 10;
	%>  --%>
	
	<!-- 산술연산에서 null은 0으로 간주되어 계산된다. -->
	\${null+10 } : ${null+10 } <br />
	\${param.myNumber+10 } : ${param.myNumber+10 } <br /><!-- 파라미터가 없을때
	결과: 10, 파라미터가 있다면 해당값을 읽어와서 연산함. -->
	<br />
	
	<!-- null값과 비교연산에서는 무조건 false값을 반환한다. -->
	\${param.myNum>10 } : ${param.myNum>10 } <br />
	\${param.myNum<10 } : ${param.myNum<10 } <br />
	<br />
	
	<h3>JSTL로 EL에서 사용할 변수선언</h3>
	
	<!-- EL식에서는 JSP의 스크립팅 요소에서 선언한 변수를 직접 사용할 수업삳.
	값이 출력되지 않고 null로 인식하게된다. -->
	
	<%
	String varScriptLet = "스크립트렛 안에서 변수선언";
	%>
	<!-- null값으로 인식되므로 0으로 간주한다. 즉 결과는 100이 출력된다.-->
	\${varScriptLet+100 } : ${varScriptLet+100 } <br />
	
	
	<!-- 
		JSP코드에서 선언한 변수를 EL에서 사용해야 할 경우네는 JSTL을 이용해서 변수를 선언해야 한다.
		JSP에서 즉시 선언하고 싶다면 영역에 저장하면 된다. 
	-->
	
	<c:set var="elVar" value = "<%=varScriptLet %>"/>
	\${elVar } : ${elVar } <!-- 결과:문자열 출력됨 -->
	
	
	<h3>EL변수에 값 할당</h3>
	<c:set var ="fnum" value = "9" />
	<c:set var ="snum" value = "5" />
	\${fnum=99 } : ${fnum=99 }
	<!-- 
		Tomcat8.0부터는 EL에서 변수할당이 가능해졌다. 하지만 개발시에는 실제 서비스할 웹서버의
		버전을 반드시 확인 후 사용여부를 결정한다. 기본적으로 EL은 표현(출력)하는 용도로 사용하는 것이
		좋다.
	 -->
	
	<h3>EL의 산술연산자</h3>
	<!-- 
		EL에서는 정수와 정수를 연산하더라도 '실수' 의 결과가 나올 수 있따. 즉 자동형변환 되어
		출력된다.
			java코드 : 99 / 5 =19
			EL식 : 99/ 5 =19.8
	 -->
	<ul>
		<li>\${fnum+snum } : ${fnum+snum }</li>
		<li>\${fnum/snum } : ${fnum/snum }</li>
		<li>\${fnum div snum } : ${fnum div snum }</li>
		
		<li>\${fnum%snum } : ${fnum%snum }</li>
		<li>\${fnum mod snum } : ${fnum mod snum }</li>
		
		<li>\${"100"+100 } : ${"100"+100 }</li>
		<li>\${"Hello~"+"EL~" } : \${"Hello~"+"EL~" }</li>
		<li>\${"일"+2 } : \${"일"+2 }</li>
	</ul>
	
	<!-- 
	EL에서는 비교연산자를 이용한 비교연산시 EL변수에 저장된 값을 모두 문자열로 인식하여 
	String클래스의 compareTo()메소드 방식으로 비교한다
	즉, 첫번째 문자부터 하나씩 비교해 나간다.
	단 실제 숫자 비교시에는 일반적인 숫자비교가 이루어진다.
	 -->
	<h3>EL의 비교연산자</h3>
	<c:set var="fnum" value="100"/>
	<c:set var="snum" value="90"/>
	<ul>
		<!-- 
			문자열 형태로 비교하기때문에 문자9와 문자1의 아스키코드값을 통한
			비교가 진행되어 false가 반환된다.
		 -->
		<li>\${fnum > snum } : ${fnum > snum }</li> <!-- 문자열이기에 아스키코드값으로 비교 false -->
		<li>\${100 > 90 } : ${100 > 90 }</li>
		
		<!-- Java에서는 문자열을 비교할떄 equals()메소드를 통해 비교하지만 EL에서는 ==형태로 비교한다. -->
		<li>\${"JAVA" == 'JAVA' } : ${"JAVA" == 'JAVA' }</li>
		<li>\${"Java" == 'JAVA' } : ${"Java"=="JAVA" }</li>
	</ul>
	
	<!-- 
		EL의 논리연산자
		>   Greater then
		>=  Greater then equal
		< 	Less then
		<= 	Less then equal
		== 	eqaul
		!= 	not equal
		&& 	and
		|| 	or
	 -->
	<h3>EL의 논리연산자</h3>
	
	<ul>
		<li>\${5>=5 && 10!=10 } : ${5 ge 5 and 10 ne 10 }</li>
		<li>\${5>6 || 10<100} : ${5 gt 6 or 10 lt 100 }</li>
	</ul>
	
	<h3>EL의 삼항연산자</h3>
	\${10 gt 9 ? "참이닷" : "거짓이닷" } : ${10 gt 9 ? "참이닷" : "거짓이닷" }
	
	<!-- 
		null이거나 ""일떄 혹은 배열인 경우 길이가 0일 떄 혹은 컬렉션인 경우 size가 0일떄
		=> true를 반환하는 연산자이다.
	 -->
	<h3>EL의 empty 연산자 : null일때 true를 반환하는 연산자</h3>
	<%
		String nullStr = null;
		String emptyStr = "";
		Integer[] lengthZero = new Integer[0];
		Collection sizeZero = new Vector();
	%>
	
	<!-- EL에서 사용할 변수를 JSTL에서 선언함 -->
	<c:set var ="elnullStr" value ="<%=nullStr %>" />
	<c:set var ="elemptyStr" value ="<%=emptyStr %>" />
	<c:set var ="ellengthZero" value ="<%=lengthZero %>" />
	<c:set var ="elsizeZero" value ="<%=sizeZero %>" />
	<ul>
		<li>\${empty elnullStr } : ${empty elnullStr }</li>
		<li>\${not empty elemptyStr } : ${not empty elemptyStr }</li>
		<li>${empty ellengthZero ? "배열크기가0임" : "배열크기가0이아님" }</li>
		<li>${not empty elsizeZero ? "컬렉션에 저장된 객체있음" : "컬렉션에 저장된 객체 없음" }</li>
	</ul>
	
</body>
</html>