<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ApplicationMain.jsp</title>
</head>
<body>
<%-- 
	웹어플리케이션을 구헝하는 모든 JSP에서 스트링타입의 상수를 공유할 목적으로 사용한다.
	
	1. web.xml에 컨텍스트 초기화 파라미터를 등록한다.
		<context-param> 엘리먼트 사용
	2. ServletContext클래스의 getInitParameter()메소드로 읽어와서 사용한다
--%>
	<h2>application 내장객체의 주요 메소드</h2>
	
	<h3>web.xml에 설정한 내용 읽어오기</h3>
	<ul>
		<li>오라클드라이버 :
		<%=application.getInitParameter("JDBCDriver") %></li>
		<li>오라클접속URL : 
		<%=application.getInitParameter("ConnectionURL") %></li>
	</ul>
	
	<%--
		getInitParameterNames() 메소드를 통해 web.xml에 설정된 모든 초기화 파라미터를 가져올 수 있다.
		<param-name>속성으로 가져와서 해당 값을 읽을때는 getInitParameter()메소드를 사용하면 된다.
		Enumeration 모든 객체를 받을 수 있음.
	 --%>
	<h3>컨텍스트 초기화 파라미터명 전체목록보기</h3>
	<ul>
	<%
	Enumeration<String> names = application.getInitParameterNames();
	while(names.hasMoreElements()){
		
		String name = names.nextElement();
		String value = application.getInitParameter(name);
	%>
		<li><%=name %> : <%=value %></li>
	<%
	}
	%>
	</ul>
	
	<%--
		ServletContext의 메소드인 getREalPath()로 서버의 물리적 경로를 얻어 올수 있따.
		사용시 "Context루트"를 제외한 / 로 시작하는 경로를 입력해야 한다.
	 --%>
	<h2>서버의 물리적 경로 얻어오기</h2>
	<ul>
		<li>application내장객체 :
			<%=application.getRealPath("/images") %></li>
		<li>request내장객체 :
			<%=request.getServletContext().getRealPath("/images") %></li>
		<li>requset내장객체(주로 서블릿에서 사용) :
			<%=request.getRealPath("/images") %></li>
		<li>session내장객체 :
			<%=session.getServletContext().getRealPath("/images") %></li>
		<li>config내장객체 :
			<%=config.getServletContext().getRealPath("/images") %></li>
		<li>this키워드(주로선언부에서사용) :
			<%=this.getServletContext().getRealPath("/images") %></li>
	</ul>
	
	<%--
		선언부에서 JSP의 내장객체를 사용할때는 해당 내장객체의 클래스타입(형)으로 사용해야 한다.
		예로 application내장객체는 ServletContext타입을 가진다
	 --%>
	<h2>선언부에서 물리적경로 사용하기</h2>
	<%!
	String getRealPath(){
		return
		this.getServletContext().getRealPath("/images");
	}
	
	String getRealPath(ServletContext app1){
		return app1.getRealPath("/images");
	}
	
	ServletContext app2;
	String getRealPathString(){
		return app2.getRealPath("/images");
	}
	%>
	<ul>
		<li>this키워드로 사용 : <%=getRealPath() %></li>
		<li>매개변수로 전달 : <%=getRealPath(application) %></li>
	<%
	this.app2 =application;
	%>
		<li>멤버변수 : <%=getRealPathString()%></li>
	</ul>
</body>
</html>