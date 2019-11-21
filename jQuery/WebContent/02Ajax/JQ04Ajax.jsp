<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JQ04Ajax.jsp</title>
<script src="../jquery/jquery-3.4.1.js" ></script>
<script>
	$(function(){
		
		/*
		첫번쨰 $.ajax()메소드는 $.load()메소드와 동일한 역할을 한다. 외부에 정의된
		js파일을 현재문서로 로딩한 후 MyAlert()함수를 호출한다.
		*/
		$.ajax({
			//서버의 페이지경로(form의 action과 동일)
			url : './common/04JsData.js',
			//서버로 전송할 전송방식
			type : 'get',
			//응답결과의 데이터형식
			dataType : 'script',
			//요청성공시 콜백 메소드
			success : function(){
				MyAlert("tube","안녕튜브");
			},
			//요청실패시 콜백메소드 : 외부 JSgkatnfh wjddmlgka.
			//반드시 함수의 이름만 명시해야함.
			error : errFunc
		});
		
		$('#ajaxBtn').click(function(){
			$.ajax({
				url : './common/02PrintToday.jsp',
				dataType : "html",
				type : "get",
				contentType : "text/html;charset:utf-8",
				//서버로 전송되는 파라미터(JSON형태로 조립후 전송해야함.)
				data : {
					msg: $(this).text(),
					varStr : "$.ajax()메소드 열라 짱 좋아요"
				},
				/*
				콜백메소드 호출시 함수의 이름만으로 호출하게 되고 이때 콜백
				데이터까지 같이 전달된다.
				*/
				success : sucFunc,
				error : errFunc
			});
		});
	});
	
	function sucFunc(resData){
		alert("$.ajax()메소드 요청성공");
		$('#ajaxDisplay').html(resData);
	}
	function errFunc(){
		alert("에러발생, 디버깅하세요!");
	}
</script>
</head>
<body>
	<h2>$.ajax() 메소드 실행하기</h2>
	
	<button id="ajaxBtn">ajax()메소드 실행하기</button>
	
	<div id="ajaxDisplay">
		ajax결과를 여기에 디스플레이 합니다.
	</div>
</body>
</html>