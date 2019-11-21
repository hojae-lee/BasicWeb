<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Bs04Colors.jsp</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container">
		<h2>텍스트 컬러</h2>
		<p>텍스트의 컬러를 지정할 때 아래 클래스명을 사용한다.</p>
		<p class="text-muted">This text is muted.</p>
		<p class="text-primary">This text is important.</p>
		<p class="text-success">This text indicates success.</p>
		<p class="text-info">This text represents some information.</p>
		<p class="text-warning">This text represents a warning.</p>
		<p class="text-danger">This text represents danger.</p>
		<p class="text-secondary">Secondary text.</p>
		<p class="text-dark">This text is dark grey.</p>
		<p class="text-body">Default body color (often black).</p>
		<p class="text-light">This text is light grey (on white background).</p>
		<p class="text-white">This text is white (on white background).</p>
		
		<h2>배경색컬러</h2>
		<p>배경색을 아래 클래스로 지정할 수 있다.</p>
		<p>Note that you can also add a .text-* class if you want a different text color:</p> 
		<p class="bg-primary text-white-20">This text is important.</p> 
		<p class="bg-success text-black-80">This text indicates success.</p>
		<p class="bg-info text-white">This text represents some information.</p>
		<p class="bg-warning text-white">This text represents a warning.</p>
		<p class="bg-danger text-white">This text represents danger.</p>
		<p class="bg-secondary text-white">Secondary background color.</p>
		<p class="bg-dark text-white">Dark grey background color.</p>
		<p class="bg-light text-dark">Light grey background color.</p>
	</div>
</body>
</html>