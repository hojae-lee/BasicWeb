<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container">
	<h2>기본 버튼</h2>
	<button type="button" class="btn">Basic</button>
	<button type="button" class="btn btn-primary">Primary</button>
	<button type="button" class="btn btn-secondary">Secondary</button>
	<button type="button" class="btn btn-success">Success</button>
	<button type="button" class="btn btn-info">Info</button>
	<button type="button" class="btn btn-warning">Warning</button>
	<button type="button" class="btn btn-danger">Danger</button>
	<button type="button" class="btn btn-dark">Dark</button>
	<button type="button" class="btn btn-light">Light</button>
	<button type="button" class="btn btn-link">Link</button>
	<button type="button">HTML 기본 버튼</button>
	<h2>외곽선만 있는 버튼</h2>
	<button type="button" class="btn btn-outline-primary btn-lg">Primary btn-lg적용</button>
	<button type="button" class="btn btn-outline-secondary btn-sm">Secondary btn-sm적용</button>
	<button type="button" class="btn btn-outline-success">Success</button>
	<button type="button" class="btn btn-outline-info">Info</button>
	<button type="button" class="btn btn-outline-warning">Warning</button>
	<button type="button" class="btn btn-outline-danger">Danger</button>
	<button type="button" class="btn btn-outline-dark">Dark</button>
	<button type="button" class="btn btn-outline-light text-dark">Light</button>
	
	<h2>Spinner효과가 있는 버튼</h2>
	<button class="btn btn-primary">
	  <span class="spinner-border spinner-border-sm"></span>
	</button>
	
	<button class="btn btn-primary">
	  <span class="spinner-border spinner-border-sm"></span>
	  Loading..
	</button>
	
	<button class="btn btn-primary" disabled>
	  <span class="spinner-border spinner-border-sm"></span>
	  Loading..
	</button>
	
	<button class="btn btn-primary" disabled>
	  <span class="spinner-grow spinner-grow-sm"></span>
	  Loading..
	</button>
	
	<h2>그룹으로 구성된 버튼</h2>
	<div class="btn-group">
	  <button type="button" class="btn btn-primary">Apple</button>
	  <button type="button" class="btn btn-primary">Samsung</button>
	  <button type="button" class="btn btn-primary">Sony</button>
	</div>
	
	<h2>수직형태의 그룹 버튼</h2>
	<div class="btn-group-vertical">
	  <button type="button" class="btn btn-primary">Apple</button>
	  <button type="button" class="btn btn-primary">Samsung</button>
	  <button type="button" class="btn btn-primary">Sony</button>
	</div>
	
	<h2>드롭다운 기능이 있는 버튼그룹</h2>
	<div class="btn-group">
	  <button type="button" class="btn btn-primary">Sony</button>
	  <button type="button" class="btn btn-primary dropdown-toggle dropdown-toggle-split" data-toggle="dropdown">
	    <span class="caret"></span>
	  </button>
	  <div class="dropdown-menu">
	    <a class="dropdown-item" href="#">Tablet</a>
	    <a class="dropdown-item" href="#">Smartphone</a>
  	  </div>
	</div>
	
	<h2>드롭다운 기능이 있는 버튼그룹 - 수직버튼형</h2>
	<div class="btn-group-vertical ">
		<button type="button" class="btn btn-primary">Apple</button>
		<button type="button" class="btn btn-primary">Samsung</button>
	  	<div class="btn-group">
			<button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown">
			   Sony
			</button>
		    <div class="dropdown-menu">
				<a class="dropdown-item" href="#">Tablet</a>
				<a class="dropdown-item" href="#">Smartphone</a>
		    </div>
	  	</div>
	</div>
	
	<h2>드롭다운 기능이 있는 버튼그룹 - 수직버튼형(커스텀)</h2>
	<div class="row" style="border: 1px solid red;">
		<div class="col-sm-4" style="border: 1px solid red;">
			<div class="btn-group-vertical btn-block">
				<button type="button" class="btn btn-primary">Apple</button>
				<button type="button" class="btn btn-primary">Samsung</button>
			  	<div class="btn-group">
					<button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown">
					   Sony
					</button>
				    <div class="dropdown-menu">
						<a class="dropdown-item" href="#">Tablet</a>
						<a class="dropdown-item" href="#">Smartphone</a>
				    </div>
			  	</div>
			</div>
		</div>
		<div class="col-sm-8" style="border: 1px solid red;">
			<h2>컨텐츠영역</h2>
		</div>
	</div>
</div>
</body>
</html>