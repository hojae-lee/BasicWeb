<%@page import="model.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");

//자바코드를 통해 폼값 받은후 값 설정하기
//1. 폼값 받기
String id = request.getParameter("id");
String pass = request.getParameter("pass");
String name = request.getParameter("name");

//2. 폼값으로 MemberDTO객체에 저장하기 위한 객체생성
MemberDTO member1 = new MemberDTO();

//3. 객체에 값 설정
member1.setId(id);
member1.setPass(pass);
member1.setName(name);
   
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>UseBeanFormResult.jsp</title>
</head>
<body>
	<h2>userBean액션태그로 폼의 하위요소값 받기</h2>
	
	<h3>자바코드를 통해받기</h3>
	<ul>
		<li><%=member1.getId() %></li>
		<li><%=member1.getPass() %></li>
		<li><%=member1.getName() %></li>
	</ul>
	
	<h3>액션태그로 폼값 받기</h3>
	<!-- 
		액션태그로 자바빈을 생성한 후 한번에 폼값을 설정한다.
		한번에 저장이 가능한 이유는 폼의 name속성과 1:1 로 매칭되면 DTO객체가 있기 때문이다.
		이런 형태의 객체를 "커맨드객체"라고 부른다.
	 -->
	<jsp:useBean id="actionMember" class="model.MemberDTO" />
	<jsp:setProperty property="*" name="actionMember" />
	<ul>
		<li><%=actionMember.getId() %></li>
		<li><%=actionMember.getPass() %></li>
		<li><%=actionMember.getName() %></li>
	</ul>
</body>
</html>