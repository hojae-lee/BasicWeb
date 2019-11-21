<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DataEdit.jsp</title>
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
	<h2>비회원제 게시판 - 수정 폼</h2>
	
	<!-- 파일업로드를 위해서는 반드시 enctype을 선언해야 한다. 그렇지 않으면 파일은 서버로 전송되지 않는다. -->
	<form action="../DataRoom/DataEdit" name="writeFrm" method="post" enctype="multipart/form-data" onsubmit="return checkValidate(this);">
		<input type="hidden" name="idx" value="${dto.idx }"/>
		<input type="hidden" name="nowPage" value="${param.nowPage }"/>
		<!-- 기본에 등록한 파일이 있는 경우 수정시 파일을 첨부하지 않으면 기존파일을 유지해야 하므로
		별도의 hidden폼이 필요함 즉 새로운 파일을 등록하면 새로운값으로 업데이트하고 파일을 등록하지 않으면
		기존파일명으로 데이터를 유지한다. -->
		<input type="hidden" name="originalfile" value="${dto.attachedfile }"/>
		
		<table border="1" width=800>
		<colgroup>
			<col width="20%" />
			<col width="*" />
		</colgroup>
			<tr>
				<td>작성자</td>
				<td>
					<input type="text" name="name" style="width:50%" value="${dto.name }"/>
				</td>
			</tr>
			
			<!-- 패스워드 검증 후 수정페이지로 진입하므로 패스워드 입력창은 필요없다. 
				단, 수정페이지에서 패스워드까지 수정해야 한다면 필요할수도 있으므로 개발정책에 따라
				개발하면 된다.-->
			<!-- <tr>
				<td>패스워드</td>
				<td>
					<input type="text" name="pass" style="width:30%"/>
				</td>
			</tr> -->
			
			<tr>
				<td>제목</td>
				<td>
					<input type="text" name="title" style="width:90%" value="${dto.title }"/>
				</td>
			</tr>
			<tr>
				<td>내용</td>
				<td>
					<textarea name="content" style="width:90%; height: 200px;">${dto.content }</textarea>
				</td>
			</tr>
			<tr>
				<td>첨부파일</td>
				<td>
					파일명 : ${dto.attachedfile } <br />
					<input type="file" name="attachedfile" style="width:90%;" />
				</td>
			</tr>
			<tr>
				<td colspan="2" align = "center">
					<button type="submit">작성완료</button>
					<button type="reset">reset</button>
					<button type="button" onclick="location.href='../DataRoom/DataList?nowPage=${param.nowPage}';">리스트바로가기</button>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>