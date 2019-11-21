<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JQ17Append.jsp</title>
<script src="../jquery/jquery-3.4.1.js" ></script>
<script>
$(function(){
	/*
	append()메소드 : 기존 컨텐츠뒤에 새로운 내용을 추가할때 사용
		방식) 선택자.append(컨텐츠);
		
	prependTo() 메소드 : 기존 컨텐츠앞에 새로운 내용을 추가할때 사용
		방식) $(컨텐츠).prependTo(선택자);
		※ 컨텐츠와 선택자의 위치가 바뀌는것에 주의할 것
		
	html() 메소드 : 기존의 내용을 제거한후 새로운 내용으로 갱신할떄 사용
	*/
	$('#btn').click(function(){
		var row = $('#row').val();
		var col = $('#col').val();
		
		var table = "<table border='1'>";
		for(var i=1; i<=row; i++){
			table +="<tr>";
			
			for(var j=1; j<=col; j++){
				table += "<td>"+i+"행, "+j+"열</td>"; 
			}
			table +="</tr>";
		}
		table += "</table>";
		
		//$('#appendDisplay').append(table);
		$(table).prependTo('#appendDisplay'); //선택자의 위치바뀜
		$('#appendDisplay').html(table);
	});
});
</script>
</head>
<body>
	<h2>append() 메소드</h2>
	
	<input type="number" id="row" value="2"/>행
	<input type="number" id="col" value="2"/>열
	<input type="button" id="btn" value="동적테이블추가"/>
	<div id="appendDisplay">
		여기에 생성됨
	</div>
</body>
</html>