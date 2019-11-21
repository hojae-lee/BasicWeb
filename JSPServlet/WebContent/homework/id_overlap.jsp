<%@page import="model.MemberRegistDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
request.setCharacterEncoding("UTF-8");

String id = request.getParameter("user_id");

MemberRegistDAO dao = new MemberRegistDAO();

if(dao.isMember(id)==true){%>
	<strong><strike><font color="red" size="24pt" ><%=id %></font></strike><br />
	중복된 ID가 있음. <br /> <span style="color: red;">다시 입력해주세요....!!!</span></strong><br />
	<input type="button" value="재입력" onclick="falseid()" style="background-color: blue; 
	border: none; width: 100px; color: white;"/>

<%
}else{%>
	<strong><font color="red" size="24pt"><%=id %></font><br />
	사용가능한 ID. </strong><br />
	<input type="button" value="중복확인완료" onclick="setid()" style="background-color: blue; 
	border: none; width: 100px; color: white;"/>
<%
}
%>

<script>
	function setid(){
		opener.document.registFrm.user_id.value="<%=id%>";
		opener.document.registFrm.overFlag.value="1";
		opener.document.registFrm.user_pw1.focus();
		window.close();
	}
	function falseid(){
		opener.document.registFrm.user_id.value="";
		opener.document.registFrm.user_id.focus();
		window.close();
	}
</script>