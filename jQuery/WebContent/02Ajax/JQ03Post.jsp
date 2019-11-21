<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> --%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JQ03Post.jsp</title>
<script src="../jquery/jquery-3.4.1.js" ></script>
<script>
	function checkFrm(){
		var f = document.getElementById("loginFrm");
		f.method = "post";
		f.action = "./common/03PostLogin.jsp";
	}
	
	$(function(){
		$('#btnLogin2').click(function(){
			/*
			$.post()메소드 사용법
			*/
				/*
				1번인자 요청 URL
				*/
			$.post("./common/03PostLogin.jsp",
				/*
				2번인자 : 서버로 전송할 파라미터
				*/
				{
					'user_id':$('#user_id').val(),
					'user_pw':$('#user_pw').val()
				},
				/*
				3번인자 : 콜백메소드(요청 성공시에만 콜백됨)
				*/
				function(responseData){
					/*
					서버로부터 콜배받은 데이터가 JSON형태일떄 파싱을 위한 메소드이다.
					1차적으로 파싱한 후 '참조변수.키값' 의 형태로 값에 접근할수있따.
					*/
					var rData = JSON.parse(responseData);
					if(rData.result==1){
						alert("로그인 성공입니다.");
						var disTxt = "<h3>"+ rData.user_name+
						"("+rData.user_id+")님 반갑습니다.</h3>";
						
						$('#loginTable').html(disTxt);
					}
					else{
						alert("로그인 실패입니다.");
						var disTxt = "<h3>로그인실패ㅜㅠ</h3>";
						
						$('#jsonDisplay').html(disTxt);
					}
			});
		});
	});
	
	
</script>
</head>
<body>
	<div class="container">
		<h2>$.post() 메소드 사용하기</h2>
		<h3>로그인 구현하기 -JDBC연동X</h3>
		<div class="row" id="loginTable">
			<form id="loginFrm" onsubmit="return checkFrm();">
				<table>
					<tr>
						<td>아이디</td>
						<td>
							<input type="text" id="user_id" name="user_id" value="kosmo" />
						</td>
					</tr>
					<tr>
						<td>패스워드</td>
						<td>
							<input type="password" id="user_pw" name="user_pw" value="1234" />
						</td>
					</tr>
				</table>
				<button type="submit" id="btnLogin1">로그인하기(HTML의 submit사용)</button>
				&nbsp;&nbsp;
				<button type="button" id="btnLogin2">로그인하기(jQuery의 $.post()사용)</button>
			</form>
		</div>
		<br />
		<div class="row" id="jsonDisplay">
			JSON 데이터를 뿌려봅시다
		</div>
	</div>
</body>
</html>