<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%!
public void showGugudan(JspWriter out){
	try{
		out.println("<table border='1' width=\"700\">");
		for(int i=1; i<=9; i++){
			out.println("<tr>");
			for(int j=2; j<=9; j++){
				out.println("<td>"+j+"*"+i+"="+(i*j)+"</td>");
			}
			out.println("</tr>");
		}
		out.println("</table>");
	}
	catch(Exception e){
		e.printStackTrace();
	}
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Gugudan.jsp</title>
</head>
<body>
	<h2>JSP로 구구단 출력하기</h2>
	
	<h3>구구단 출력1</h3>
	<%
		showGugudan(out);
	%>
	
	<h3>구구단 출력2</h3>
	<%
		//표현식을 이용하여 구구단 출력하기
	%>
	<table border="1" width="700">
	<% for(int dan=2; dan<=9; dan++){ %>
		<tr>
		<%for(int su=1; su<=9; su++){ %>
			<td><%=dan %>*<%=su %>=<%=(dan*su) %></td>
			<%} %>
		</tr>
	<% } %>
	</table>
</body>
</html>