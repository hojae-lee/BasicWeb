<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CookiceMain.jsp</title>
</head>
<body>
	<h2>쿠키</h2>
	
	<h3>쿠키 설정</h3>
	<%
	/*
	1.쿠키객체 생성 : new Cookie(쿠키명, 쿠키값);
		:쿠키명을 설정하는 setName()함수가 별도로 존재하지 않으므로 반드시 생성자를 통해서
		쿠키명을 설정한다.
	*/
	Cookie cookie = new Cookie("UserID","KOSMO");
	/*
	2.쿠키경로설정 : 쿠키설정시 쿠키가 정용될 경로를 설정 할 수 있따.
		아래는 컨텍스트루트 경로를 사용했으므로 웹사이트 전체에서 사용가능한 쿠키를 생성하게 된다.
	*/
	System.out.println("request.getContextPath()"+request.getContextPath());
	cookie.setPath(request.getContextPath());
	/*
	3. 쿠키의 유효시간 설정(초단위)
		: 유효시간을 설정하지 않을 경우 웹브라우저를 닫을떄 자동으로 삭제된다.
		유효시간을 설정하면 해당시간만큼 쿠키가 저장된다.
	*/
	cookie.setMaxAge(3600);
	
	/*
	4. 응답헤더에 쿠키를 추가하여 전송한다. 즉 클라이언트에 쿠키가 생성된다.
	*/
	response.addCookie(cookie);
	%>
	
	<!-- 
	쿠키는 첫 실행시에는 출력되지 않는다. 이유는 클라이언트 측으로 응답헤더에 실어서 보낸 쿠키가 서버측으로
	즉시 전송되지 않기 떄문이다. 일단 클라이언트에 먼저 생성되고 다음 접속시 서버쪽으로 요청헤더를 통해
	전송되어야 서버는 쿠키가 생성된것을 확인할 수 있따.
	※즉 쿠키는 생성과 동시에 확인되지 않는다는것을 기억하자.
	 -->
	
	<h2>쿠키를 설정하는 현재페이지에서 쿠키값 확인하기</h2>
	<%
	Cookie[] cookies = request.getCookies();
	
	if(cookies!=null){
		
		for(Cookie c : cookies){
			String cookieName = c.getName();
			String cookieValue = c.getValue();
			
			out.println(String.format("%s:%s<br/>", cookieName, cookieValue));
		}
	}
	%>
	<h2>페이지 이동 후 쿠키값 확인하기</h2>
	<a href="CookieResult.jsp">
		쿠키값 다음페이지에서 확인하기
	</a>
</body>
</html>