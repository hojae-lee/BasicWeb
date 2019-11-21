<%@page import="model.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
request.setAttribute("member", new MemberDTO("Sung","9999","성춘향",null));
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ParamAction.jsp</title>
</head>
<body>
	<h2>인클루드 되는 페이지로 파라미터 전달하기</h2>
	
<%-- 	
		forawerd 액션태그를 사용할떄 page속성에는 값의 일부분만 표현식으로 사용하는것은 불가능하다.
	ex)
		page=<%url %>?query=하하하(x)
		page=<%url %> (o)
 --%>
 	<%
	request.setCharacterEncoding("UTF-8");
	
	String pageURL = "ParamActionForwardResult.jsp?query=반갑습니다";
	String paramValue = "KOSMO";
	
	/*
	파라미터는 문자열만 전달될수있고 객체는 전달할수없다.
	그러므로 객체를 파라미터로 전달하고 싶을때는 영역에 저장후 공유해야한다.
	*/
	request.setAttribute("member", new MemberDTO("LEE","7777","이몽룡", null));
	%>
	<jsp:forward page="<%=pageURL %>">
		<jsp:param value="한국소프트웨어인재개발원" name="name" />
		<jsp:param value="<%=paramValue %>" name="id" />
	</jsp:forward>
</body>
</html>