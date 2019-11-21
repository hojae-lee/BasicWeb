<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DataReply.jsp</title>
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
	<h2>비회원제 게시판 - 답변글 작성폼</h2>
	
	<!-- 파일업로드를 위해서는 반드시 enctype을 선언해야 한다. 그렇지 않으면 파일은 서버로 전송되지 않는다. -->
	<form action="../DataRoom/DataReply" name="writeFrm" method="post" enctype="multipart/form-data" onsubmit="return checkValidate(this);">
		<input type="hidden" name="idx" value="${dto.idx }"/>
		<input type="hidden" name="nowPage" value="${param.nowPage }"/>
		<input type="hidden" name="originalfile" value="${dto.attachedfile }"/>
		<!-- 답변글 처리를 위한 추가 hidden폼 -->
		<!--
			답변글은 원본글과 동일한 그룹번호를 부여받아야 한다.
			원본글의 step이 0이라면 답변글은 +1 한 값을 부여 받는다.
			indent도 동일하게 +1한 값을 부여받는다.
		  -->
		<input type="hidden" name="bgroup" value="${dto.bgroup }" />
		<input type="hidden" name="bstep" value="${dto.bstep }" />
		<input type="hidden" name="bindent" value="${dto.bindent }" />
		
		<table border="1" width=800>
		<colgroup>
			<col width="20%" />
			<col width="*" />
		</colgroup>
			<tr>
				<td>작성자</td>
				<td>
					<input type="text" name="name" style="width:50%" value=""/>
				</td>
			</tr>
			
			<!-- 패스워드 검증 후 수정페이지로 진입하므로 패스워드 입력창은 필요없다. 
				단, 수정페이지에서 패스워드까지 수정해야 한다면 필요할수도 있으므로 개발정책에 따라
				개발하면 된다.-->
			<tr>
				<td>패스워드</td>
				<td> 
					<input type="text" name="pass" style="width:30%"/>
				</td>
			</tr>
			
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