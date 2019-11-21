<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DataPassword.jsp</title>
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
<script>
	function checkValidate(f){
		if(f.pass.value==""){
			alert("패스워드를 입력하세요");
			f.pass.focus();
			return false;
		}
	}
</script>
</head>
<body>
	<h2>비회원제 겟판 - 패스워드검증폼</h2>
	
	<!-- 패스워드 검증폼은 파일업로드가 필요없으므로 enctype은 필요없다.
	그러므로 폼값을 받을때는 request객체를 이용한다./ -->
	
	<form action="../DataRoom/DataPassword" name="writeFrm" method="post" onsubmit="return checkValidate(this);">
	
	<!-- idx의 경우 영역에 저장하지 않고 EL의 param내장객체를 통해서 바로 읽어온다.
		View(jsp파일)에서 바로 사용하는 경우에는 EL식으로 즉시 읽어오는 것이 편리하다.
	 -->
	<input type="hidden" name="idx" value="${param.idx }"/>
	<input type="hidden" name="mode" value="${mode }"/>
	<input type="hidden" name="nowPage" value="${param.nowPage }"/>
	
		<table border="1" width=800>
		<colgroup>
			<col width="25%" />
			<col width="*" />
		</colgroup>
			<tr>
				<td>패스워드</td>
				<td>
					<input type="text" name="pass" style="width:30%"/>
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