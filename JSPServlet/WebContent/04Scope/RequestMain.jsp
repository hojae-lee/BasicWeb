<%@page import="java.net.URLEncoder"%>
<%@page import="model.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
   <%
   request.setAttribute("requestNumber", 999);
   request.setAttribute("requestString", "여기는 리퀘스트 영역입니다");
   request.setAttribute("requestMember1", new MemberDTO("Hong","1234","홍길동",null));
   %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>RequestMain.jsp</title>
</head>
<body>
	<h2>리퀘스트 영역에 저장된 속성값 읽기</h2>
	<ul>
		<li>Integer타입 : <%=request.getAttribute("requestNumber") %></li>
		<li>String타입 : <%=request.getAttribute("requestString") %></li>
		
		<%
		//우리가 정의한 객체인경우 형변환후 사용가능.
		MemberDTO member = (MemberDTO)request.getAttribute("requestMember1");
		%>
		<li>MemberDTO타입:
			아이디 : <%=member.getId() %>,
			패스워드 : <%=member.getPass() %>,
			이름 : <%=member.getName() %>,
			가입일 :<%=member.getRegidate() %>
		</li>
	</ul>
	
	<h2>리퀘스트 영역에 저장된 속성 삭제후 출력하기</h2>
	<%
		//저장된 속성이 있는경우에는 삭제,속성이 없는 경우네는 삭제되지 않음 속성이 없다고 에러가 발생하지는 암ㅎ음.
		request.removeAttribute("NoKeyValue");
		request.removeAttribute("requestNumber");
		request.removeAttribute("requestString");
	%>
	<ul>
		<li>Integer타입:
			<%=request.getAttribute("requestNumber") %></li>
		<li>String타입:
			<%=request.getAttribute("requestString") %></li>
		<li>MemberDTO타입: 
			아이디 : <%=member.getId() %>,
			패스워드 : <%=member.getPass() %>,
			이름 : <%=member.getName() %>,
			가입일 : <%=member.getRegidate() %></li>
	</ul>
	
	<h2>페이지 이동에 따른 request영역의 공유범위</h2>
	
	
	<h3>a태그를 사용한 링크</h3>
	<a href="RequestResult.jsp?param=단순링크">
		사용자클릭에 의한 페이지 이동
	</a>
	
	<%-- sendRedirect()는 JS의 location.href 와 동일한기능으로 새로운 페이지를 자동으로 요청하게 된다.
	즉 이경우에도 request영역은 공유되지 않는다. 웹 브라우저의 URL창에는 새롭게 요청된 페이지의
	경로명이 보여지게 된다.--%>
	<h3>sendRedirect()를 사용한 링크</h3>
	<%
		//response.sendRedirect("RequestResult.jsp?"+"param="+URLEncoder.encode("리다이렉트방식","UTF-8"));
	%>
	
	<%--
		최초 요청된 페이지와 포워드로 전달된 페이지는 request영역을 공유하게 된다.
		URL주소창에는 최초 요청된 페이지의 경로명이 보여지지만 출력되는 페이지는 새롭게 요청된 페이지의 내용을
		보여지게 된다.
		그러므로 사용자는 페이지 이동을 인지하지 못하지만 내부적으로는 페이지 이동이 된것임을 인지하자.
	--%>
	<h3>forward()를 사용한 페이지전달</h3>
	<%
		RequestDispatcher dis = request.getRequestDispatcher("RequestResult.jsp?"+"param=포워드방식으로이동");
		dis.forward(request, response);
	%>
</body>
</html>