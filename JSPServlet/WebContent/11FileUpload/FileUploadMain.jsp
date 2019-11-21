<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FileUploadMain.jsp</title>
<script>
	function isValidate(f) {
		if(f.chumFile1.value==""){
			alert("파일1을 선택하세요");
			return false;
		}
		if(f.chumFile2.value==""){
			alert("파일2을 선택하세요");
			return false;
		}
	}
	
	function isValidate2(f) {
		if(f.chumFile1.value==""){
			alert("파일1을 선택하세요");
			return false;
		}
	}
</script>
</head>
<body>
	<h2>파일 업로드 폼(DB처리x)</h2>
	
	<h4 style="color:red">${errorMessage }</h4>
	
	<a href="FileList.jsp">파일목록 바로가기</a>
	
	<form action="UploadProc.jsp" name="fileFrm" method="post" enctype="multipart/form-data" onsubmit="return isValidate(this)">
		작성자 : <input type="text" name="name" value="재토쌍" />
		<br />
		제목 : <input type="text" name="title" value="파일업로드 Test"/>
		<br />
		
		관심사항 : 
		<input type="checkbox" name="inter" value="정치" checked="checked"/>정치
		<input type="checkbox" name="inter" value="경제" checked="checked"/>경제
		<input type="checkbox" name="inter" value="문화" />문화
		<br />
		
		첨부파일1 :
			<input type="file" name='chumFile1' />
			<br />
		첨부파일2 :
			<input type="file" name='chumFile2' />
			<br />
			<input type="submit" value="파일업로드GOGO"/>
	</form>
	
	<h2>파일업로드 DB처리 후 원본파일명으로 다운로드</h2>
	
	<form action="UploadDBProc.jsp" name="fileFrm2" method="post" enctype="multipart/form-data" onsubmit="return isValidate2(this)">
		작성자 : <input type="text" name="name" value="재토쌍" />
		<br />
		제목 : <input type="text" name="title" value="파일업로도 Test"/>
		<br />
		
		관심사항 : 
		<input type="checkbox" name="inter" value="정치" checked="checked"/>정치
		<input type="checkbox" name="inter" value="경제" checked="checked"/>경제
		<input type="checkbox" name="inter" value="문화" />문화
		<br />
		
		첨부파일1 :
			<input type="file" name='chumFile1' />
			<br />
			<input type="submit" value="파일업로드GOGO"/>
	</form>
</body>
</html>