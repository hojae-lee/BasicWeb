<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- 글작성 페이지 진입전 로그인 체크하기 -->
<%@ include file="../common/isLogin.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BoardWrite.jsp</title>
<script>
	function checkValidate(f){
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
	<h2>회원제 겟판 - 글쓰기 폼</h2>
	
	<form action="WriteProc.jsp" name="writeFrm" method="post" onsubmit="return checkValidate(this);">
		<table border="1" width=800>
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
				<td colspan="2" align = "center">
					<button type="submit">작성완료</button>
					<button type="reset">reset</button>
					<button type="button" onclick="location.href='BoardList.jsp';">리스트바로가기</button>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>