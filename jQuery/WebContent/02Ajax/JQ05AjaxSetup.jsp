<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JQ05AjaxSetup.jsp</title>
<script src="../jquery/jquery-3.4.1.js" ></script>
<script>
$(function(){
	
	/*
	$.ajaxSetup()
		:동일하게 반복되는 메소드의 인자를 설정하여 반복되는 인자를 생략하게 해주는 메소드이다.
		
		url, type, data, dataType 등은 기본적으로 사용되는 필수항목이므로 $.ajaxSetup()메소드에
		묶어주면 편리하다.
		즉 $$.ajaxSetup에서 정의된 속성을 상속받아서 $.ajax()에서 실행하는 메카니즘이라고 보면된다.
	*/
	$.ajaxSetup({
		url : "./common/05JSONData.json",
		dataType : "json"
	});
	
	$('#btn').click(function(){
		$.ajax({
			success : function(responseData){
				/*
				JSON배열의 경우 $.each() 메소드를 통해 주로 파싱한다.
				요소를 반복할때의 index와 각 항목의 객체를 반환하여 아래와 같이 파싱할 수 있따.
				*/
				$.each(responseData.items, function(index,value){
					var htmlStr = "<tr>";
					htmlStr += " <td>"+(index+1)+"</td>";
					htmlStr += " <td>"+value.name+"</td>";
					htmlStr += " <td>"+value["age"]+"</td>";
					htmlStr += " <td>"+value["주소"]+"</td>";
					htmlStr += "  </tr>"
					
					$('#tbl1').append(htmlStr);
				});
			},
			error : errFunc
		})
	});
});

function errFunc(errData){
	alert("실패:" +errData.status+":"+errData.statusText);
}
</script>
</head>
<body>
	<h2>$.ajaxSetup메소드 사용하기</h2>
	
	<table border="1" id="tbl1">
		<tr>
			<td>NO</td>
			<td>이름</td>
			<td>나이</td>
			<td>출신지역</td>
		</tr>
	</table>
	
	<button id="btn">JSON데이터 가져오기</button>
</body>
</html>