<%@page import="model.MemberDAO"%>
<%@page import="org.json.simple.JSONObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> --%>
<%@ page trimDirectiveWhitespaces="true" %>
<%-- 03PostLoginOracle.jsp --%>
<%
String id = request.getParameter("user_id");
String pw = request.getParameter("user_pw");

MemberDAO dao = new MemberDAO(application);
boolean isMember = dao.isMember(id, pw);
JSONObject json = new JSONObject();

if(isMember==true){
   json.put("result", 1);
   json.put("message","로그인 성공입니다^^*");
   
   String html = "";
   html += "<table border='1' style='width:300px;'>";
   html += "   <tr>"; 
   html += "      <td>회원님, 반갑습니다^^*</td>"; 
   html += "   </tr>"; 
   html += "</table>"; 
   
   json.put("html", html);
}else{
   json.put("result", 0);
   json.put("message","로그인 실패입니다.ㅜㅜ");
}
String jsonStr = json.toJSONString();
out.print(jsonStr);
   
%>