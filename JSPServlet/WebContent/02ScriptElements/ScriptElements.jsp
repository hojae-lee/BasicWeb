<%--
JSP 스크립트 요소들

지시자(): 페에지속성을 지정하거나 외부문서를 script
--%>


<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%! 
public int add(int a, int b){
	int result = a+b;
	return result;
}

public int subtract(int a, int b){
	int result = a-b;
	return result;
}

public void showPrint(String str, JspWriter out){
	try{
		out.println("받은문자열:"+str);
	}
	catch(Exception e){
		e.printStackTrace();
	}
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ScriptElements.jsp</title>
</head>
<body>
	<h2>JSP의 스크립트 요소들(스크립팅 엘리먼츠)</h2>
	
	<%@ include file="../01Directive/IncludePage.jsp" %>
	
	<%
	/*
	스크립트렛 : 주로 JSP코드를 작성하고 실행할때 사용하는 영역이다.
		사용법: <% JAVA코드;>
	*/
	int value1 = 3;
	int value2 = 9;
	
	int addResult = add(value1, value2);
	int subResult = subtract(value1, value2);
	%>
	
	<h3>표현식으로 변수를 화면에 출력하기</h3>
	<%--
	표현식(Expression) : 변수를 웹브라우저상에 출력할때 사용한다.
		JS의 document.write()와 동일한 역할을 한다. 표현식을 사용할때 주의할 점은 변수뒤에
		세미콜론을 붙이면 안된다.
		사용법 : <%= 변수
	--%>
	<%=value1 %> + <%=value2 %> = <%=addResult %>
	<br />
	<%=value1 %> - <%=value2 %> = <%=subResult %>
	<br />
	
	<%
		showPrint("우리는KOSMO", out);
	%>
	<br />
	오늘 날짜는 : <%=todayStr %> [인클루드 된 파일에서 가져옴.]
</body>
</html>