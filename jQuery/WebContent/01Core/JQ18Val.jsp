<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JQ18Val.jsp</title>
<script src="../jquery/jquery-3.4.1.js" ></script>
<script>
$(function(){
	
	/*
	val()메소드 : input태그의 하위속성인 value 속성에 값을 부여하거나 가져올때
	사용한다. 또한 radio,checkbox,select에 선택값을 부옇라때도 사용한다.
	주로 정보수정페이지에서 활용한다.
	
	*/
	$('input:text').val('홍길동'); 
	$('input:radio').val(['남자']);
	$('#sel').val(['pol','ent']);
	 
	$('input:button').click(function(){
		var msg ="";
		msg += $('#txt').val()+"\n";
		msg +=$('input:radio[name=gender]:checked').val()+"\n"; 
		msg +=$('#sel').val();
		
		alert(msg);
	});
});
</script>
</head>
<body>
	<h2>val()메소드</h2>
	
	텍스트박스 : <input type="text" id="txt"/>
	<br />
	라디오박스 :
	<input type="radio" name="gender" value="남자"/>Man
	<input type="radio" name="gender" value="여자" />Woman
	<br />
	셀렉트리스트:
	<select name="" id="sel" multiple ="multiple" size="3">
		<option value="pol">정치</option>
		<option value="eco">경제</option>
		<option value="ent">연예</option>
	</select>
	<br />
	<input type="button" value="확인"/>
	
	
</body>
</html>