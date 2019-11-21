<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 
뷰포트(Viewport)
	width = device-width : 단말기의 화면폭에 따라 페이지의 가로폭을 재설정함 디바이스에 따라 스케일이 달라지게
	되는데 이를 100%의 스케일에서 CSS픽셀들로 계산된 화면의 폭을 의미한다.
	initial-scale=1 : 페이지가 처음 브라우저에 의해 로딩된 초기 줌 레벨을 설정한다.
	즉 초기확대값을 설정하는 값이다.
 -->
 <meta name="viewport" content="width=device-width, initial-scale=1">
<title>Bs01GetStarted</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<style>
	div{
		border:1px solid red;
	}
</style>
</head>
<body>

<!-- container 클래스는 반응형 변동폭 컨테이너를 제공한다. -->
<div class="container">
  <h1>나의 첫번째 Bootstrap Page</h1>
  <p>변동폭 컨테이너 좌우측에 약간의 공백있음.</p> 
</div>

<!-- container-fluid 클래스는 뷰포트의 전체폭에 펼쳐진 전체폭 컨테이너를 제공한다. -->
<div class="container-fluid">
  <h1>처음 만들어보는 Bootstrap Page</h1>
  <p>고정폭 컨테이너 좌우측에 공백 없이 화면을 꽉채움.</p> 
</div>
</body>
</html>