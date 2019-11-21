<%@page import="model.MyFileDAO"%>
<%@page import="model.MyFileVO"%>
<%@page import="java.io.File"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.multipart.FileRenamePolicy"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
//파일명 : UploadDBProc.jsp
%>
	<%
	request.setCharacterEncoding("UTF-8");
	
	String saveDirectory = application.getRealPath("/Upload");
	
	int maxPostSize = 1024 * 5000;
	
	String encoding = "UTF-8";
	
	FileRenamePolicy policy = new DefaultFileRenamePolicy();
	
	MultipartRequest mr = null;
	String name = null;
	String title = null;
	StringBuffer inter = new StringBuffer();
	File oldFile = null;
	File newFile = null;
	String realFileName = null;
	
	try{
		mr = new MultipartRequest(request, saveDirectory, maxPostSize, encoding, policy);
		String fileName = mr.getFilesystemName("chumFile1");
		
		String now = new SimpleDateFormat("yyyy_MM_dd_H_m_s_S").format(new Date());
		
		int idx = -1;
		
		idx = fileName.lastIndexOf(".");
		
		realFileName = now + fileName.substring(idx,fileName.length());

		oldFile = new File(saveDirectory+oldFile.separator+fileName);
		newFile = new File(saveDirectory+oldFile.separator+realFileName);
		
		//저장된 파일명을 변경한다.		
		oldFile.renameTo(newFile);
		
		name = mr.getParameter("name");
		title = mr.getParameter("title");
		String[] interArr = mr.getParameterValues("inter");
		for(String s : interArr){
			inter.append(s+",");
		}
		
		MyFileVO dto = new MyFileVO();
		dto.setName(name);
		dto.setTitle(title);
		dto.setInter(inter.toString());
		dto.setOfile(mr.getOriginalFileName("chumFile1"));
		dto.setSfile(realFileName);
		
		MyFileDAO dao = new MyFileDAO();
		dao.myfileInsert(dto);
		
		response.sendRedirect("FileList.jsp");
		
	}
	catch(Exception e){
		request.setAttribute("errorMessage", "파일업로드오류");
		request.getRequestDispatcher("FileUploadMain.jsp").forward(request, response);
	}
	%>

</html>