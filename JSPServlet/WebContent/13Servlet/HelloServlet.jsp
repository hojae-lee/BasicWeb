<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HelloServlet.jsp</title>
</head>
<body>

<!-- 
서블릿 작성순서

Step1] 서블릿작성
1. 사용자가 전달한 값이 있으면 request객체의 getParameter()로 받는다.
	모든 요청은 JSP가 받지 않고 서블릿이 직접 받는다.
2. 요청을 분석해서 model을 호출한다.
3. model이 반환한 값을 request영역이나 session영역에 저장한다.
4. view를 선택 후 페이지를 이동한다. request영역의 공유를 위해 주로 forward를 이용한다.

Step2] 사용자의 요청을 받을수 있도록 web.xml에 서블릿을 매핑
1/ <servlet-name> : 엘리먼트에 지정한 서블릿명은 임의로 지정이 가능하지만
유일한 이름이어야 한다. 중복은 허용되지 않는다.
2. <url-pattern> : 지정한 형식의 요청이 있는 경우 서블릿명과 일치하는 서블릿 클래스에서 사용자의 요청을 전달한다.


step3] jSP에서 요청시
1.컨텍스트 루트 경로를 포함한 URL패턴을 지정한다.
	<a href="/컨텍스트루트/서브경로/요청명.do">서블릿 요청명</a>
	HTML에서는 주로 상대경로를 사용하므로 이 경우 컨테스트 루트 경로는 신경쓰지 않아도 된다.
	
서블릿 작성규칙

1.클래스명 앞에 반드시 public을 붙여준다.
2.서블릿으로 정의할 클래스는 HttpServlet클래스를 반드시 상속받는다.
3.메소드를 정의할 때 ServletException, IOException 예외를 반드시 선언해야 한다.
4.doGet(), doPost()메소드를 오버라이딩 해야 한다. (service)메소드를 사용해도 된다.
5.서블릿 엔진은 사용자의 요청을 받았을 때 서블릿 클래스에 정의되어 있는 doGet(), doPost()메소드를 호출한다.
파라미터는  HttpServletRequest, HttpServletResponse 두개의 클래스를 통해 요청과 응답을 처리한다.
 -->
	<h2>서블릿(Servlet) 만들기</h2>
	
	<!-- 서블릿을 호출하기 위한 요청명을 먼저 결정한다. 아래 경로는 상대경로이기 때문에 컨텍스트
	루트를 신경 쓸 필요가 없다. -->
	
	<h3>First Servlet</h3>
	<!-- 상대경로 -->
	<a href="./NoJSPServlet.do">
		JSP파일없이 화면에 출력하기(Servlet에서 바로 출력)
	</a>
	<br />
	
	<!-- 절대경로 -->
	<a href="/K06JSPServlet/13Servlet/NoJSPServlet.do">
		JSP파일 업이 화면에 출력하기 서블릿에서 바로 출력
	</a>
	<!-- 리퀘스트 영역에 저장된 정보를 아래와 같이 출력한다. -->
	<h3>${message }- ${HELLO }</h3>
	<!-- JSP코드를 이용한 출력 -->
	<h3><%=request.getAttribute("message") %></h3>
	<h3>HelloServlet</h3>
	<a href="HelloServlet.do">
		JSP파일에서 화면 출력하기.
	</a>
	</body>
	
	<h3>WebServlet - 어노테이션으로 매핑하기</h3>
	<a href="AnnoWebServlet.do">
		AnnoWebServlet.do 바로가기
	</a>
	
	<h3>서블릿으로 간단한 계산기 만들기</h3>
	<form action="<%=request.getContextPath()%>/13Servlet/Calculate.kosmo" method="get">
		<input type="text" name="firstNum" size="10" />
		<select name="operator" id="">
			<option value="+">+</option>
			<option value="-">-</option>
			<option value="*">*</option>
			<option value="/">/</option>
		</select>
		<input type="text" name="secondNum" size="10" />
		<input type="submit" value="연산결과는?" />
		<h4 style="color:red;font-size:1.5em">
			${calResult }
		</h4>
	</form>
	
</html>