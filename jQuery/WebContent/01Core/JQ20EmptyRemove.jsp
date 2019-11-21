<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JQ20EmptyRemove.jsp</title>
<script src="../jquery/jquery-3.4.1.js" ></script>
<script>
	$(function(){
		$('button').click(function(){
			if(this.id=="empty"){
				$('div').empty();
				//empty():  선택된 요소의 contents를 지움. 
				//단순히 내용만 지우게 되므로 text(' ')와 동일하다
				$('div').html("내용이 empty되었습니다.");
			}
			else{
				 //remover() : 선택된 요소 자체를 지움. 
				 //DOM자체를 삭제하게되므로 페이지를 다시 로딩하기 전에는 사용할 수 없다.
				$('div').remove();
				$('div').html('내용이 remove되었습니다.');
			}
		});
	});
</script>
<style>
	div{
		border:2px green dotted;
		height:50px;
	}
</style>
</head>
<body>
	<h2>empty() / remove() 메소드</h2>
	
	<button id="empty">Empty()호출하기</button>
	<button id="remove">remove()호출하기</button>
	
	<div>div태그안의 텍스트</div>
</body>
</html>