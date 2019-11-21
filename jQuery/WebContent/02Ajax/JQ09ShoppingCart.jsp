<%@page import="shop.ShoppingDAO"%>
<%@page import="shop.OptionsDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> --%>
<%
ArrayList<OptionsDTO> optionLists = ShoppingDAO.getInstance().getOption("3");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JQ09ShoppingCart.jsp</title>
<style>
table{
	border: 1px solid;
	border-collapse: collapse;
}
</style>
<script src="../jquery/jquery-3.4.1.js" ></script>
<script>
$(function(){
	$.ajaxSetup({
		type: "get",
		contentType : "text/html;charset:utf-8",
		error : function(e){
			alert("실패"+e.status);
		}
		
	});
	
	$('#goodsOptionHTML').change(function(){
		$.ajax({
			url : "./common/GoodsSelectHTML.jsp",
			dataType : "html",
			data : {
				goodsOptionIdx : $('#goodsOptionHTML').val()
			},
			success : function(d){
				$('#optionSelected').append(d);
			}
		});
	});
	
	$('#goodsOptionJSON').change(function(){
		$.ajax({
			url : "./common/GoodsSelectJSON.jsp",
			dataType : "json",
			data : {
				goodsOptionIdx : $('#goodsOptionJSON').val()
			},
			success: function(d){
				var table = "";
				table += "<table border='1' width='100%' style='background-color: #dddddd'>";
				table +=   "<tr>";
				table +=      "<td width='30%'>일련번호</td>";
				table +=      "<td width='40%'>상품명</td>";
				table +=      "<td width='30%'>옵션가격</td>";
				table +=   "</tr>";
				table +=   "<tr>";
				table +=      "<td width='30%'>"+d.op_idx+"</td>";
				table +=      "<td width='40%'>"+d.op_name+"</td>";
				table +=      "<td width='30%'>"+setComma(d.op_price)+"</td>";
				table +=   "</tr>";
				table += "</table>";
				$('#optionSelected').append(table);
				
				var totalPrice = parseInt($('#totalPrice').val())+parseInt(d.op_price);
				$('#priceDisplay').text('총상품금액 : '+setComma(totalPrice)+'원');
				$('#totalPrice').val(totalPrice);
			}
		});
	}); 
});

function setComma(str) {
	var temp_str = String(str);

	for(var i = 0 , retValue = String() , stop = temp_str.length; i < stop ; i++)
		retValue = ((i%3) == 0) && i != 0 ? temp_str.charAt((stop - i) -1) + "," + retValue : temp_str.charAt((stop - i) -1) + retValue;

	return retValue;
}

</script>
</head>
<body>

	<h2>$.ajax() 를 활용한 옵션상품 추가하기 구현</h2>
	<input type="hid-den" id="totalPrice" value="1300000"/>
	
	<table border="1" width="80%" >
		<tr>
			<td rowspan="7">
				<img src="../images/amazon.png" alt="" />
			</td>
			<td>
				상품명 : 
			</td>
		</tr>
		<tr>
			<td>상품가격 : 1,300,000원</td>
		</tr>
		<tr>
			<td>등록일 : 19-07-22</td>
		</tr>
		<tr>
			<!-- 옵션추가만 가능 가격은 계싼안됨 -->
			<td>추가옵션선택1 : 
				<select name="" id="goodsOptionHTML">
					<option value="">선택하삼^^</option>
					<%
						for(OptionsDTO dto : optionLists){ %>
						<option value="<%=dto.getOp_idx()%>"><%=dto.getOp_name() %>(+<%=dto.getOp_price() %>)</option>
					<%} %>
				</select>
			</td>
		</tr>
		
		<tr>
			<!-- 옵션추가 및 옵션가격 계싼됨 -->
			<td>추가옵션선택2 : 
				<select name="" id="goodsOptionJSON">
					<option value="">선택하삼^^</option>
					<%
						for(OptionsDTO dto : optionLists){ %>
						<option value="<%=dto.getOp_idx()%>"><%=dto.getOp_name() %>(+<%=dto.getOp_price() %>)</option>
					<%} %>
				</select>
			</td>
		</tr>
		
		<tr>
			<td id="optionSelected">추가된 옵션이 디스플레이됩니다.</td>
		</tr>
		<tr>
			<td id="priceDisplay">최종결제금액 : 1,300,000원</td>
		</tr>
	</table>
</body>
</html>