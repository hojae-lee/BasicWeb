<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Bs05Table.jsp</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<style>
	body{
		font-family: verdana; font-size:12px;
	}
</style>
</head>
<body>
<div class="container">

	<h2>HTML 기본테이블</h2>
	<table border="1">
	    <thead>
	      <tr>
	        <th>Firstname</th>
	        <th>Lastname</th>
	        <th>Email</th>
	      </tr>
	    </thead>
	    <tbody>
	      <tr>
	        <td>John</td>
	        <td>Doe</td>
	        <td>john@example.com</td>
	      </tr>
	      <tr>
	        <td>Mary</td>
	        <td>Moe</td>
	        <td>mary@example.com</td>
	      </tr>
	      <tr>
	        <td>July</td>
	        <td>Dooley</td>
	        <td>july@example.com</td>
	      </tr>
	    </tbody>
  </table>
  
	<h2>부트스트랩 기본테이블</h2>
	<table class="table">
	    <thead>
	      <tr>
	        <th>Firstname</th>
	        <th>Lastname</th>
	        <th>Email</th>
	      </tr>
	    </thead>
	    <tbody>
	      <tr>
	        <td>John</td>
	        <td>Doe</td>
	        <td>john@example.com</td>
	      </tr>
	      <tr>
	        <td>Mary</td>
	        <td>Moe</td>
	        <td>mary@example.com</td>
	      </tr>
	      <tr>
	        <td>July</td>
	        <td>Dooley</td>
	        <td>july@example.com</td>
	      </tr>
	    </tbody>
  	</table>
  
	<h2>줄무늬가 있는 테이블</h2>
	<table class="table table-striped">
	    <thead>
	      <tr>
	        <th>Firstname</th>
	        <th>Lastname</th>
	        <th>Email</th>
	      </tr>
	    </thead>
	    <tbody>
	      <tr>
	        <td>John</td>
	        <td>Doe</td>
	        <td>john@example.com</td>
	      </tr>
	      <tr>
	        <td>Mary</td>
	        <td>Moe</td>
	        <td>mary@example.com</td>
	      </tr>
	      <tr>
	        <td>July</td>
	        <td>Dooley</td>
	        <td>july@example.com</td>
	      </tr>
	    </tbody>
  	</table>  
  	<h2>테두리가 있는 테이블</h2>
  	<table class="table table-bordered">
	    <thead>
	      <tr>
	        <th>Firstname</th>
	        <th>Lastname</th>
	        <th>Email</th>
	      </tr>
	    </thead>
	    <tbody>
	      <tr>
	        <td>John</td>
	        <td>Doe</td>
	        <td>john@example.com</td>
	      </tr>
	      <tr>
	        <td>Mary</td>
	        <td>Moe</td>
	        <td>mary@example.com</td>
	      </tr>
	      <tr>
	        <td>July</td>
	        <td>Dooley</td>
	        <td>july@example.com</td>
	      </tr>
	    </tbody>
  	</table>
  	<h2>hover효과가 있는 테이블</h2>
  	<table class="table table-hover">
	    <thead>
	      <tr>
	        <th>Firstname</th>
	        <th>Lastname</th>
	        <th>Email</th>
	      </tr>
	    </thead>
	    <tbody>
	      <tr>
	        <td>John</td>
	        <td>Doe</td>
	        <td>john@example.com</td>
	      </tr>
	      <tr>
	        <td>Mary</td>
	        <td>Moe</td>
	        <td>mary@example.com</td>
	      </tr>
	      <tr>
	        <td>July</td>
	        <td>Dooley</td>
	        <td>july@example.com</td>
	      </tr>
	    </tbody>
  	</table>
  	
  	<h2>줄무늬 hover 테두리 모두 있는 테이블</h2>
  	<table class="table table-hover table-bordered table-striped">
	    <thead>
	      <tr class="bg-success text-center">
	        <th>Firstname</th>
	        <th>Lastname</th>
	        <th class="text-danger">Email</th>
	      </tr>
	    </thead>
	    <tbody>
	      <tr class="table-info">
	        <td>John</td>
	        <td>Doe</td>
	        <td>john@example.com</td>
	      </tr>
	      <tr class="table-info">
	        <td>Mary</td>
	        <td>Moe</td>
	        <td>mary@example.com</td>
	      </tr>
	      <tr>
	        <td>July</td>
	        <td>Dooley</td>
	        <td>july@example.com</td>
	      </tr>
	    </tbody>
  	</table>
  	
  	<h2>테이블 셀에 컬러 적용하기</h2>
  	<table class="table table-hover">
	    <thead>
	      <tr>
	        <th>Firstname</th>
	        <th>Lastname</th>
	        <th>Email</th>
	      </tr>
	    </thead>
	    <tbody>
	      <tr>
	        <td>Default</td>
	        <td>Defaultson</td>
	        <td>def@somemail.com</td>
	      </tr>      
	      <tr class="table-primary">
	        <td>Primary</td>
	        <td>Joe</td>
	        <td>joe@example.com</td>
	      </tr>
	      <tr class="table-success">
	        <td>Success</td>
	        <td>Doe</td>
	        <td>john@example.com</td>
	      </tr>
	      <tr class="table-danger">
	        <td>Danger</td>
	        <td>Moe</td>
	        <td>mary@example.com</td>
	      </tr>
	      <tr class="table-info">
	        <td>Info</td>
	        <td>Dooley</td>
	        <td>july@example.com</td>
	      </tr>
	      <tr class="table-warning">
	        <td>Warning</td>
	        <td>Refs</td>
	        <td>bo@example.com</td>
	      </tr>
	      <tr class="table-active">
	        <td>Active</td>
	        <td>Activeson</td>
	        <td>act@example.com</td>
	      </tr>
	      <tr class="table-secondary">
	        <td>Secondary</td>
	        <td>Secondson</td>
	        <td>sec@example.com</td>
	      </tr>
	      <tr class="table-light">
	        <td>Light</td>
	        <td>Angie</td>
	        <td>angie@example.com</td>
	      </tr>
	      <tr class="table-dark text-dark">
	        <td>Dark</td>
	        <td>Bo</td>
	        <td>bo@example.com</td>
	      </tr>
	    </tbody>
  	</table>
  	
  	<h2>반응형 테이블</h2>
  	<div class="table-responsive">
	    <table class="table table-bordered">
	      <thead>
	        <tr>
	          <th>#</th>
	          <th>Firstname</th>
	          <th>Lastname</th>
	          <th>Age</th>
	          <th>City</th>
	          <th>Country</th>
	          <th>Sex</th>
	          <th>Example</th>
	          <th>Example</th>
	          <th>Example</th>
	          <th>Example</th>
	          <th>Example</th>
	          <th>Example</th>
	          <th>Example</th>
	          <th>Example</th>
	          <th>Example</th>
	          <th>Example</th>
	          <th>Example</th>
	          <th>Example</th>
	        </tr>
	      </thead>
	      <tbody>
	        <tr>
	          <td>1</td>
	          <td>Anna</td>
	          <td>Pitt</td>
	          <td>35</td>
	          <td>New York</td>
	          <td>USA</td>
	          <td>Female</td>
	          <td>Yes</td>
	          <td>Yes</td>
	          <td>Yes</td>
	          <td>Yes</td>
	          <td>Yes</td>
	          <td>Yes</td>
	          <td>Yes</td>
	          <td>Yes</td>
	          <td>Yes</td>
	          <td>Yes</td>
	          <td>Yes</td>
	          <td>Yes</td>
	        </tr>
	      </tbody>
	    </table>
  	</div>
</div>
</body>
</html>