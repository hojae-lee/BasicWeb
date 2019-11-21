<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.FileReader"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="smtp.SMTPAuth"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
request.setCharacterEncoding("UTF-8");
SMTPAuth smtp = new SMTPAuth();

Map<String,String> emailContent = new HashMap<String,String>();
emailContent.put("from",request.getParameter("from"));
emailContent.put("to",request.getParameter("to"));
emailContent.put("subject",request.getParameter("subject"));
String mail_content = "";

if(request.getParameter("content")!=null){
	
	String dirPath="";
	String filePath="";
	String sLine="";
	
	try{
		dirPath = application.getRealPath("/15EmailSending/");
		filePath = dirPath + "EmailForm.html";
		
		FileReader fr = new FileReader(filePath);
		BufferedReader br = new BufferedReader(fr);
		
		while((sLine=br.readLine())!=null){
			mail_content += sLine + "\n";
		}
	}
	catch(Exception e){
		e.printStackTrace();
	}
	
	//HTML문서내의 __XX__ 부분을 필요한 문자열로 변경하기.
	mail_content = mail_content.replace("__ID__", "anag");
	mail_content = mail_content.replace("__PASS__", "himdlea");
	mail_content = mail_content.replace("__MAIL_CONTENT__", request.getParameter("content"));
	
	emailContent.put("content", mail_content);
	
	boolean emailResult = smtp.emailSending(emailContent);
	if(emailResult==true){
		out.print("메일발송성공");
	}
	else{
		out.print("메일발송실패");
	}
	return;
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>email_text_sending.jsp</title>
</head>
<body>
	<h2>이메일 발송하기</h2>
	<form action="" method="post" name="mailForm">
	<table border="1">
		<tr>
			<td>
				보내는사람 : 
				<input type="text" name="from" value="chosloo5657@naver.com"/>
			</td>
		</tr>
		<tr>
			<td>
				받는사람 :
				<input type="text" name="to" value="chosloo2835@gmail.com"/>
			</td>
		</tr>
		<tr>
			<td>
				제목 : 
				<input type="text" name="subject" value="" />
			</td>
		</tr>
		<tr>
			<td>
				<textarea name="content" cols="30" rows="10"></textarea>
			</td>
		</tr>
		<tr>
			<td>
				<button type="submit">이메일발송</button>
			</td>
		</tr>
	</table>
	</form>
</body>
</html>