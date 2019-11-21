<%@page import="util.JavascriptUtil"%>
<%@page import="model.BbsDAO"%>
<%@page import="model.BbsDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 파일명 : DeleteProc.jsp --%>
<%@ include file = "../common/isLogin.jsp" %>
<%
request.setCharacterEncoding("UTF-8");
String num = request.getParameter("num");

BbsDTO dto = new BbsDTO();
BbsDAO dao = new BbsDAO(application);

//작성자 확인을 위해 게시물의 내용을 가져온다.
dto = dao.selectView(num);

//session.getAttribute("USER_ID") Object타입형태로 가져오기에 toString()을 사용하여
//형변환 후 String의 문자열 형태로 저장.
String session_id = session.getAttribute("USER_ID").toString();
int affected = 0;
//세션영역과 DB상의 작성자를 확인하여 동일한 경우에만 게시물 삭제처리
if(session_id.equals(dto.getId())){
	dto.setNum(num);
	affected = dao.delete(dto);
}
else{
	JavascriptUtil.jsAlertBack("본인만 삭제가능합니다.",out);
	return;
}

if(affected==1){
	JavascriptUtil.jsAlertLocation("삭제되었습니다","BoardList.jsp",out);
}
else{
	out.println(JavascriptUtil.jsAlertBack("삭제실패하였습니다.,"));
}
%>