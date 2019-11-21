<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String color = request.getParameter("color");
	String font = request.getParameter("font");
	
	if(color==null || color.length()==0) color = "black";
	if(font==null || font.length()==0) font="Verdana";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>RequestUse.jsp</title>
<style>
	span{
		font-size:2em;
		color:<%=color%>;
		font-family:<%=font%>;
	}
</style>
</head>
<body>
	<h2>Request객체와 Scripting Element 응용하기</h2>
	
	<h3>HTML안에서 스크립팅 요소 사용하기</h3>
	<% for(int i=1; i<=6; i++){ %>
		<h<%=i %>>제목<%=i %>입니다.</h<%=i %>>
	<% } %>

	<h3>숫자를 입력후 버튼을 눌러주새요</h3>
	<form action="">
		<input type="text" name="counter"/>
		<input type="submit" value="이미지카운터" />
	</form>	
	
	<%
	String counter= request.getParameter("counter");
	if(counter!=null){
		/*
		toCharArray() : 문자열을 char형 배열로 반환해주는 메소드.
		*/
		char[] ch = counter.toCharArray();
		for(int i=0; i<ch.length; i++){
	%>
			<img src="../images/num_<%=ch[i] %>.gif" alt="<%=ch[i] %>번이미지" />
	<%
		}
	}
	%>		
	<h2>CSS안에서 스크립팅 요소 사용하기</h2>
	<span>CSS를 적용한 테긋트</span>
	<form method="post">
	[글자색]
		<select name="color">
			<option value="red">빨간색</option>
			<option value="blue">파란색</option>
			<option value="green">녹색</option>
		</select>
		[글꼴]
		<select name="font">
			<option value="굴림체">굴림체</option>
			<option value="바탕체">바탕체</option>
			<option value="휴먼옛체">휴먼옛체</option>
		</select>
		<input type="submit" value="폰트&색상변경"/>
	</form>
</body>
</html>