<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Bs07Alerts.jsp</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container">
	
	<h2>Alert기본</h2>
	<div class="alert alert-danger"> 
		<strong>Success!</strong> Indicates a successful or positive action.
	</div>
	
	<h2>링크가 적용된 Alert</h2>
	<div class="alert alert-success">
		<strong>Success!</strong>
	</div>
	
	<h2>닫기기능이 있는 Alert</h2>
	<div class="alert alert-success alert-dismissible">
		<button type="button" class="close" data-dismiss="alert">&times;</button>
		<strong>Success!</strong> Indicates a successful or positive action.
	</div>
	
	<h2>페이드아웃 효과가 있는 Alert</h2>
	<div class="alert alert-success alert-dismissible fade show">
	    <button type="button" class="close" data-dismiss="alert">&times;</button>
	    <strong>Success!</strong> This alert box could indicate a successful or positive action.
  	</div>
</div>
</body>
</html>