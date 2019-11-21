<%@page import="org.json.simple.JSONObject"%>
<%@page import="shop.ShoppingDAO"%>
<%@page import="shop.OptionsDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> --%>
<%@ page trimDirectiveWhitespaces="true" %>

<%
String op_idx = request.getParameter("goodsOptionIdx");

OptionsDTO dto = ShoppingDAO.getInstance().optionView(op_idx);
JSONObject jsonObj = new JSONObject();

jsonObj.put("op_idx", dto.getOp_idx());
jsonObj.put("op_name", dto.getOp_name());
jsonObj.put("op_price", dto.getOp_price());
jsonObj.put("g_idx", dto.getG_idx());

out.print(jsonObj.toJSONString());
%>