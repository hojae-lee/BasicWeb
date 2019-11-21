<%@page import="util.FormatUtil"%>
<%@page import="shop.ShoppingDAO"%>
<%@page import="shop.OptionsDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%-- <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> --%>
<%
	String g_idx = request.getParameter("goodsOptionIdx");
	OptionsDTO dto = ShoppingDAO.getInstance().optionView(g_idx);
	FormatUtil formatUtil = new FormatUtil();
%>

<table border="1" width="100%" style="background-color: #dddddd">
	<tr>
		<td width="30%">일련번호</td>
		<td width="40%">상품명</td>
		<td width="30%">옵션가격</td>
	</tr>
	<tr>
		<td width="30%"><%=g_idx %></td>
		<td width="40%"><%=dto.getOp_name() %></td>
		<td width="30%"><%=formatUtil.commaNumber(dto.getOp_price()) %></td>
	</tr>
</table>