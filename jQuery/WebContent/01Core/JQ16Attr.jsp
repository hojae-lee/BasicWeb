<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JQ16Attr.jsp</title>
<script src="../jquery/jquery-3.4.1.js" ></script>
<script>
	$(function(){
		/*
		attr()메소드
			:DOM객체에 속성을 부여하거나 가져올떄 사용하는 메소드
			사용법
				방법1 : 선택자.attr('속성명','속성값');
				방법2 : 선택자.attr({'속성명':'속성값'})
		removeAttr() 메소드
			: 객체에 부여된 속성을 제거할 때 사용.
			사용법
				선택자.removeAttr(제거할속성명);
		*/
		$('#btn1').click(function(){
			$('#viewImg').attr('src','../images/amazon.png').attr('width','300px');
		});
		
		$('#btn2').click(function(){
			$('#viewImg').attr('src','../images/naver.png').attr('width',function(){
				return '200px'
			});
		});
		$('#btn3').click(function(){
			$('#viewImg').attr({'src':'../images/chosun.png',width:'400px'});
		});
		$('#btnDel').click(function(){
			var attrName = $('#attrSelect option:selected').val();
			$('#viewImg').removeAttr(attrName);
			alert(attrName+"속성이 제거됨");
		});
	});
</script>
</head>
<body>
	<h2>attr(), removeAttr()메소드</h2>
	
	<div>
		<img src="../images/amazon.png" alt="" id="viewImg" width="500" />
	</div>
	
	<div>
		<button id="btn1">amazon.png로 이미지 변경</button>
		<button id="btn2">naver.png로 이미지 변경</button>
		<button id="btn3">chosun.png로 이미지 변경</button>
	</div>
	
	<div>
		<h3>위 변경 이미지를 먼저 누른 후 속성제거 버튼을 누르시오</h3>
		<select id="attrSelect">
			<option value="src">src속성</option>
			<option value="width">width속성</option>
		</select>
		<button id="btnDel">속성제거</button>
	</div>
</body>
</html>