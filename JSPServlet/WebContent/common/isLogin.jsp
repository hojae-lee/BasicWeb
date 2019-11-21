<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--파일명 : isLogin.jsp --%>
<%--용도 : 로그인이 필요한 각각의 페이지 상단에 공통적으로 인클루드 --%>    
<%
//회원인증여부 확인 - 세션영역에 인증된 정보가 저장되었는지 확인
if(session.getAttribute("USER_ID")==null){
%>
	<script>
		alert("로그인후 이용해주십시오");
		location.href="../06Session/Login.jsp";
	</script>
<%
	/*
	해당 if문의 경우 세션영역에 속성값이 없는 경우 로그인 페이지로 이동하라는 명령이지만 만약
	return문이 없으면 JS코드가 실행되지 않고 아래쪽에 있는 JSP코드가 실행될수 있으므로 반드시 if문의
	블럭끝에 return문이 있어야 JSP의 실행이 중지된다.
	*/
	return;//JSP코드의 실행이 중지된다.
}
%>