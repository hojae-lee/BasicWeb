<%@page import="org.json.simple.JSONObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> --%>
<%@ page trimDirectiveWhitespaces="true" %>
<%
String user_id = request.getParameter("user_id");
String user_pw = request.getParameter("user_pw");

/*
jsp에서 JSON사용하기
1.JSON 확장 라이브러리르 다운로드 받는다. (URL은 구글링)
2.json-simple-1.1.1.jar 파일을 lin폴더에 설치한다.
3.JSON객체를 만들때에는 JSONObject()클래스를 사용하고 사용법은 Map컬렉션과 동일하다
4. 완성된 JSON데이터를 웹브라우저에 출력할때는 toJSONString()메소드로 String타입으로 변환한후 출력한다.
*/
JSONObject jsonObj = new JSONObject();

if(user_id.equals("kosmo") && user_pw.equals("1234")){
	jsonObj.put("user_id",user_id);
	jsonObj.put("user_name", "홍길동");
	jsonObj.put("user_pw",user_pw);
	jsonObj.put("result",1);
}
else{
	jsonObj.put("result",0);
}
String jsonTxt = jsonObj.toJSONString();
out.println(jsonTxt);
%>