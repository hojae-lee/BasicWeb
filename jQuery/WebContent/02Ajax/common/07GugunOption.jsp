<%@page import="java.util.ArrayList"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="model.ZipcodeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> --%>
<%@ page trimDirectiveWhitespaces="true" %>
<%

//시/도를 파라미터로 전달받아서 해당 구/군을 JSON배열형태로 출력한다.
request.setCharacterEncoding("UTF-8");

String sido = request.getParameter("sido");
ZipcodeDAO dao = new ZipcodeDAO();

ArrayList<String> gugunList = dao.getGugun(sido);
/*
JSON배열을 만들기 위해 JSONArray()객체를 생성한다. 사용법은 List계열의 컬렉션과
동일하게 add()메소드를 통해 데이터를 추가한다.
*/
JSONArray jsonArr = new JSONArray();

for(String gu : gugunList){
	jsonArr.add(gu);
}

//커넥션풀에 자원을 반납한다
dao.close();
out.println(jsonArr.toString());
%>