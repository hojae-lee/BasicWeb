<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>DataWrite.jsp</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script>
	function checkValidate(f){
		if(f.name.value==""){
			alert("이름을 입력하세요");
			f.name.focus();
			return false;
		}
		
		if(f.pass.value==""){
			alert("패스워드를 입력하세요");
			f.pass.focus();
			return false;
		}
		if(f.title.value==""){
			alert("제목을 입력하세요");
			f.title.focus();
			return false;
		}
		if(f.content.value==""){
			alert("내용을 입력하세요");
			f.content.focus();
			return false;
		}
	}
</script>
</head>
<body>
	<h2>비회원제 게시판 - 글쓰기 폼</h2>
	
	<!-- 파일업로드를 위해서는 반드시 enctype을 선언해야 한다. 그렇지 않으면 파일은 서버로 전송되지 않는다. -->
	<form action="../DataRoom/DataWrite" name="writeFrm" method="post" enctype="multipart/form-data" onsubmit="return checkValidate(this);">
		<table border="1" width=800>
		<colgroup>
			<col width="25%" />
			<col width="*" />
		</colgroup>
			<tr>
				<td>작성자</td>
				<td>
					<input type="text" name="name" style="width:50%"/>
				</td>
			</tr>
			<tr>
				<td>패스워드</td>
				<td>
					<input type="text" name="pass" style="width:30%"/>
				</td>
			</tr>
			<tr>
				<td>제목</td>
				<td>
					<input type="text" name="title" style="width:90%"/>
				</td>
			</tr>
			<tr>
				<td>내용</td>
				<td>
					<textarea name="content" style="width:90%; height: 200px;"></textarea>
				</td>
			</tr>
			<tr>
				<td>첨부파일</td>
				<td>
					<input type="file" name="attachedfile" style="width:90%;" />
				</td>
			</tr>
			<tr>
				<td colspan="2" align = "center"> 
					<button type="submit">작성완료</button>
					<button type="reset">reset</button>
					<button type="button" onclick="location.href='../DataRoom/DataList';">리스트바로가기</button>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>