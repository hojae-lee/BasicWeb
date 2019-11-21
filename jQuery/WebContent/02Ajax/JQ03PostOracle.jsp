<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> --%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JQ03PostOracle.jsp</title>
<script src="../jquery/jquery-3.4.1.js" ></script>
<script>
	$(function(){
		$('#btnLogin2').click(function(){
			var s_url = "./common/03PostLoginOracle.jsp";
			
			/*
			$.post메소드를 통해 전달되는 파라미터는 반드시 JSON형태로 조립한 후 전송해야 한다.
			하지만 폼값이 많은 경우에는 작성에 어려움이 있으므로 serializse()메소드를 사용한다.
			input태그의 name속성이 Key가 되고 value 속성이 값이 된다.
			*/
			var params = $('#loginFrm').serialize();
			
			$.post(
				s_url,
				params,
				function(resData){
					var d = JSON.parse(resData);
					if(d.result ==1){
						alert(d.message);
						$('#loginFrm').html(d.html);
						$('#btnLogin2').hide();
					}
					else{
						alert(d.message);
					}
					$('#jsonDisplay').text(resData);
				}
			);
		});
	});
	
	function checkFrm(){
		var f = document.getElementById("loginFrm");
		f.method = "post";
		f.action = "./common/03PostLoginOracle.jsp";
	}
</script>
</head>
<body>
	<div class="container">
		<h2>$.post() 메소드 사용하기</h2>
		<h3>로그인 구현하기 -JDBC연동O(오라클)</h3>
		<div id="loginTable">
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
		<div id="jsonDisplay">
			JSON 데이터를 뿌려봅시다
		</div>
	</div>
</body>
</html>