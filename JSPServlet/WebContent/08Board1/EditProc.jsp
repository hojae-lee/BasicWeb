<%@page import="model.BbsDAO"%>
<%@page import="model.BbsDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- EditProc.jsp --%>
<%@ include file = "../common/isLogin.jsp" %>
<%
/* 게시물 수정처리를 위해 가장 먼저 회원인증을 확인한다. 비 로그인 상태라면 로그인 후 진입할수 있도록 처리한다. */
request.setCharacterEncoding("UTF-8");

String num = request.getParameter("num");
String title = request.getParameter("title");
String content = request.getParameter("content");

//폼값을 DTO객체에 저장
BbsDTO dto = new BbsDTO();
dto.setNum(num);
dto.setTitle(title);
dto.setContent(content);

//DAO객체 생성 및 DB연결
BbsDAO dao = new BbsDAO(application);

//DTO객체를 DAO로 전달하여 게시물 업데이트수정
int affected = dao.updateEdit(dto);
if(affected==1){
	//정상적으로 수정되었다면 수정된 내용의 확인을 위해 상세보기로 이동
	response.sendRedirect("BoardView.jsp?num="+dto.getNum());
}
else{
	//수정중 문제가 발생하였다면 수정하기 페이지로 돌아간다.
%>
}
	<script>
		alert("수정하기 실패");
		history.go(-1);
	</script>
<%
}
%>