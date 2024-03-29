<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%
   //기존에 생성된 쿠키를 읽어온다.
   Cookie [] cookies = request.getCookies();
   //쿠키에 저장된 아이디값을 저장할 변수
   String user ="";
   
   //쿠키가 존재한다면 전체에서 USER_ID라는 쿠키명이 있는지 찾는다.
   if(cookies!=null){
	   for(Cookie ck : cookies){
		   if(ck.getName().equals("USER_ID")){
			   //쿠키에 저장된 값을 변수에 저장한다.
			   user = ck.getValue();
		   }
	   }
   }
   %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CookieExamMain.jsp</title>
</head>
<body>
	<h2>쿠키를 이용한 로그인 & 아이디저장하기</h2>
	
	<span style ="color:red; font-size: 1.5em;">
		로그인처리메시지출력부분:
		<%=request.getAttribute("ERROR_MSG")==null ? "" : request.getAttribute("ERROR_MSG") %>
	</span>
	<%
	//세션영역에 아디가 없다면. 로그인폼을 출력한다.
	if(session.getAttribute("USER_ID")==null){
	%>
	
	<form action="CookieLoginProc.jsp" method="post">
	<!-- 
		input 태그의 tabindex속성
			: 포커스 이동을 위해 탭키를 눌렀을떄 포커스가 이동하는 순서를 지정한다. 지정되지 않으면
			input태그가 작성된 순서대로 이동하게 된다.
	 -->
	<table border="1">
		<tr>
			<td>아이디</td>
			<td>
			<!-- 변수 user에 저장된 값이 있따면 value속성에 삽입 -->
			<!-- tabindex 탭순서. -->
				<input type="text" name = "user_id" tabindex="1" value="<%= user==null ? "": user%>"/>
				
				<!-- 변수 user에 저장된 값이 있다면 checkbox의 checked 속성을 설정한다. -->
				<input type="checkbox" name = "id_save" tabindex="3" value="Y"
				<%if(user.length()!=0){ %>
					checked = "checked"
				<% } %>
				/> 아이디저장하기				
			</td>
		</tr>
		<tr>
			<td>패스워드</td>
			<td>
				<input type="text" name="user_pw" tabindex="2" />
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="submit" value="로그인하기" tabindex="4"/>
			</td>
		</tr>
	</table>
	</form>
<%
} else { 
	//세션영역에 저장된 아이디속성이 있다면 로그인성공화면을 보여준다.
%>
	<table border=1 width = 400>
		<tr>
			<td align="center">
			<%= session.getAttribute("USER_ID") %>님, 로그인 하셨습니다.	
			<br />
			즐거운시간 보내세요
			<br />
			<input type="button" value="로그아웃" onclick="location.href='CookieLogoutProc.jsp'"/>
			</td>
		</tr>
	</table>
<%
}
%>
</body>
</html>