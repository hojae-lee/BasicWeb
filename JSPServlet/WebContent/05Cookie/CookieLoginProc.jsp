<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- CookieLoginProc.jsp --%>
<%
String userid = request.getParameter("user_id");
String userpw= request.getParameter("user_pw");
/*
	checkbox의 경우 항목이 여러개이므로 주로 getParamerterValues()를 통해 배열로 받아야 하지만,
	항목이 하나만 있는 경우에는 아래와 같이 처리 가능하다.
*/
String id_save = request.getParameter("id_save");

//회원정보는 DB연동 없이 kosmo/1234 인것으로 간주하고 개발함.
if("kosmo".equals(userid) && "1234".equals(userpw)){
	
	//회원인증이 안료된 경우 session영역에 속성을 저장한다.
	session.setAttribute("USER_ID", userid);
	session.setAttribute("USER_PWD", userpw);
	
	if(id_save == null){
		//아이디 저장하기 체크를 해제한 경우...
		
		//쿠키를 삭제할떄는 빈값으로 만들어 준다.
		Cookie ck = new Cookie("USER_ID","");
		ck.setPath(request.getContextPath());
		ck.setMaxAge(0);//유효시간이 0이므로 역시나 사용할수 없는 쿠키가 된다
		response.addCookie(ck);
	}
	else{
		//아이디 저장하기를 체크한 경우...
		//쿠키를 생성하고 적용경로, 및 유효시간을 설정한다.
		Cookie ck = new Cookie("USER_ID", userid);
		System.out.println(request.getContextPath());
		ck.setPath(request.getContextPath());
		ck.setMaxAge(60*60*24*100);
		response.addCookie(ck);
	}
	
	response.sendRedirect("CookieExamMain.jsp");
}
	else{
		request.setAttribute("ERROR_MSG", "회원이 아닙니다");
		//원래 페이지로 포워드 한다. 
		request.getRequestDispatcher("CookieExamMain.jsp").forward(request, response);
	}
	//
%>
