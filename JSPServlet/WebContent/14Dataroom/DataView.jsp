<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DataView.jsp</title>
<style>
table{
	border: 1px solid;
	border-collapse: collapse;
	border-color: #fbceb1;
}
button{
	border-color:#cb3837; 
	color:white; 
	background-color: #cb3837;
}

</style>
</head> 
<body>

	<h2>비회원제 게시판 - 상세보기</h2>
	
	<!-- 비회원제 게시판의 경우 삭제할 때 패스워드 입력창으로 이동되어야 한다.
		따라서 상세보기 페이지에는 <form>태그가 필요없다. 모든 인증은 패스워드를 통해서 이루어지기 때문이다.
	 -->
		<table border="1" width=90%>
		
		<colgroup>
			<col width="20%"/> 
			<col width="30%"/>
			<col width="20%"/>
			<col width="30%"/> 
		</colgroup>
			<tr>
				<th>작성자</th> 
				<td>${dto.name }</td>
				<th>작성일</th>
				<td>${dto.postdate }</td> 
			</tr>
			
			<tr> 
				<th>다운로드수</th>
				<td>${dto.downcount }</td>
				<th>조회수</th>
				<td>${dto.visitcount }</td>
			</tr>
			 
			<tr>
				<th>제목</th>
				<td colspan="3">
					${dto.title }
				</td>
			</tr>
			<tr>
				<th>내용</th>
				<td colspan="3" height="200"> 
					${dto.content }
				</td> 
			</tr>
			<tr>
				<th>첨부파일</th>
				<td colspan="3">
					<!-- 첨부파일이 있을때만 다운로드 링크 보임 --> 
					<c:if test="${not empty dto.attachedfile }">
						${dto.attachedfile }
						<a href="./Download?filename=${dto.attachedfile }&idx=${dto.idx}">다운로드</a>
					</c:if>
				</td> 
			</tr>
			<tr> 
				<td colspan="4" align = "center">
				<button type="button" class="btn btn-success" onclick="location.href='./DataReply?idx=${param.idx}&nowPage=${param.nowPage }';">답변글달기</button>
					<button type="button" class="btn btn-success" onclick="location.href='./DataPassword?idx=${param.idx}&mode=edit&nowPage=${param.nowPage }';">수정하기</button>
					<button type="button" onclick="location.href='../DataRoom/DataPassword?idx=${dto.idx}&mode=delete&nowPage=${param.nowPage }';">삭제하기</button>
					<button type="button" onclick="location.href='./DataList?nowPage=${param.nowPage}';">리스트바로가기</button>
				</td>
			</tr>
		</table>
</body>
</html>