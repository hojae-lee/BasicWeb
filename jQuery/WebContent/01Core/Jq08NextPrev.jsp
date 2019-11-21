<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Jq08NextPrev.jsp</title>
<script src="../jquery/jquery-3.4.1.js" ></script>
<script>
	$(function(){
	
		/*
		prev() : 선택한 엘리먼트의 이전 엘리먼트를 선택한다.
		next() : 선택한 엘리먼트의 다음 엘리먼트를 선택한다.
		*/
		$('button#next').click(function(){
			$('li.third').prev().css("backgroundColor","blue");
			$('li.third').next().css("fontSize","2em");
		});	
		$('button#prev').click(function(){
			$('li.third').prev().css("backgroundColor","yellow");
			$('li.third').next().css("fontSize","1.2em");
		});
		
		var i=0;
		var size = $('li').length;
		
		$('button#continue').click(function(){
			/*
			eq(인덱스) : 선택한 요소가 여러개일떄 인덱스를 통해 특정요소를 얻어오는 메소드 인덱스 0부터 시작한ㄷ.
			*/
			//현재 선택된 이전요소의 배경을 희색으로 변경
			$('li').eq(i).prev().css('backgroundColor',"red");
			//현재 선택된 요소의 배경색은 노란색으로 변경
			$('li').eq(i).css('backgroundColor',"green");
			
			//인덱스가 0일떄는 마지막요소의 배경을 흰색으로 변경한다.
			if(i==0){
				$('li').eq(size-1).css('backgroundColor','pink');
			}
			
			/*
			li요소의 끝까지 index값이 증가하면 다시 처음으로 토글시키기 위해 0으로 초기화 해주는 로직
			여기서 size는 5이므로 i값이 4가되었을떄의 조건이다.
			*/
			if(size-1 == i){
				i=0;
			}
			else{
				i++;
			}
		});
	});
</script>
</head>
<body>
	<h2>next() / prev() 메소드</h2>
	
	<button id="next">jQuery의 다음요소 얻어오기</button>
	<button id="prev">jQuery의 이전요소 얻어오기</button>
	<button id="continue">연속해서 배경색 바꾸기</button>
	
	<ul>
		<li>JAVA</li> <!-- 0번인덱스-->		
		<li>HTML5</li>
		<li class="third">JSP->여기가 third</li>
		<li>jQuery</li>
		<li>Spring</li> <!-- 4번인덱스 -->
	</ul>
	
</body>
</html>