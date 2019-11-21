<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//기존에 생성된 쿠키를 읽어온다.
Cookie [] cookies = request.getCookies();
/*
StringBuffer 클래슨느 문자열의 변경이 빈번히 일어나는 경우 사용된다.
String클래스는 +기호를 통해 문자열을 연결하지만 StringBuffer클래슨느 append()함수를 통해 문자열을 연결한다.
*/
//쿠키에 저장된 아이디값을 저장할 변수
StringBuffer buffer = new StringBuffer();

//쿠키가 존재한다면 전체에서 USER_ID라는 쿠키명이 있는지 찾는다.

if(cookies!=null){
	   for(Cookie ck : cookies){
		   if(ck.getValue().contains("product")){
			   //쿠키에 저장된 값을 변수에 저장한다.
			   System.out.println("쿠키값: "+ck.getValue());
			   buffer.append(ck.getValue());
		   }
	   }
	   System.out.println("생성된문자열(buffer):"+buffer);
}

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CookieCartMain.jsp</title>
</head>
<body>
	<h2>쿠키를 이용한 장바구니 예제</h2>
	<form action="CookieCartResult.jsp">
		<table border=1 cellpadding = "10">
			<tr>
				<td>
					<!-- StringBuffer형 문자열에 각 value값이 포함되었는지 확인해서 있다면 checked속성을 활성화한다. -->
					<input type="checkbox" name="cart" value ="product1"
						<% if(buffer.indexOf("product1")!=-1){%>
							checked = "checked"
							
						<%}%>
						
					/>상품1
					&nbsp;&nbsp;
					<input type="checkbox" name="cart" value ="product2"
						<% if(buffer.indexOf("product2")!=-1){%>
							checked = "checked"
							
						<%}%>
					/>상품2
					&nbsp;&nbsp;
					<input type="checkbox" name="cart" value = "product3"
						<% if(buffer.indexOf("product3")!=-1){%>
							checked = "checked"
							
						<%}%>
					/>상품3
					&nbsp;&nbsp;
					<input type="checkbox" name="cart" value = "product4"
						<% if(buffer.indexOf("product4")!=-1){%>
							checked = "checked"
							
						<%}%>
					/>상품4
				</td>
			</tr>
			<tr>
				<td style = "text-align:center;">
					<input type="submit" value="장바구니담기"/>
				</td>
			</tr>
		</table>
	</form>

	<form action="CookieCartEmpty.jsp">
		<input type="submit" value="장바구니비우기"/>
	</form>
</body>
</html>