<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>RequestParameter.jsp</title>
</head>
<body>
<%
request.setCharacterEncoding("UTF-8");

/*
전송방식 Get/ Post에 상관없이 getParameter("파라미터명") 로 폼값을 받을 수 있따.
만약 값을 입력하지 않으면 길이가 0인 String객체를 반환하고 파라미터명이 틀린경우에는 null을 반환한다.
*/

String id = request.getParameter("id");

String name = request.getParameter("name");
if( !(name==null || name.equals("")) ){
	out.println("이름:"+name);
}
else{
	out.println("<script>");
	out.println(" alert('이름을 입력하세요');");
	out.println(" history.back();");
	out.println("</script>");
}
/*
radio의 폼값을 받을때는 getParameterValues()와 getParameter()둘다 사용이 가능하다.
항목자체가 여러개이지만 실제 선택가능한 항목이 하나이기떄문이다.
단 getParametervalues()를 통해 폼값을 받는 경우에는 배열형태로 값을 꺼내온다.
*/
/*
//배열형태로 폼값을 받을 떄...
String[] sex = request.getParameterValues("sex");
String sexStr = null;
if(sex != null) sexStr = sex[0];
*/
//text타입과 동일한형태로 값을 받을 떄....
String sexStr = request.getParameter("sex");

/*
checkbox의 폼값을 받을때는 반드시 getParameterValues()를 사용한다.
여러개의 항목중 헤크가 된 항목만 전송된다.
*/
String[] favo = request.getParameterValues("favorite");
String favStr = "";

/*
전송된 항목을 하나의 문자열로 만들기 위해 배열의 크기만큼 반복하면서 값을 연결하고 있따.
마지막 문자열일 때 ,를 제거하기 위해 조선을 체크한다.
*/
if(favo != null) {
	for(int i=0; i<favo.length; i++){
		if(i==favo.length-1){
			favStr += favo[i];
		}
		else{
			favStr += favo[i] + ",";
		}
	}
}

/*
textarea를 통해 입력받은 값은 엔터키(줄바꿈기호 \r\n)가 포함되어야한다.
웹브라우저에 출력할떄는 반드시 <br/>태그로 변환후 출력해야 줄바꿈이 된 상태로 보여지게 된다.
*/
String self_intro = request.getParameter("self_intro").replace("\r\n","<br/>");
%>
<ul>
	<li>이름 : <%=name %></li>
	<li>아이디 : <%=id %></li>
	<li>성별 : <%=sexStr %></li>
	<li>관심사항 : <%=favStr %></li>
	<li>자기소개 : <%=self_intro %></li>
</ul>

<%
/*
getParameterNames() : 폼값을 티름을 통해 한꺼번에 받을떄 사용하는 request객체의 메소드. 폼값을 받은 후 반환타입은
					Enumertation타입이다.
					
					hasMoreElements() : 객체에 남은 폼값이 있는지 검사한다.
					nextElement() : 받은 폼값중 다음 폼의 이름을 반환한다.
*/

Enumeration names = request.getParameterNames();
while(names.hasMoreElements()){
	
	String paramName = (String)names.nextElement();
	System.out.println("파라미터명:"+ paramName);
	
	if(paramName.equals("sex") || paramName.equals("favorite")){
		System.out.println("getParameterValues()로읽기");
		out.println("파라미터명을 getparameterValues()로 얻어서 값 출력함" + "<br/>");
	}
	else{
		System.out.println("getParameter()로 읽기");
		out.println("파라미터명을 메소드로 얻어서 값출력: ");
		out.println(request.getParameter(paramName)+"<br/>");
	}
}
%>


</body>
</html>