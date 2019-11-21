<%@page import="model.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ReponseJDBC.jsp</title>
</head>
<body>
<%
/* 
String driver = "oracle.jdbc.OracleDriver";
String url = "jdbc:oracle:thin:@localhost:1521:orcl"; 
*/

//application 객체를 이용하여 web.xml에 설정된 컨텍스트 초기화 파라미터 읽어오기
String driver = application.getInitParameter("JDBCDriver");
String url = application.getInitParameter("ConnectionURL");

MemberDAO memberDAO = new MemberDAO(driver,url);

String id = request.getParameter("user_id");
String pw = request.getParameter("user_pwd");

boolean memberFlag = memberDAO.isMember(id, pw);
if(memberFlag==true){
	System.out.println("회원입니다.");
	response.sendRedirect("../common/Welcome.jsp");
}
else{
	System.out.println("회원이 아닙니다.");
	
	String jsAlert = "<script>";
	jsAlert += "alert('회원이 아닙니다.');";
	jsAlert += "history.go(-1)";
	jsAlert += "</script>";
	
	out.println(jsAlert);
}
%>

</body>
</html>