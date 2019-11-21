<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jQ10SlideUpDown.jsp</title>
<script src="../jquery/jquery-3.4.1.js" ></script>
<style>
	div{
		margin:10px;
	}
	#panel, #flip{
		padding:5px; text-align:center;
		background-color: #e5eecc;
		border: 1px solid #c3c3c3;
	}
	#panel{
		padding:50px;
	}
	.title{background-color: #ff99ff;}
	.content{background-color: #ffff33;}
	
	button{
		background-color: blue;
	}
</style>
<script>
	$(function(){
		$('.content').hide();
		//또한 제목 부분의 스타일을 아래와 같이 변경함.
		$('.title').css('fontSize','1.5em').css('cursor','pointer');
		
		/*
		slideToggle(시간) : 해당 시간만큼 slideUp/slideDown 효과가 토글되면서 적용됨.
		slideUp(시간) : 패널이 닫히는 효과
		slideDown(시간) : 패널이 열리는 효과
		*/
		$('.title').click(function(){
			$(this).next().slideToggle(1000);
		});
		//시간을 기술하는 대신 slow, fast와 같이 적용해도 됨.
		$('.s_up').click(function(){
			$('#panel').slideUp('fast');
		});
		$('.s_down').click(function(){
			$('#panel').slideDown(2500);
		});
	});
</script>
</head>
<body>
	<h2>slideUp() / slideDown() / slideToggle() 메소드</h2>
	<div class="title">제목1입니다.</div>
	
	<div class="content">
		내용1입니다. <br />
		내용1입니다. <br />
		내용1입니다. <br />
		내용1입니다. <br />
	</div>
	
	<div class="title">
		제목2입니다.
	</div>
	<div class="content">
		내용2입니다. <br />
		내용2입니다. <br />
		내용2입니다. <br />
		내용2입니다. <br />
	</div>
	
	<div class="title">
		제목3입니다.
	</div>
	
	<div class="content">
		내용3입니다. <br />
		내용3입니다. <br />
		내용3입니다. <br />
		내용3입니다. <br />
	</div>
	
	<div id="flip">
		<button class="s_up">slideup()메소드</button>
		<button class="s_down">slidedown()메소드</button>
	</div>
	<div id="panel">
		Hello Panel...!!!!!! <br />
		Hello Panel...!!!!!! <br />
		Hello Panel...!!!!!! <br />
		Hello Panel...!!!!!! <br />
		Hello Panel...!!!!!! <br />
	</div>
</body>
</html>