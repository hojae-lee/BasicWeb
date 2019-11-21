<%@page import="model.BbsDAO"%>
<%@page import="model.BbsDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- 글작성 완료 전 로그인 체크하기 -->
<%@ include file="../common/isLogin.jsp" %>

<%
request.setCharacterEncoding("UTF-8");

String title = request.getParameter("title");
String content = request.getParameter("content");

BbsDTO dto = new BbsDTO();
dto.setTitle(title);
dto.setContent(content);
/*
	DTO객체의 id를 세팅하는 부분은 세션영역의 데이터를 가져온다.
	이 때 세션영역에 데이터가 null인 경우 아래 코드는 에러가 발생되므로
	반드시 이전에 세션영역을 채킹하는 부분이 필요하다.
*/
dto.setId(session.getAttribute("USER_ID").toString());

/* 
//web.xml에 설정된 컨텍스트 초기호 파라미터를 가져와서 DAO를 호출할 때 파라미터로 넘겨준다.

String drv = application.getInitParameter("JDBCDriver");
String url = application.getInitParameter("ConnectionURL");
BbsDAO dao =new BbsDAO(drv,url); 
*/

/*
DB연결정보를 생성자에서 직접 가져오기 위해서 applicaiont내장객체를 매개변수로 전달한다.
*/

BbsDAO dao =new BbsDAO(application);

int affected = dao.insertWrite(dto);
if(affected==1){
	response.sendRedirect("BoardList.jsp");
}
else{
%>
	<script>
		alert("글쓰기 실패");
		history.go(-1);
	</script>
<%
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>WriteProc.jsp</title>
</head>
<body>

</body>
</html>