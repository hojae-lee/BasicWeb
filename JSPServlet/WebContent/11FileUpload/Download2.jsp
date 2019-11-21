<%@page import="java.io.File"%>
<%@page import="java.io.FileNotFoundException"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.io.InputStream"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 파일명 : Download1.jsp --%>
<%
request.setCharacterEncoding("UTF-8");

//파일 업로드된 경로
String root = request.getSession().getServletContext().getRealPath("/");
String savePath = root + "Upload";

//서버에 실제 저장된 파일명(DB처리)
String filename = request.getParameter("sName");//"20140819151221.zip" ;

//실제 내보낼 파일명(DB처리)
String orgfilename = request.getParameter("oName");//"테스트.zip" ;
/* String orgfilename = "원본파일명.jpg";//"테스트.zip" ; */

InputStream in = null;
OutputStream os = null;
File file = null;
boolean skip = false;
String client = "";

try{
	// 파일을 읽어 스트림에 담기
	try{
		file = new File(savePath, filename);
		in = new FileInputStream(file);
	}
	catch(FileNotFoundException fe){
		skip = true;
	}

	//사용자의 웹브라우저의 정보를 반환
	client = request.getHeader("User-Agent");

	// 파일 다운로드 헤더 지정
	/*
	※파일 다운로드를 위한 응답헤더 설정
	: 웹브라우저가 인식하지 못하는 컨텐츠타입(MIME)을
	응답헤더에 설정하게되면 다운로드 창을 보여준다.(웹브라우저
	의 종류에 따라 다운로드창의 형태는 달라진다)
	*/
	response.reset() ;
	response.setContentType("application/octet-stream");
	response.setHeader("Content-Description", "JSP Generated Data");

	if(!skip){
		
		if(client.indexOf("MSIE") != -1){
			//웹브라우저의 종류가 익스플로러 일때
			//한글 파일명 처리
			response.setHeader ("Content-Disposition", "attachment; filename="+new String(orgfilename.getBytes("KSC5601"),"ISO8859_1"));
		}else{
			//웹브라우저의 종류가 익스플로러가 아닐때
			//한글 파일명 처리. 또한 다운로드 받을때 파일명을
			//원본으로 변경할때 이부분을 사용함.
			orgfilename = new String(orgfilename.getBytes("utf-8"),"iso-8859-1");
			response.setHeader("Content-Disposition", "attachment; filename=\"" + orgfilename + "\"");
			response.setHeader("Content-Type", "application/octet-stream; charset=utf-8");
		} 
		 
		response.setHeader ("Content-Length", ""+file.length() );
		
		//웹브라우저에 연결한 출력스트림 생성
		os = response.getOutputStream();
		byte b[] = new byte[(int)file.length()];
		int leng = 0;
		
		//input스트림으로 읽어서 output스트림으로 웹브라우저에 출력함
		while( (leng = in.read(b)) > 0 ){
			os.write(b,0,leng);
		}
	}else{
		response.setContentType("text/html;charset=UTF-8");
		out.println("<script language='javascript'>alert('파일을 찾을 수 없습니다');history.back();</script>");
	}

	in.close();
	os.close();
}
catch(Exception e){
	e.printStackTrace();
}
%>
