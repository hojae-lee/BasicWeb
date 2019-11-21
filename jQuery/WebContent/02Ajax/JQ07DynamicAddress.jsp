<%@page import="java.util.ArrayList"%>
<%@page import="model.ZipcodeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
ZipcodeDAO dao = new ZipcodeDAO();
ArrayList<String> sidoList = dao.getSido();

//JSTL에서 사용하기 위해 페이지 영역에 저장
//set 태그를 이용해도 동일한 결과임.
pageContext.setAttribute("sidoList",sidoList);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JQ07DynamicAddress.jsp</title>
<script src="../jquery/jquery-3.4.1.js" ></script>
<script>
$(document).ready(function(){
	$('#sido').change(function(){
		$.ajax({
			url : "./common/07GugunOption.jsp",
			type : "get",
			data : {
				sido : $('#sido option:selected').val()
			},
			dataType : "json",
			contentType : "text/html; charset:utf-8;",
			success:function(d){
				var optionStr ="";
				optionStr += "<option value=''>";
				optionStr += "-구군을 선택하세요-";
				optionStr += "</option>";
				$.each(d,function(index, data){
					optionStr += '<option value="'+data+'">';
					optionStr += data;
					optionStr += '</option>';
				});
				//파싱된 JSON데이터를 구/군 select에 삽입한다.
				$('#gugun').html(optionStr);
			},
			error:function(e){
				alert("오류발생:"+e.status+":"+e.statusText);
			}
		});
	});
	
	$('#gugun').change(function(){
		var s = $('#sido option:selected').val();
		var g= $('#gugun').val();
		
		alert("선택한 시도:"+s+", 구군:"+g);
	});
});

</script>
</head>

<body>
	<h2>우편번호DB를 이용한 시도/구군 동적셀렉트 구현</h2>
 
	<form id="zipFrm">
		시/도:
		<select id="sido" class="form-control">
			<option value="">-시/도선택하삼-</option>
			<c:forEach items="${sidoList }" var="sidoStr">
				<option value="${sidoStr }">${sidoStr }</option>
			</c:forEach>
		</select>
		구/군:
		<select id="gugun" class="form-control">
			<option value="">-구/군선택하삼-</option>
		</select>		
	</form>
</body>
</html>