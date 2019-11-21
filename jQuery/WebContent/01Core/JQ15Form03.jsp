<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JQ15Form03.jsp</title>
<script src="../jquery/jquery-3.4.1.js" ></script>
<script>
	$(function(){
		$('button[type="submit"]').click(function(){
			if($("input:text[name='id']").val()==""){
				alert('아이디를 입력하세요');
				return false;
			}
			
			if($('#pwd').val().length==0){
				alert("패스워드를 입력하세요");
				return false;
			}
			
			var radioCount =0;
			$('input[type="radio"]:checked').each(function(){
				radioCount++;
			});
			if(radioCount ==0){
				alert("성별을 입력하세요");
				return false;
			}
			var checkCount=0;
			$("input[type='checkbox']:checked").each(function(){
				checkCount++;
			});
			
			if(checkCount<2){
				alert("관심사항을 두개이상 선택하세요");
				return false;
			}
			
			if($("select option:selected").val()=="noValue"){
	            alert("최종학력을 선택하세요");
	            return false;
	        }
	        if($("input[type='file'][name='userfile']").val().length==0){
	            return false;
	        }
	        if($("textarea").val()==""){
	            alert("자기소개를 입력하세요");
	            return false;
	        }
		});
	});
</script>
</head>

<body>
		<h2>jQuery를 이용한 폼 유효성 체크하기</h2>
		
		<form name="registFrm" id="registFrm" 
			method="post" action="http://www.ikosmo.co.kr" >
			<table border="1" cellspacing="0" cellpadding="5">
					<tr>
						<td>아이디</td>
						<td>
			<input type="text" name="id" size="20"/></td>
					</tr>
					<tr>
						<td>비밀번호</td>
						<td>
			<input type="password" name="pwd" id="pwd" size="20" /></td>
					</tr>		
					<tr>
						<td>성별</td>
						<td>
			<input type="radio" name="gender" value="man" />남
			<input type="radio" name="gender" value="woman" />여
			<input type="radio" name="gender" 
				value="trans" />트랜스젠더
						</td>
					</tr>
					<tr>
						<td>관심사항</td>
						<td>
			<input type="checkbox" name="inter" value="pol" />정치
			<input type="checkbox" name="inter" value="eco" />경제
			<input type="checkbox" name="inter" value="spo" />스포츠
			<input type="checkbox" name="inter" value="ent" />연예			
						</td>
					</tr>
					<tr>
						<td>최종학력</td>
						<td>
			<select name="grade">
				<option value="noValue">--선택하세요--</option>
				<option value="ele">초등학교</option>
				<option value="mid">중학교</option>
				<option value="high">고등학교</option>
				<option value="uni">대학교</option>
			</select>			
						</td>
					</tr>
					<tr>
						<td>첨부파일</td>
						<td>
			<input type="file" name="userfile" size="40" /></td>
					</tr>
					<tr>
						<td>자기소개</td>
						<td>
			<textarea name="intro" cols="60" rows="5"></textarea>
						</td>
					</tr>
					<tr>
						<td colspan="2" style="text-align:center;">
			<button type="submit">회원가입하기</button>
			<button type="reset">RESET</button>			
					</td>
					</tr>
			</table>	
		</form>	
</body>

</html>