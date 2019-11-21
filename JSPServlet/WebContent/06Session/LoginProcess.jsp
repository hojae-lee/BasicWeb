<%@page import="java.util.Map"%>
<%@page import="model.MemberDTO"%>
<%@page import="model.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- LoginProcess.jsp --%>
<%
String id = request.getParameter("user_id");
String pw = request.getParameter("user_pw");

String drv = application.getInitParameter("JDBCDriver");
String url = application.getInitParameter("ConnectionURL");

MemberDAO dao = new MemberDAO(drv,url);

//방법1: 카운트 함수를 통해 회원의 존재여부만 판단함.
/* boolean isMember = dao.isMember(id, pw);

if(isMember==true){
	session.setAttribute("USER_ID", id);
	session.setAttribute("USER_PW", pw); */
	
//방법2: 회원 테이블에서 레코드 추출후 DTO객체에 저장후 반환받기

/* MemberDTO memberDTO = dao.getMemberDTO(id,pw);
if(memberDTO.getId()!=null){
	
	session.setAttribute("USER_ID", memberDTO.getId());
	session.setAttribute("USER_PASS", memberDTO.getPass());
	session.setAttribute("USER_NAME", memberDTO.getName()); */
	
//방법3: Map계열 컬렉션에 저장 후 반환받기
	Map<String, String> memberInfo = dao.getMemberMap(id, pw);
	
	if(memberInfo.get("id")!=null){
		session.setAttribute("USER_ID", memberInfo.get("id"));
		session.setAttribute("USER_PASS", memberInfo.get("pass"));
		session.setAttribute("USER_NAME", memberInfo.get("name"));
		response.sendRedirect("Login.jsp");
}
else{
	request.setAttribute("ERROR_MSG", "넌회원이 아니시군 ㅡㅡ ㅡㅡㅡ");
	request.getRequestDispatcher("Login.jsp").forward(request, response);
}

%>