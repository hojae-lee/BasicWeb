<%@page import="javax.sql.DataSource"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.naming.Context"%>
<%@page import="javax.naming.InitialContext"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ConnectionPool.jsp</title>
</head>
<body>
<%

/* 
JNDI (Java Naming and Directory Interface)
	: 디렉토리 서비스에서 제공하는 데이터 및 객체를 찾아서 참고 하는 API로 쉽게 말하면 외부에 있는 객체를
	이름으로 찾아오기 위한 기술 이다.
DBCP (Database Connection Pool)
	: DB와 연결된 커넥션 객체를 미리 만들어 풀에 저장해놨다가 필요할 때 가져다 쓰고 반납하는 기법을 말한다.
	데이터베이스의 부하를 줄이고 자원을 호율적으로 관리할 수 있다.
	게임에서는 Pooling System(풀링시스템)이라는 용어를 사용하기도 한다.
*/

/* 
커넥션풀을 사용하기 위한 절차

1. InitialContext 객체를 생성한다.
*/
Context initCtx = new InitialContext();
/* 
2. 위의 객체를 통해 JNDI 서비스 구조의 초기 Root 디렉토리를 얻어온다.
	여기서 얻어오는 톰켓의 루트디렉토리명은 java:comp/env로 이미 정해져 있으므로 그대로 사용하기만 하면 된다.
*/
Context ctx = (Context)initCtx.lookup("java:comp/env");
/* 
3. server.xml에 등록한 네이밍을 lookup하여 DataSource를 얻어온다.
*/
DataSource source = (DataSource)ctx.lookup("jdbc/myoracle");
/* 
4. 커넥션풀에 톰켓이 생성해 놓은 커넥션 객체를 가져다가 쓴다.
*/
Connection con = source.getConnection();

String conStr = "";
if(con!=null) conStr = "<h2>DBCP연결성공</h2>";
else conStr = "<h2>DBCP연결실패ㅜㅠ</h2>";

/* 
5. 커넥션풀에 사용한 커넥션객체를 반납한다. 이는 자원해제가 아니라 단순한 반납으로 풀에 생성된 객체는
소멸되지 않고 유지된다.
*/
if(con!=null) con.close();

out.println("<h2>커넥션풀 사용하기</h2>");
out.println(conStr);
%>
</body>
</html>