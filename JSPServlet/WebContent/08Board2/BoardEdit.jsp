<%@page import="model.BbsDAO"%>
<%@page import="model.BbsDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 글작성 페이지 진입전 로그인 체크하기 -->
<%@ include file="../common/isLogin.jsp" %>
<%
/*
수정하기 페이지는 글쓰기 세보기 페이지와 같다 기존에 작성한 내용을 가져와서 글쓰기 폼에 내용을 입력한다. 단
게시물 수정을 위한 hidden폼이 하나 추가적으로 필요하다.
*/
String num = request.getParameter("num");
String nowPage = request.getParameter("nowPage");

BbsDAO dao = new BbsDAO(application);

BbsDTO dto = dao.selectView(num);

//현재 수정페이지에 진입한 사람이 해당글의 작성자인지 확인하여 아닌경우 튕겨낸다.
String session_id = session.getAttribute("USER_ID").toString();
if(!session_id.equals(dto.getId())){
	//작성자 본인이 아니면 튕겨내기
%>
	<script>
		alert("작성자 본인만 수정할수 있습니다.");
		history.go(-1);
	</script>
<%
	return;
}

dao.close();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BoardEdit.jsp</title>
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
	<h2>회원제 겟판 - 글수정하기 폼</h2>
	
	<form action="EditProc.jsp" name="writeFrm" method="post" onsubmit="return checkValidate(this);">
	<!-- 테스트용 입력 : 게시물에대한 수정, 삭제는 일련번호가 이썽야 가능하다. 테스트 완료 후 hidden으로 수정하여 화면에서
	숨김처리 해준다. -->
	<input type="hidden" name="num" value = "<%=dto.getNum()%>"/>
	<input type="hid-den" name="nowPage" value = "<%=nowPage%>"/>
	<%-- <input type="hid-den" name="num" value = "<%=num%>"/> --%>
		<table border="1" width=800>
			<tr>
				<td>제목</td>
				<td>
					<input type="text" name="title" style="width:90%" value="<%=dto.getTitle() %>"/>
				</td>
			</tr>
			<tr>
				<td>내용</td>
				<td>
					<textarea name="content" style="width:90%; height: 200px;"><%=dto.getContent() %></textarea>
				</td>
			</tr>
			<tr>
				<td colspan="2" align = "center">
					<button type="submit">작성완료</button>
					<button type="reset">reset</button>
					<button type="button" onclick="location.href='BoardList.jsp?nowPage=<%=nowPage%>';">리스트바로가기</button>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>