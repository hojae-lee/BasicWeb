<%@page import="model.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>03ObjectResult.jsp</title>
</head>
<body>
	<h2>EL의 parma 내장객체로 파라미터 읽기</h2>
	
	<h3>자바코드로 영역 및 파라미터 읽기</h3>
	
	<h4>영역에 저장된 값</h4>
	<%
	/*
		Java코드를 통해 영역에 접근해서 속성을 가져올 때는 아래 과정을 거친다.
			1.getAttribute()으로 꺼내온다.
			2.형변환한다.
			3.getter()를 통해 저장된 값을 출력한다.
	*/
	MemberDTO member = (MemberDTO)request.getAttribute("dtoObj");
	%>
	<ul>
		<li>
			MemberDTO객체 : <%=String.format("아이디:%s,"+"비번:%s,이름:%s", 
					member.getId(),member.getPass(), member.getName()) %>
		</li>
		<!-- String과 같은 자바의 기본객체는 형변환없이 출력가능 -->
		<li>
			String객체 : 
				<%=request.getAttribute("dtoObj") %>
		</li>
		<li>
			Integer객체 :
				<%=request.getAttribute("integerObj") %>
		</li>
	</ul>
	
	<h4>파라미터로 전달된 값 읽기</h4>
	
	<%
	/*
	파라미터로 전달되는 값은 항상 문자열 형태이므로 산술연산을 위해서는 숫자로 변환이 필요하다.
	*/
	
	int fNum = Integer.parseInt(request.getParameter("firstNum"));
	int sNum = Integer.parseInt(request.getParameter("secondNum"));
	%>
	두 파라미터의 합 : <%=fNum+sNum %>
	
	
	<!-- 
	JSP코드를 통해 영역에 저장된 속성을 읽어올떄는 Object타입으로 저장되므로 반드시 형변환 후 사용해야 한다.
	
	EL식으로 읽어올떄는 형변환없이 바로 사용이 가능하다. 또한 getter()를 통한 멤버변수의 접근도 
	$ {속성명.멤버변수} 형태로 간단한 문법을 제공한다.
	
	영역에서 읽을때는 XXXScope라는 내장객체가 필요하지만 속성명이 중복되지 않는다면 생략이 가능하다.
	(가장 작은 영역의 속성을 읽어옴)
	 -->
	<h3>EL로 영역과 파라미터로 전달된 값 읽기</h3>
	<h4>영역에 저장된값</h4>
	<ul>
	<!-- DTO객체를 출력하는 EL식은 "속성명.멤버변수" 형태로 작성되었으나 멤버변수에 직접 접근이 아니라 getter()
	를 통한 접근이라는것이다. -->
		<li>MemberDTO객체 : <br/>
			아이디 : ${dtoObj.id},
			비번 : ${dtoObj.pass},
			이름 : ${dtoObj.name}
		</li>
		<li>String객체 : ${requestScope.strObj }</li>
		<li>Integer객체 : ${integerObj}</li>
	</ul>
	
	<%--
		EL의 param 내장객체를 통해 파라미터를 읽을 떄
		1.param.폼이름
		2.param['폼이름']
		3.param["폼이름"]
		가능하다.
	 --%>
	
	<h4>파라미터로 전달된 값의 합</h4>
	<ul>
		<li>${param.firstNum+param['secondNum']}</li>
		<!-- 위와 같은 경우는 덧셈연산이 진행되어 500이 출력되나
		아래는 200이라는 값과 300이라는 값의 출력으로만 인식되어 200+300 이라는 출력결과가 나오게 된다. -->
		<li>${param.firstNum }+${param['secondNum']}</li>
	</ul>
</body>
</html>