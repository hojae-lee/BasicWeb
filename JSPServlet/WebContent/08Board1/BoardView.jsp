<%@page import="model.BbsDTO"%>
<%@page import="model.BbsDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
/*
게시글 상세보기 페이지는 작성자 보인이 아니더라도 자유롭게 열람할수 있어야 한다.
대신 수정 삭제의 경우는 작성자 본인만 가능하도록 처리해야한다.
즉 회원인증이 없어도 해당 페이지는 접근 가능하다.
*/
String num = request.getParameter("num");
BbsDAO dao = new BbsDAO(application);
//해당 게시물의 조회수를 +1 증가시킨다.
dao.updateVisitCount(num);

BbsDTO dto = dao.selectView(num);

dao.close();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BoardView.jsp</title>
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

	<h2>회원제 게시판 - 상세보기</h2>
	
	<script>
	function isDelete(){
		var c = confirm("정말로 삭제하시겠습니까?");
		if(c){
			var f= document.writeFrm;
			f.action = "DeleteProc.jsp";
			f.submit();
		}
	}
	</script>
	
	<form name="writeFrm" method="post">
	<!-- 일련번호만삭제가능함. -->
	<input type="hidden" name="num" value="<%=num %>" />
		<table border="1" width=800>
			<tr>
				<td>번호</td>
				<td><%=dto.getNum() %></td>
				<td>작성자</td>
				<td><%=dto.getId() %></td>
			</tr>
			
			<tr>
				<td>작성일</td>
				<td><%=dto.getPostDate() %></td>
				<td>조회수</td>
				<td><%=dto.getVisitcount() %></td>
			</tr>
			
			<tr>
				<td>제목</td>
				<td colspan="3">
					<%=dto.getTitle() %>
				</td>
			</tr>
			<tr>
				<td>내용</td>
				<td colspan="3">
				<!-- textarea에서 엔터키로 줄바꿈을 하면 DB에 저장될 때 \r\n으로 저장되므로 html에서 출력할떄는
				반드시 br태그로 문자를 변경하도록 한다. -->
					<%=dto.getContent().replace("\r\n","<br/>")%>
				</td>
			</tr>
			<tr>
				<td colspan="4" align = "center">
				<%
				/*
				로그인이 완료된 상태이면서 동시에 해당 게시물의 작성자라면 수정 삭제 버튼을 보이게 처리한다.
				*/
				if(session.getAttribute("USER_ID")!=null && session.getAttribute("USER_ID").toString().equals(dto.getId())){ 
				%>
					<!-- 수정 삭제의 경우 특정 게시물에 대해 수행하는 작업이므로 반드시 일련번호(PK)가 파라미터로
					전달되어야 한다. -->
					<button type="button" onclick="location.href='BoardEdit.jsp?num=<%=dto.getNum()%>';">수정하기</button>
					<!-- 회원제 게시판에서 삭제처리는 별도의 폼이 필요없이 사용자에 대한 인증처리만 바로 삭제처리한다. -->
					<button type="button" onclick="isDelete();">삭제하기</button>
				<%
				}
				%>
					<button type="button" onclick="location.href='BoardList.jsp';">리스트바로가기</button>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>