<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>02FormAction.jsp</title>
<script>
	function frmCheck(){
		var f = document.frm;
		
		f.action ="02FormResult.jsp";
		f.method ="post";
	}
</script>
</head>
<body>
	<h2>폼값 전송하기</h2>
	<form action="" name="frm" onsubmit="return frmCheck();">
	<ul>
		<li>
			이름 : <input type="text" name="name"/>
		</li>
		<li>
			성별 : 
				<input type="radio" name="gender" value="Man"/>남자
				<input type="radio" name="gender" value="Woman"/>여자
		</li>
		<li>
			관심사항 :
				<input type="checkbox" name="inter" value="po1"/>정치
				<input type="checkbox" name="inter" value="eco"/>경제
				<input type="checkbox" name="inter" value="ent"/>연예
				<input type="checkbox" name="inter" value="spo"/>운동
		</li>
		<li>
			학력 :
				<select name="grade" id="">
					<option value="ele">초딩</option>
					<option value="mid">중딩</option>
					<option value="high">고딩</option>
					<option value="uni">대딩</option>
				</select>
		</li>
		<li>
			<input type="submit" value="전송하기"/>
		</li>
	</ul>
	</form>
</body>
</html>