<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JQ15Form01.jsp</title>
<script src="../jquery/jquery-3.4.1.js" ></script>
<script>
$(function(){
	/*
	태그선택자 input과 : input의 차이점
		input => input 태그만 선택한다.
		:input => input 태그를 포함하여 문서내의 모든 폼 엘리먼트를 선택한다.
			textarea,select가 포함된다.
	*/
	$('#btn1').click(function(){
		alert("input의 갯수는:"+$('input').length);
		alert("문서내 모든 폼요소의 갯수는:"+$(':input').length);
	});
	/*
	태그명과 속성값 가져오기
	-태그명 : 선택자.get(0).tagName 혹은 선택자.tagName으로 가져올수있따.
	-속성값 : 선택자.attr(속성명) 으로 가져온다.
	*/
	$('#btn2').click(function(){
		var str="";
		$(':input').each(function(){
			str += "태그명:"+ this.tagName;
			str +="\n";
			str +="Type의속성값:"+$(this).attr('type');
			str += "\n";
		});
		alert(str);
	});
	/*
	val(): 해당엘리먼트 value값을 가져오거나 설정할떄 사용하는 메소드
	*/
	$('#btn3').click(function(){
		$(':text').css('backgroundColor','silver');
		alert('#text1의 value값'+ $('#text1').val());
		
		var txtVal = $('#text2').val($('#text1').val());
		alert("txt1의 내용이 txt2로 복사됨");
	});
	
	 /* 연습문제]비밀번호 확인기능 구현하기
	1.암호1을 입력할때 무조건 암호2 부분을 비워준다.
	2.암호2 부분을 입력할때 암호가 일치하게 되면 
	<span id="msg"> 부분의 텍스트를 빨간색으로 표현한다.
	3.암호가 틀렸을때 -> 암호가틀립니다(검은색)
	암호가 일치할때 -> 암호가일치합니다(빨간색) */	 
	
	$('#pwd1').keyup(function(){
		var pwd1 = $(this).val();
		
		if(pwd1 !=null){
			$('#pwd2').val("");
			$('#msg').text("");
			$('#msg').html("");
		}
	});
	
	$('#pwd2').keyup(function(){
		var pwd1 = $('#pwd1').val();
		var pwd2 = $(this).val();
		var a = 1;
		
		if(pwd1 == pwd2){
			while(a<5){
				$('#msg').html('<h2>암호가 일치합니다.</h2>').css('color','red').animate({height:'+=100px', opacity:'0.6'},'slow');
				a++;
			}
		}
		else{
			$('#msg').text('암호가 틀립니다.').css('color','black');
		}
	});
	
	$('#selectEmail').change(function(){
		var text = $('#selectEmail option:selected').text();
		var value = $('#selectEmail option:selected').val();
		
		alert('선택한 항목의 text:'+text+", value:"+value);
		
		$('#email2').val(value);
	});
	
});
</script>
</head>
<body>
	<h2>form요소와 jQuery</h2>
	<input type="text" name="text1" id="text1" value="노트북"/>
	<br />
	<input type="text" name="text2" id="text2" value=""/>
	<br />
	<input type="password" name="passwd" />
	<br />
	<textarea name="textarea" id="" cols="50" rows="10">나는개발자다</textarea>
	<br />
	<select name="select" id="">
		<option value="A">에이</option>
		<option value="B">비이</option>
		<option value="C">씨이</option>
	</select>
	<br />
	<input type="checkbox" name="checkbox" />나는체크박스다
	<br />
	<input type="hidden" value="hidden"/>여긴hidden박스
	<br />
	<input type="submit" value="submit버튼"/>
	<br />
	<div style="margin-top: 50px;">
		<button id="btn1" type="button">버튼1</button>
		<button id="btn2" type="button">버튼2</button>
		<button id="btn3">버튼3</button>	
	</div>
	
	<h3>비밀번호 확인가능</h3>
	<span id="msg"></span>
	<br />
	암호입력 : <input type="password" id="pwd1"/>
	<br />
	암호입력 : <input type="password" id="pwd2"/>
	
	<h3>선택상자에서 선택된값을 텍스트상자에 출력하기</h3>
	이메일 : <input type="text" id="email1" style="width=100px;"/>
	@ <input type="text" id="email2" style="width=150px;"/>
	<select name="" id="selectEmail">
		<option value="naver.com">네이버</option>
		<option value="hanmail.net">다음(한메일)</option>
		<option value="gmail.com">구글</option>
	</select>
</body>
</html>