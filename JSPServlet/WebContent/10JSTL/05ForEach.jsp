<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>05ForEach.jsp</title>
</head>
<body>
	<h2>일반 for문 형태의 forEach태그</h2>
	
	<h3>JSTL 및 EL로 Hn태그 출력하기</h3>
	<!-- step => 반복문 증감인덱스 변경 해줌 예를들어 2면 2씩증가~ -->
	<c:forEach begin="1" end="6" var="i" step="2">
		<h${i }>난 H${i }태그입니다.</h${i }>
	</c:forEach>
	
	<!-- 
	일반for문에서의 varStatus속성
		:반복과 관련된 정보를 추상화한 클래스인 LoopTagStatus 객체를 통해 정보를 반환한다.
		count : 실제 반복횟수
		index : 변수 i의 변화하는 값
		first : loop의 처음일떄 true 반환. 나머지는 false.
		last : loop의 마지막일때 true 반환.
		current : 현재 loop의 변수값(var 속성에 지정된 변수)
	 -->
	<c:forEach begin="3" end="5" var="i" varStatus="loop">
		<h4>${loop.count }번째 반복입니다.</h4>
		<ul>
			<li>index : ${loop.index }</li>
			<li>first : ${loop.first }</li>
			<li>last : ${loop.last }</li>
			<li>current : ${loop.current }</li>
		</ul>
	</c:forEach>
	
	<h3>1에서 100까지 정수중 홀수의 합</h3>
	<c:forEach begin="1" end="100" var="a">
		<c:if test="${a mod 2 ne 0 }">
			<c:set var="sum" value="${sum+a }" />
		</c:if>
	</c:forEach>
	1~100사이의 홀수의 합 = ${sum }
	
	<h3>중첨된 for문 활용하기</h3>
	<!-- 
	연슴문제] 아래모양을 출력하시오.
	1 0 0 0 0
	0 1 0 0 0
	0 0 1 0 0
	0 0 0 1 0
	0 0 0 0 1
	 -->
	 
	 <h2>if문</h2>
	 <c:forEach begin="1" end="5" var="x">
		<c:forEach begin="1" end="5" var="y">
		
			<c:if test="${x eq y }" var="result">
			1&nbsp;
			</c:if>
			<c:if test="${not result }">
			0&nbsp;
			</c:if>
		</c:forEach>
		<br />
	</c:forEach>
	 
	 <h2>choose문</h2>
		
	<!-- i와 j가 같을때 "1"을 출력하고 나머지의 경우는 "0"을 출력 -->
	<c:forEach begin="1" end="5" var="x">
		<c:forEach begin="1" end="5" var="y">
		
			<c:choose>
				<c:when test="${x eq y }">
				1&nbsp;
				</c:when>
				
				<c:otherwise>
				0&nbsp;
				</c:otherwise>		
			</c:choose>
			
			<c:if test="${y eq 5}">
				<br />
			</c:if>
			
		</c:forEach>
	</c:forEach>
	
	
	<!-- JSTL태그 사이에 HTML주석을 사용하면 컴파일러가 주석을 잘 못 해석하여 에러를 발생시킨다. 
	따라서 JSTL문장 사이에는 주석을 쓰지 않는것이 좋다.-->
	<h2>구구단 출력하기</h2>
	<!-- 
    시나리오] JSTL의 forEach문을 이용하여 구구단을 출력하시오.
       table태그를 사용해야하고, 짝수행에 마우스 오버시 빨간색으로
       홀수행에 마우스 오버스 노란색으로 바뀌게 코드를 작성하시오
     -->
     
     <h3>JSTL로 출력하기</h3>
     <table border="1">
     	<c:forEach begin="2" end="9" var="i" varStatus="gugudan">
     		<c:choose>
     			<c:when test="${gugudan.count mod 2 eq 0 }">
     				<c:set var="color" value="red"/>
     			</c:when>
     			<c:otherwise>
     				<c:set var="color" value="yellow"/>
     			</c:otherwise>
     		</c:choose>
     		
     		<tr onmouseover="this.style.backgroundColor='${color}';"
     			onmouseout="this.style.backgroundColor='#FFFFFF';">
     			<c:forEach begin="1" end="9" var="j">
     			<td>${i }*${j }=${i*j }</td>     			
     			</c:forEach>
     				
     		</tr>
     	</c:forEach>
     </table>
     
     
     
	</body>
</html>