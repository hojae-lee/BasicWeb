<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>쿠키삭제하기</h2>
	<%
	/*
	※쿠키삭제시 주의사항
	JSP는 세션설정시 JSESSIONID라는 쿠키명으로 세션을 저장한다.
	따라서 생성된 쿠키를 모두 삭제하면 세션영역에 저장된 속성값도 사라지게 된다.
	쿠키를 삭제할때는 쿠키의 이름을 통해 선별적으로 삭제하거나 JSESSIONID를 제외한 나머지 쿠키만 삭제해아한다.
	*/
	Cookie[] cookies = request.getCookies();
	if(cookies!=null){
		for(Cookie ck: cookies){
			out.println(ck.getName()+" : "+ck.getValue()+"<br/>");
			
			/*
			아래 if문의 조건이 없으면 세션영역에 저장된 모든 속성값이 제가되므로 로그인을 한경우 로그아웃으로 처리된다.
			*/
			if(!(ck.getName().equals("JSESSIONID")) ){
				Cookie cookie = new Cookie(ck.getName(),"");
				cookie.setPath(request.getContextPath());
				cookie.setMaxAge(0);
				response.addCookie(cookie);
			}
		}
	}
	%>
	<script>
		alert("장바구니를 비웠습니다.");
		location.href="CookieCartMain.jsp";
	</script>
</body>
</html>