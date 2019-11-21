<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JQ01LoadMain.jsp</title>
<style>
	div{
		width:400px; height:100px; border:1px solid black;
		margin-top: 50px;
	}
</style>
<script src="../jquery/jquery-3.4.1.js" ></script>
<script>
$(function(){
	$('#loadTxtBtn').click(function(){
		$('#loadTxt').load("./common/01LoadTxt.txt");
		alert("문서가 로드되었습니다.");
	});
	
	$('#loadParamBtn').click(function(){
		var radioVar = $('input[type="radio"][name="params"]:checked').val();
		var params = {'params':radioVar};
		$('#loadParam').load('./common/01LoadParam.jsp', params);
	});
	
});
	
	function jspLoadCode(){
		$('#loadJsp').load('./common/01LoadSub.jsp');
		alert("JSP문서가 로드되었습니다.")
	}
	
</script>
</head>
<body>
	<h2>$.load()메소드 사용하기</h2>
	<h3>txt파일 로드하기</h3>
	<div id="loadTxt">
		여긴 loadTxt영역입니다. 텍스트 파일의 내용을 비동기방식으로 로드합니다.
	</div>
	<button id="loadTxtBtn">
		Load()테스트1(txt)파일
	</button>
	
	<h3>jsp파일 로드하기</h3>
	<div id="loadJsp">
		여긴 loadJsp영역입니다. 텍스트 파일의 내용을 비동기방식으로 로드합니다.
	</div>
	<button id="loadJspBtn" onclick="jspLoadCode();">
		Load()테스트2(txt)파일
	</button>
	
	<h3>파라미터로 구분해서 로드하기</h3>
	<div id="loadParam">
		파라미터 영역입니다.
	</div>
	<label> 
		<input type="radio" name="params" value="good"/>Good
	</label>
		<input type="radio" name="params" id="p2" value="bad"/>
		<label for="p2">
			Bad
		</label>
	<button id="loadParamBtn">
		Load()테스트3(파라미터 구분)
	</button>
	
</body>
</html>