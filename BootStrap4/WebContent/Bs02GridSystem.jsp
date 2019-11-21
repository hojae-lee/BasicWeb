<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Bs02GridSystem.jsp</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<style>
	.box1{border: 1px solid black; background-color: red;}
	.box2{border: 1px solid black; background-color: green;}
	.box3{border: 1px solid black; background-color: blue;}
</style>
</head>
<body>
<!-- 
	부트스트랩의 그리드 시스템
		:페이지 전체를 12개로 나눌수 있는 컬럼을 제공하여 사용자가 원하는대로 레이아웃을 구성할 수 있도록 한다.
		사용법 : col-디바이스클래스명-컬럼크기
			디바이스클래스명
			sm : phone
			md : tablets
			lg : small laptops
			xl : laptips and desktops
		하나의 레이어를 작성할 때 row클래스를 사용한다.
 -->
<div class="container">
	<div class="row">
		<div class="col box1">같은비율1</div>
		<div class="col box2">같은비율2</div>
		<div class="col box3">같은비율3</div>
	</div>
	<div class="row">
		<div class="col-sm-3 box1">col-sm-3 1</div>
		<div class="col-sm-3 box2">col-sm-3 2</div>
		<div class="col-sm-3 box3">col-sm-3 3</div>
		<div class="col-sm-3 box1">col-sm-3 4</div>
	</div>
	<div class="row">
		<div class="col-md-3 box1">col-md-3 1</div>
		<div class="col-md-3 box2">col-md-3 2</div>
		<div class="col-md-3 box3">col-md-3 3</div>
		<div class="col-md-3 box1">col-md-3 4</div>
	</div>
	<div class="row">
		<div class="col-lg-3 box1">col-lg-3 1</div>
		<div class="col-lg-3 box2">col-lg-3 2</div>
		<div class="col-lg-3 box3">col-lg-3 3</div>
		<div class="col-lg-3 box1">col-lg-3 4</div>
	</div>
	<div class="row">
		<div class="col-xl-3 box1">col-xl-3 1</div>
		<div class="col-xl-3 box2">col-xl-3 2</div>
		<div class="col-xl-3 box3">col-xl-3 3</div>
		<div class="col-xl-3 box1">col-xl-3 4</div>
	</div>
	<div class="row">
		<div class="col-sm-4 box1">col-sm-4 1</div>
		<div class="col-sm-8 box2">col-sm-8 2</div>
	</div>
</div>
</body>
</html>